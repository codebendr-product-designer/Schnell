// swift-tools-version:5.9

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
        //Conflict-free replicated data type
        .library(name: "CRDTs", targets: ["CRDTs"]),
        
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
        .package(url: "https://github.com/robb/Swim.git", from: "0.4.0"),
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
        .target(name: "CRDTs"),
        .executableTarget(
            name: "Koch",
            dependencies: [
                .product(name: "HTML", package: "Swim")
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
