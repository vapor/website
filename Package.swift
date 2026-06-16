// swift-tools-version:5.10
import PackageDescription

let package = Package(
    name: "Website",
    platforms: [.macOS(.v13)],
    products: [
        .executable(
            name: "Website",
            targets: ["Website"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/johnsundell/publish.git", branch: "master"),
        .package(
            url: "https://github.com/vapor/design.git",
            revision: "c7a57153e7bd3c2281b3c48bc1a0e02047a66260"
        ),
    ],
    targets: [
        .executableTarget(
            name: "Website",
            dependencies: [
                .product(name: "Publish", package: "Publish"),
                .product(name: "VaporDesign", package: "design"),
            ]
        )
    ]
)
