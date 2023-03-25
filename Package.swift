// swift-tools-version: 5.7.1
import PackageDescription

let package = Package(
    name: "OpenAIAPI",
    platforms: [.iOS(.v13), .macCatalyst(.v13), .macOS(.v12)],
    products: [
        .library(name: "OpenAIAPI", type: .dynamic, targets: ["OpenAIAPI"]),
        .library(name: "OpenAIAPIStatic", type: .static, targets: ["OpenAIAPI"])
    ],
    dependencies: [
        .package(url: "git@github.com:kean/Get.git", from: "1.0.2"),
        .package(url: "git@github.com:CreateAPI/URLQueryEncoder.git", from: "0.2.0"),
        .package(url: "git@github.com:apple/swift-docc-plugin.git", from: "1.0.0"),
        // ↓ 'main' because there is still no version for this fix: https://github.com/realm/SwiftLint/issues/4722
        // .package(url: "git@github.com:realm/SwiftLint.git", branch: "main")
    ],
    targets: [
        .target(
            name: "OpenAIAPI",
            dependencies: [
                .product(name: "Get", package: "Get"),
                .product(name: "URLQueryEncoder", package: "URLQueryEncoder")
            ],
            path: "Sources",
            plugins: [
                // disabling for release because depending on a branch would mark the package as unstable
                // .plugin(name: "SwiftLintPlugin", package: "SwiftLint")
            ]
        ),
        .testTarget(
            name: "OpenAIAPITests",
            dependencies: [
                "OpenAIAPI"
            ],
            path: "Tests",
            resources: [
              .process("resources"),
            ]
        )
    ]
)

