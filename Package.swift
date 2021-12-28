// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "FirstServer",
    platforms: [
       .macOS(.v11),
       .iOS(.v13)
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
            name: "Client",
            dependencies: [
                .product(name: "TokamakShim", package: "Tokamak"),
                .product(name: "TokamakDOM", package: "Tokamak")
            ]
        ),
        .target(
            name: "App",
            dependencies: [
                .product(name: "Vapor", package: "vapor")
            ]
        ),
    ]
)
