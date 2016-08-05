import PackageDescription

let package = Package(
    name: "VaporWebsite",
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", majorVersion: 0, minor: 16),
        .Package(url: "https://github.com/vapor/vapor-mustache.git", majorVersion: 0, minor: 11)
    ],
    exclude: [
        "Deploy",
        "Public",
        "Resources",
		"Tests",
        "Config",
		"Database",
		"node_modules"
    ]
)
