// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "ObjectCoder",
    products: [
        .library(
            name: "ObjectCoder",
            targets: ["ObjectCoder"]),
    ],
    targets: [
        .target(
            name: "ObjectCoder",
            dependencies: []),
        .testTarget(
            name: "ObjectCoderTests",
            dependencies: ["ObjectCoder"]),
    ]
)
