// swift-tools-version:6.3

import PackageDescription

let package = Package(
    name: "Website",
    platforms: [.macOS(.v13)],
    products: [
        .executable(
            name: "VaporWebsite",
            targets: ["VaporWebsite"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/brokenhandsio/kiln.git", from: "1.7.0"),
        // TEMPORARY (local test): local design checkout for the shared-theme +
        // #designResource migration. Revert to the github/main dep after publish.
        .package(path: "../design"),
    ],
    targets: [
        .executableTarget(
            name: "VaporWebsite",
            dependencies: [
                .product(name: "Kiln", package: "kiln"),
                .product(name: "VaporDesignTheme", package: "design"),
            ]
        ),
    ]
)
