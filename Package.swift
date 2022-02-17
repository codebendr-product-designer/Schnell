// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Schnell",
    platforms: [.macOS(.v12), .iOS(.v15)],
    products: [
        .library(name: "Schnell", targets: ["Schnell"]),
        .executable(
            name: "Koch",
            targets: ["Koch"]
        ),
        .library(name: "ReactiveSwift", targets: ["ReactiveSwift"]),
        .library(name: "FunctionalSwift", targets: ["FunctionalSwift"]),
        .library(name: "Kabel", targets: ["Kabel"]),
        .library(name: "DependencyDesign", targets: ["DependencyDesign"])
          //  .library(name: "DependecyInjection", targets: ["DependecyInjection"])
       
    ],
    dependencies: [
        .package(name: "HTML", url: "https://github.com/robb/Swim.git", .branch("main")),
    ],
    targets: [
        .target(name: "Kabel"),
        .target(name: "Schnell"),
        .target(name: "FunctionalSwift"),
        .target(name: "ReactiveSwift"),
        .target(name: "DependencyDesign"),
        .executableTarget(
            name: "Koch",
            dependencies: [
                .product(name: "Swim", package: "HTML"),
                .product(name: "HTML", package: "HTML"),
            ]
        ),
        .testTarget(
            name: "SchnellTests",
            dependencies: ["Schnell"]
        ),
    ]
)
