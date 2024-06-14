// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Homepage",
    platforms: [.macOS(.v12)],
    products: [
        .executable(
            name: "Homepage",
            targets: ["Homepage"]
        ),
    ],
    dependencies: [
        .package(name: "Publish", url: "https://github.com/johnsundell/publish.git", branch: "master"),
        .package(url: "https://github.com/vapor/design.git", branch: "main"),
    ],
    targets: [
        .executableTarget(
            name: "Homepage",
            dependencies: [
                .product(name: "Publish", package: "Publish"),
                .product(name: "VaporDesign", package: "design"),
            ]
        ),
    ]
)