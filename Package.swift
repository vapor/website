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
        .package(url: "https://github.com/brokenhandsio/kiln.git", from: "1.4.1"),
        .package(url: "https://github.com/vapor/design.git", branch: "main"),
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
