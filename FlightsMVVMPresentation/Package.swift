// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FlightsMVVMPresentation",
    platforms: [.iOS(.v14), .macOS(.v11)],
    products: [
        .library(
            name: "FlightsMVVMPresentation",
            targets: ["FlightsMVVMPresentation"]),
    ],
    dependencies: [
        .package(path: "../FlightsDomain")
    ],
    targets: [
        .target(name: "FlightsMVVMPresentation", dependencies: ["FlightsDomain"]),
    ]
)
