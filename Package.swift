// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MdocSecurity18013",
    platforms: [.macOS(.v14), .iOS(.v16), .watchOS(.v10)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "MdocSecurity18013",
            targets: ["MdocSecurity18013"]),
    ],
    dependencies: [
        .package(url: "https://github.com/JHeisecke/eudi-lib-ios-iso18013-data-model.git", branch: "main"),
        .package(url: "https://github.com/JHeisecke/swift-certificates.git", branch: "fix/swift-6.2-library-evolution-inlinable"),
        .package(url: "https://github.com/JHeisecke/swift-collections.git", branch: "main"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "MdocSecurity18013",
            dependencies: [
                .product(name: "MdocDataModel18013", package: "eudi-lib-ios-iso18013-data-model"),
                 .product(name: "X509", package: "swift-certificates"),
            ],
            //swiftSettings: [.enableUpcomingFeature("InferIsolatedConformances"), .enableUpcomingFeature("NonisolatedNonsendingByDefault")],
        ),
        .testTarget(
            name: "MdocSecurity18013Tests",
            dependencies: ["MdocSecurity18013"],
            resources: [.process("Resources")]
        )
    ]
)
