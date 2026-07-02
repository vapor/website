// swift-tools-version:6.0

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
        .package(url: "https://github.com/brokenhandsio/kiln.git", from: "1.3.0"),
        // For local Kiln development, swap the line above for:
        // .package(path: "../../BrokenHands/kiln"),
    ],
    targets: [
        .executableTarget(
            name: "VaporWebsite",
            dependencies: [
                .product(name: "Kiln", package: "kiln"),
            ]
        ),
    ]
)
