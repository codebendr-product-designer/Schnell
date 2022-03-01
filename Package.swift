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
        //Dependency Design
        .library(name: "WeatherClient", targets: ["WeatherClient"]),
        .library(name: "DesignPatterns", targets: ["DesignPatterns"]),
        .library(name: "WeatherClientLive", targets: ["WeatherClientLive"])
    ],
    dependencies: [
        .package(name: "HTML", url: "https://github.com/robb/Swim.git", .branch("main")),
    ],
    targets: [
        .target(name: "WeatherClient"),
        .target(name: "WeatherClientLive", dependencies: ["WeatherClient"]),
        .target(name: "DesignPatterns"),
        .target(name: "Kabel"),
        .target(name: "Schnell"),
        .target(name: "FunctionalSwift"),
        .target(name: "ReactiveSwift"),
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
