import PackageDescription

let package = Package(
    name: "VaporWebsite",
    dependencies: [
        .Package(url: "https://github.com/qutheory/vapor.git", majorVersion: 0, minor: 12),
        .Package(url: "https://github.com/qutheory/vapor-mustache.git", majorVersion: 0, minor: 0) //will be 0.8
    ],
    exclude: [
        "Deploy",
        "Public",
        "Resources",
		"Tests",
		"Database",
		"node_modules"
    ]
)
