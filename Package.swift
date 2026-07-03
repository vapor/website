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
        // Local path dep while the shared-layer/head features are unreleased; swap
        // back to the tagged release once Kiln + the design package are published.
        // .package(url: "https://github.com/brokenhandsio/kiln.git", from: "1.3.0"),
        .package(path: "../../BrokenHands/kiln"),
        // Shared Vapor design templates (header/footer/head), consumed as a Kiln
        // theme layer.
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
