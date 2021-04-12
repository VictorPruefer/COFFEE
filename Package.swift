// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "COFFEE",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "COFFEE",
            targets: ["COFFEE"]),
    ],
    dependencies: [
        .package(url: "https://github.com/spacenation/swiftui-sliders", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "COFFEE",
            dependencies: []),
        .testTarget(
            name: "COFFEETests",
            dependencies: ["COFFEE"]),
    ]
)
