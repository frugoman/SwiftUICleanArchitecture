// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "FlightsDomain",
    platforms: [.iOS(.v14), .macOS(.v11)],
    products: [
        .library(
            name: "FlightsDomain",
            targets: ["FlightsDomain"]),
    ],
    targets: [
        .target(
            name: "FlightsDomain"),
    ]
)
