#!/usr/bin/env swift
import Foundation

#if os(Linux)
import Glibc
#else
import Darwin
#endif

struct PreviewError: Error, CustomStringConvertible {
    let description: String
}

struct CommandError: Error, CustomStringConvertible {
    let executable: String
    let exitCode: Int32

    var description: String {
        "\(executable) exited with status \(exitCode)."
    }
}

/// Run a CLI directly, passing arguments and JSON input without a shell.
@discardableResult
func run(
    _ executable: String,
    _ arguments: [String],
    input: Data? = nil,
    suppressErrors: Bool = false
) throws -> String {
    let process = Process()
    process.executableURL = URL(fileURLWithPath: "/usr/bin/env")
    process.arguments = [executable] + arguments
    let output = Pipe()
    process.standardOutput = output
    process.standardError = suppressErrors ? FileHandle.nullDevice : FileHandle.standardError
    let standardInput = input.map { _ in Pipe() }
    if let standardInput {
        process.standardInput = standardInput
    } else {
        process.standardInput = FileHandle.nullDevice
    }

    try process.run()
    if let input, let standardInput {
        try standardInput.fileHandleForWriting.write(contentsOf: input)
        try standardInput.fileHandleForWriting.close()
    }
    // Drain stdout before waiting so commands cannot block on a full pipe.
    let data = output.fileHandleForReading.readDataToEndOfFile()
    process.waitUntilExit()
    guard process.terminationReason == .exit, process.terminationStatus == 0 else {
        let exitCode =
            process.terminationReason == .exit
            ? process.terminationStatus : 128 + process.terminationStatus
        throw CommandError(executable: executable, exitCode: exitCode)
    }
    return String(decoding: data, as: UTF8.self).trimmingCharacters(in: .whitespacesAndNewlines)
}

func requireEnvironment(_ name: String) throws -> String {
    guard let value = ProcessInfo.processInfo.environment[name], !value.isEmpty else {
        throw PreviewError(description: "Missing environment variable: \(name).")
    }
    return value
}

func appendSummary(_ text: String, to path: String) throws {
    if !FileManager.default.fileExists(atPath: path) {
        _ = FileManager.default.createFile(atPath: path, contents: nil)
    }
    let file = try FileHandle(forWritingTo: URL(fileURLWithPath: path))
    defer { try? file.close() }
    try file.seekToEnd()
    try file.write(contentsOf: Data(text.utf8))
}

struct DeploymentRequest: Encodable {
    let ref: String
    let environment: String
    let autoMerge = false
    let requiredContexts: [String] = []
    let transientEnvironment = true
    let productionEnvironment = false
}

func preview() throws {
    let prNumber = try requireEnvironment("PR_NUMBER")
    let operation = try requireEnvironment("OPERATION")
    let repository = try requireEnvironment("GITHUB_REPOSITORY")
    let summaryPath = try requireEnvironment("GITHUB_STEP_SUMMARY")
    guard prNumber.wholeMatch(of: #/[1-9][0-9]*/#) != nil else {
        throw PreviewError(description: "Invalid pull request number.")
    }

    let bucket = "vapor-website-pulls-pr-\(prNumber)"
    let environment = "PR-\(prNumber)"
    let deployments = "repos/\(repository)/deployments"

    if operation == "delete" {
        let deploymentIDs = try run(
            "gh",
            [
                "api", "--paginate", "\(deployments)?environment=\(environment)", "--jq", ".[].id",
            ])
        try run("aws", ["s3", "rb", "s3://\(bucket)", "--force"])
        for deploymentID in deploymentIDs.split(whereSeparator: \.isNewline) {
            try run(
                "gh",
                [
                    "api", "--method", "POST", "\(deployments)/\(deploymentID)/statuses", "-f", "state=inactive",
                ])
        }
        try appendSummary("Deleted preview for PR #\(prNumber).\n", to: summaryPath)
        return
    }
    guard operation == "deploy" else {
        throw PreviewError(description: "Choose deploy or delete.")
    }
    let sha = try requireEnvironment("PR_SHA")
    let index = try? URL(fileURLWithPath: "site/index.html").resourceValues(forKeys: [.isRegularFileKey])
    guard sha.wholeMatch(of: #/[0-9a-f]{40}/#) != nil, index?.isRegularFile == true else {
        throw PreviewError(description: "A resolved commit and built site/index.html are required.")
    }
    let serverURL = try requireEnvironment("GITHUB_SERVER_URL")
    let runID = try requireEnvironment("GITHUB_RUN_ID")
    let websiteURL = "http://\(bucket).s3-website.eu-west-2.amazonaws.com/"
    let logURL = "\(serverURL)/\(repository)/actions/runs/\(runID)"
    let encoder = JSONEncoder()
    encoder.keyEncodingStrategy = .convertToSnakeCase
    let request = DeploymentRequest(ref: sha, environment: environment)
    let deploymentID = try run(
        "gh", ["api", "--method", "POST", deployments, "--input", "-", "--jq", ".id"],
        input: encoder.encode(request)
    )
    let statuses = "\(deployments)/\(deploymentID)/statuses"

    do {
        try run(
            "gh",
            [
                "api", "--method", "POST", statuses, "-f", "state=in_progress", "-f", "log_url=\(logURL)",
            ])
        do {
            try run("aws", ["s3api", "head-bucket", "--bucket", bucket], suppressErrors: true)
        } catch {
            try run(
                "aws",
                [
                    "s3api", "create-bucket", "--bucket", bucket,
                    "--create-bucket-configuration", "LocationConstraint=eu-west-2",
                    "--object-ownership", "ObjectWriter",
                ])
        }
        try run(
            "aws",
            [
                "s3api", "put-bucket-ownership-controls", "--bucket", bucket,
                "--ownership-controls", #"{"Rules":[{"ObjectOwnership":"ObjectWriter"}]}"#,
            ])
        try run(
            "aws",
            [
                "s3api", "put-public-access-block", "--bucket", bucket,
                "--public-access-block-configuration",
                #"{"BlockPublicAcls":false,"IgnorePublicAcls":false,"BlockPublicPolicy":false,"RestrictPublicBuckets":false}"#,
            ])
        try run(
            "aws",
            [
                "s3", "website", "s3://\(bucket)", "--index-document", "index.html", "--error-document", "404.html",
            ])
        try run(
            "aws",
            [
                "s3", "sync", "./site", "s3://\(bucket)/", "--acl", "public-read", "--delete", "--no-progress",
                "--no-follow-symlinks",
            ])
        try run(
            "gh",
            [
                "api", "--method", "POST", statuses, "-f", "state=success", "-f", "log_url=\(logURL)",
                "-f", "environment_url=\(websiteURL)",
            ])
    } catch {
        _ = try? run(
            "gh",
            [
                "api", "--method", "POST", statuses, "-f", "state=failure", "-f", "log_url=\(logURL)",
            ])
        throw error
    }
    try appendSummary(
        "[Preview for PR #\(prNumber)](\(websiteURL)) — commit `\(sha)`\n", to: summaryPath
    )
}

do {
    try preview()
} catch {
    FileHandle.standardError.write(Data("\(error)\n".utf8))
    exit((error as? CommandError)?.exitCode ?? EXIT_FAILURE)
}
