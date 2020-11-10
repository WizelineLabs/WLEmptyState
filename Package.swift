// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WLEmptyState",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "WLEmptyState",
            targets: ["WLEmptyState"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "WLEmptyState",
            dependencies: [],
            exclude: ["Example", "README.md", "vendor"]),
        .testTarget(
            name: "WLEmptyStateTests",
            dependencies: ["WLEmptyState"]),
    ]
)
