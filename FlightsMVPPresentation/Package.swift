// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "FlightsMVPPresentation",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "FlightsMVPPresentation",
            targets: ["FlightsMVPPresentation"]),
    ],
    targets: [
        .target(
            name: "FlightsMVPPresentation",
            dependencies: []),
    ]
)
