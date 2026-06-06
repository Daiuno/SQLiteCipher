// swift-tools-version: 6.1
import PackageDescription

let package = Package(
    name: "SQLiteSQLCipher",
    platforms: [
        .iOS(.v15),
        .macOS(.v10_13),
        .watchOS(.v4),
        .tvOS(.v12),
        .visionOS(.v1)
    ],
    products: [
        .library(name: "SQLiteSQLCipher", targets: ["SQLiteSQLCipher"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/stephencelis/SQLite.swift.git",
            from: "0.16.0",
            traits: ["SQLCipher"]
        )
    ],
    targets: [
        .target(
            name: "SQLiteSQLCipher",
            dependencies: [
                .product(name: "SQLite", package: "SQLite.swift")
            ],
            path: "Sources",
            linkerSettings: [
                .linkedFramework("SQLCipher")
            ]
        )
    ]
)