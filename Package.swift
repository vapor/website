// swift-tools-version:5.10

import PackageDescription

let package = Package(
    name: "Website",
    platforms: [.macOS(.v13)],
    products: [
        .executable(
            name: "Website",
            targets: ["Website"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/johnsundell/publish.git", branch: "master"),
        .package(url: "https://github.com/vapor/design.git", branch: "main"),
    ],
    targets: [
        .executableTarget(
            name: "Website",
            dependencies: [
                .product(name: "Publish", package: "Publish"),
                .product(name: "VaporDesign", package: "design"),
            ]
        ),
    ]
)
