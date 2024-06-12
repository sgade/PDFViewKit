// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "Example",
    platforms: [
        .macOS(.v13)
    ],
    dependencies: [
        .package(
            name: "PDFViewKit",
            path: ".."
        )
    ],
    targets: [
        .executableTarget(
            name: "Example",
            dependencies: ["PDFViewKit"]
        )
    ]
)
