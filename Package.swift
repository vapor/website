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
        // Local checkout for development. For CI/production, pin a release instead:
        // .package(url: "https://github.com/brokenhandsio/kiln.git", from: "1.1.0"),
        .package(path: "../../BH/kiln"),
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
