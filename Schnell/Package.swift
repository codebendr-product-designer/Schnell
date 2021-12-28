// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Schnell",
    products: [
        .library(name: "Schnell", targets: ["Schnell"]),
        .library(name: "Koch", targets: ["Koch"])
    ],
    dependencies: [
        .package(name: "HTML", url: "https://github.com/robb/Swim.git", .branch("main")),
    ],
    targets: [
        .target( name: "Schnell"),
        .target(name: "Koch", dependencies: [
            .product(name: "Swim", package: "HTML"),
            .product(name: "HTML", package: "HTML"),
        ]),
        .testTarget(
            name: "SchnellTests",
            dependencies: ["Schnell"]),
    ]
)
