// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "FlightsMVPPresentation",
    platforms: [.iOS(.v14), .macOS(.v11)],
    products: [
        .library(
            name: "FlightsMVPPresentation",
            targets: ["FlightsMVPPresentation"]),
    ],
    dependencies: [
        .package(name: "FlightsDomain", path: "../FlightsDomain")
    ],
    targets: [
        .target(
            name: "FlightsMVPPresentation",
                dependencies: ["FlightsDomain"]
        ),
    ]
)
