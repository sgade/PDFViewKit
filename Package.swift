// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "PDFViewKit",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "PDFViewKit",
            targets: ["PDFViewKit"]
        )
    ],
    targets: [
        .target(name: "PDFViewKit")
    ]
)
