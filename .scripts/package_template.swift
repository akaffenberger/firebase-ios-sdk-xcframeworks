// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Firebase",
  platforms: [.iOS(.v11), .macOS(.v10_12), .tvOS(.v12), .watchOS(.v7)],
  products: [
// GENERATE LIBRARIES
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "Firebase",
      publicHeadersPath: "./",
      linkerSettings: [
          .unsafeFlags(["-ObjC"])
      ]
    ),
// GENERATE TARGETS,
// GENERATE BINARIES
  ]
)
    
