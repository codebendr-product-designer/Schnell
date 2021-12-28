// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Schnell",
    products: [
        .library(name: "Schnell", targets: ["Schnell"])
    ],
    dependencies: [],
    targets: [
        .target( name: "Schnell"),
        .testTarget(
            name: "SchnellTests",
            dependencies: ["Schnell"]),
    ]
)
