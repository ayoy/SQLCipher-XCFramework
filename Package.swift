// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import Foundation
import PackageDescription

let package = Package(
    name: "SQLCipher-framework",
    platforms: [
        .iOS(.v11),
        .macOS(.v10_13),
        .tvOS(.v11),
        .watchOS(.v4),
    ],
    products: [
        .library(name: "SQLCipher", targets: ["SQLCipher", "_SQLCipherDummy"]),
    ],
    targets: [
        .binaryTarget(name: "SQLCipher", path: "SQLCipher.xcframework"),
        .target(name: "_SQLCipherDummy")
    ]
)
