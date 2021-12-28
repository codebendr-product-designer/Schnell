// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Schnell",
    products: [
        .library(name: "Schnell", targets: ["Schnell"]),
        .library(name: "Koch", targets: ["Koch"]),
        .library(name: "ReactiveSwift", targets: ["ReactiveSwift"]),
        .library(name: "FunctionalSwift", targets: ["FunctionalSwift"])
    ],
    dependencies: [
        .package(name: "HTML", url: "https://github.com/robb/Swim.git", .branch("main")),
    ],
    targets: [
        .target( name: "Schnell"),
        .target( name: "FunctionalSwift"),
        .target( name: "ReactiveSwift"),
        .target(name: "Koch", dependencies: [
            .product(name: "Swim", package: "HTML"),
            .product(name: "HTML", package: "HTML"),
        ]),
        .testTarget(
            name: "SchnellTests",
            dependencies: ["Schnell"]),
    ]
)
