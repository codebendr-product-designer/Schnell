// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Schnell",
    platforms: [.iOS(.v15), .macOS(.v12)],
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
        .library(name: "WeatherClientLive", targets: ["WeatherClientLive"]),
        .library(name: "WeatherFeature", targets: ["WeatherFeature"]),
        .library(name: "PathMonitor", targets: ["PathMonitor"]),
        .library(name: "PathMonitorLive", targets: ["PathMonitorLive"]),
        .library(name: "LocationClient", targets: ["LocationClient"]),
        .library(name: "LocationClientLive", targets: ["LocationClientLive"]),
        .library(name: "DesignPatterns", targets: ["DesignPatterns"]),
    ],
    dependencies: [
        .package(name: "HTML", url: "https://github.com/robb/Swim.git", .branch("main")),
        .package(url: "https://github.com/pointfreeco/combine-schedulers", from: "0.5.3")
    ],
    targets: [
        .target(name: "PathMonitor"),
        .target(name: "PathMonitorLive", dependencies: ["PathMonitor"]),
        .target(name: "WeatherClient"),
        .target(name: "WeatherClientLive", dependencies: ["WeatherClient"]),
        .target(name: "WeatherFeature", dependencies: ["WeatherClient", "PathMonitor", "LocationClient"]),
        .target(name: "LocationClient"),
        .target(name: "LocationClientLive", dependencies: ["WeatherClient"]),
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
        .testTarget(name: "ClientTests", dependencies: [
            "LocationClient",
            "WeatherClient",
            "PathMonitor",
            "WeatherFeature",
            .product(name: "CombineSchedulers", package: "combine-schedulers")
        ])
    ]
)
