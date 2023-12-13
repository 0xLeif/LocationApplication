// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "LocationApplication",
    platforms: [
        .iOS(.v15),
        .watchOS(.v8),
        .macOS(.v11),
        .tvOS(.v15)
    ],
    products: [
        .library(
            name: "LocationApplication",
            targets: ["LocationApplication"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/0xLeif/AppState.git", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "LocationApplication",
            dependencies: ["AppState"]
        ),
        .testTarget(
            name: "LocationApplicationTests",
            dependencies: ["LocationApplication"]
        )
    ]
)
