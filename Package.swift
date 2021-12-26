// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "FirstServer",
    platforms: [
       .macOS(.v11)
    ],
    products: [
        .executable(name: "server-app", targets: ["App"]),
        .executable(name: "server-client", targets: ["Client"])
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
        .package(name: "Tokamak", url: "https://github.com/TokamakUI/Tokamak", from: "0.6.0"),
    ],
    targets: [
        .target(
            name: "App",
            dependencies: [
                .product(name: "Vapor", package: "vapor")
            ],
            swiftSettings: [
                // Enable better optimizations when building in Release configuration. Despite the use of
                // the `.unsafeFlags` construct required by SwiftPM, this flag is recommended for Release
                // builds. See <https://github.com/swift-server/guides/blob/main/docs/building.md#building-for-production> for details.
                .unsafeFlags(["-cross-module-optimization"], .when(configuration: .release))
            ]
        ),
        .target(
            name: "Client",
            dependencies: [
                .product(name: "TokamakShim", package: "Tokamak")
            ]
        ),
    ]
)
