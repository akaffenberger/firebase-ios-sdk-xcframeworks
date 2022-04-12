// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Firebase",
  platforms: [.iOS(.v11), .macOS(.v10_12), .tvOS(.v12), .watchOS(.v7)],
  products: [
    .library(
      name: "FirebaseABTesting",
      targets: ["FirebaseABTestingTarget"]
    ),
    .library(
      name: "FirebaseAnalytics",
      targets: ["FirebaseAnalyticsTarget"]
    ),
    .library(
      name: "FirebaseAppCheck",
      targets: ["FirebaseAppCheckTarget"]
    ),
    .library(
      name: "FirebaseAppDistribution",
      targets: ["FirebaseAppDistributionTarget"]
    ),
    .library(
      name: "FirebaseAuth",
      targets: ["FirebaseAuthTarget"]
    ),
    .library(
      name: "FirebaseCrashlytics",
      targets: ["FirebaseCrashlyticsTarget"]
    ),
    .library(
      name: "FirebaseDatabase",
      targets: ["FirebaseDatabaseTarget"]
    ),
    .library(
      name: "FirebaseDynamicLinks",
      targets: ["FirebaseDynamicLinksTarget"]
    ),
    .library(
      name: "FirebaseFirestore",
      targets: ["FirebaseFirestoreTarget"]
    ),
    .library(
      name: "FirebaseFunctions",
      targets: ["FirebaseFunctionsTarget"]
    ),
    .library(
      name: "FirebaseInAppMessaging",
      targets: ["FirebaseInAppMessagingTarget"]
    ),
    .library(
      name: "FirebaseMLModelDownloader",
      targets: ["FirebaseMLModelDownloaderTarget"]
    ),
    .library(
      name: "FirebaseMessaging",
      targets: ["FirebaseMessagingTarget"]
    ),
    .library(
      name: "FirebasePerformance",
      targets: ["FirebasePerformanceTarget"]
    ),
    .library(
      name: "FirebaseRemoteConfig",
      targets: ["FirebaseRemoteConfigTarget"]
    ),
    .library(
      name: "FirebaseStorage",
      targets: ["FirebaseStorageTarget"]
    ),
    .library(
      name: "Google-Mobile-Ads-SDK",
      targets: ["Google-Mobile-Ads-SDKTarget"]
    ),
    .library(
      name: "GoogleSignIn",
      targets: ["GoogleSignInTarget"]
    )
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "Firebase",
      publicHeadersPath: "./"
    ),
    .target(
      name: "FirebaseABTestingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseABTesting"
      ],
      path: "Sources/FirebaseABTesting"
    ),
    .target(
      name: "FirebaseAnalyticsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalytics",
        "FirebaseCore",
        "FirebaseCoreDiagnostics",
        "FirebaseInstallations",
        "GoogleAppMeasurement",
        "GoogleAppMeasurementIdentitySupport",
        "GoogleDataTransport",
        "GoogleUtilities",
        "PromisesObjC",
        "nanopb"
      ],
      path: "Sources/FirebaseAnalytics"
    ),
    .target(
      name: "FirebaseAppCheckTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseAppCheck"
      ],
      path: "Sources/FirebaseAppCheck"
    ),
    .target(
      name: "FirebaseAppDistributionTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "FirebaseAppDistribution", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAppDistribution"
    ),
    .target(
      name: "FirebaseAuthTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseAuth",
        "GTMSessionFetcher"
      ],
      path: "Sources/FirebaseAuth"
    ),
    .target(
      name: "FirebaseCrashlyticsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseCrashlytics"
      ],
      path: "Sources/FirebaseCrashlytics",
      exclude: [
        "run",
        "upload-symbols"
      ]
    ),
    .target(
      name: "FirebaseDatabaseTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseDatabase",
        "leveldb-library"
      ],
      path: "Sources/FirebaseDatabase"
    ),
    .target(
      name: "FirebaseDynamicLinksTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "FirebaseDynamicLinks", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseDynamicLinks"
    ),
    .target(
      name: "FirebaseFirestoreTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "BoringSSL-GRPC",
        "FirebaseFirestore",
        "Libuv-gRPC",
        "abseil",
        "gRPC-C++",
        "gRPC-Core",
        "leveldb-library"
      ],
      path: "Sources/FirebaseFirestore",
      resources: [
        .process("Resources/gRPCCertificates-Cpp.bundle")
      ]
    ),
    .target(
      name: "FirebaseFunctionsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseFunctions",
        "GTMSessionFetcher"
      ],
      path: "Sources/FirebaseFunctions"
    ),
    .target(
      name: "FirebaseInAppMessagingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseABTesting",
        .target(name: "FirebaseInAppMessaging", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseInAppMessaging",
      resources: [
        .process("Resources/InAppMessagingDisplayResources.bundle")
      ]
    ),
    .target(
      name: "FirebaseMLModelDownloaderTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseMLModelDownloader",
        "SwiftProtobuf"
      ],
      path: "Sources/FirebaseMLModelDownloader"
    ),
    .target(
      name: "FirebaseMessagingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseMessaging"
      ],
      path: "Sources/FirebaseMessaging"
    ),
    .target(
      name: "FirebasePerformanceTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseABTesting",
        .target(name: "FirebasePerformance", condition: .when(platforms: [.iOS, .tvOS])),
        "FirebaseRemoteConfig"
      ],
      path: "Sources/FirebasePerformance"
    ),
    .target(
      name: "FirebaseRemoteConfigTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseABTesting",
        "FirebaseRemoteConfig"
      ],
      path: "Sources/FirebaseRemoteConfig"
    ),
    .target(
      name: "FirebaseStorageTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseStorage",
        "GTMSessionFetcher"
      ],
      path: "Sources/FirebaseStorage"
    ),
    .target(
      name: "Google-Mobile-Ads-SDKTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "GoogleMobileAds", condition: .when(platforms: [.iOS])),
        .target(name: "UserMessagingPlatform", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/Google-Mobile-Ads-SDK"
    ),
    .target(
      name: "GoogleSignInTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "AppAuth", condition: .when(platforms: [.iOS])),
        .target(name: "GTMAppAuth", condition: .when(platforms: [.iOS])),
        "GTMSessionFetcher",
        .target(name: "GoogleSignIn", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/GoogleSignIn",
      resources: [
        .process("Resources/GoogleSignIn.bundle")
      ]
    ),
    .binaryTarget(
      name: "AppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/AppAuth.xcframework.zip",
      checksum: "a584675ccbdf0946aa0dd79818f7038fc4ad4806dcb3ebaaa0fcae19244d62af"
    ),
    .binaryTarget(
      name: "BoringSSL-GRPC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/BoringSSL-GRPC.xcframework.zip",
      checksum: "8e69e991e698fd6ffe5f05d5c32d315feae40d2e75041491cd796b22690a6850"
    ),
    .binaryTarget(
      name: "FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/FirebaseABTesting.xcframework.zip",
      checksum: "0cfe97fce76a313ad5ee7d38e52306856688a740e588f57d224dd8bfa00788d1"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/FirebaseAnalytics.xcframework.zip",
      checksum: "42ac890e2e9cce4d24fd78a95fab0d7f626a8cb5fde8ff3011e5d336a776b80b"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/FirebaseAppCheck.xcframework.zip",
      checksum: "d343b57c38767295fd6c03f6013fe650760c3c1b6d086c47a221d1aa7e3c1cb8"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/FirebaseAppDistribution.xcframework.zip",
      checksum: "2e162e0145d5bb04f9c9ced90e116534610e038c770ca62089bb2e9daf433d12"
    ),
    .binaryTarget(
      name: "FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/FirebaseAuth.xcframework.zip",
      checksum: "86f904aa9d953f0f8536565e6347ccfeb35a9f37fe6599a4758d97c7431c7fb3"
    ),
    .binaryTarget(
      name: "FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/FirebaseCore.xcframework.zip",
      checksum: "4388e4f2b575c2e9cd91c7a58337d9277098a06f02c062f079214826498b7bad"
    ),
    .binaryTarget(
      name: "FirebaseCoreDiagnostics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/FirebaseCoreDiagnostics.xcframework.zip",
      checksum: "4d0edcd0bcea5dfed683223b45bd131530027b5e3251007638ca226b3161ff84"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/FirebaseCrashlytics.xcframework.zip",
      checksum: "0597777a281e1abc184d93c9a766ffa79bc6d4b5efa26f2f9e1fb01d596e540f"
    ),
    .binaryTarget(
      name: "FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/FirebaseDatabase.xcframework.zip",
      checksum: "6a2d4e8008763609a90fc71908fa8985e8bf741b0f0ec74fcf16dc46d0c3b710"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/FirebaseDynamicLinks.xcframework.zip",
      checksum: "b8d9987973d27418959c3f37caafbb71d05aa637c2cb84e8b18c2ac61c94659d"
    ),
    .binaryTarget(
      name: "FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/FirebaseFirestore.xcframework.zip",
      checksum: "37aec1108f866be66144022b40441132794d26cc78ac6696d04a98daea00554d"
    ),
    .binaryTarget(
      name: "FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/FirebaseFunctions.xcframework.zip",
      checksum: "4801453a47ebc622b1edfd8faa5fe2e251c82395ef46151986109d1625d8d1dc"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/FirebaseInAppMessaging.xcframework.zip",
      checksum: "1a000cbc274c495010d7651c3446e2bb909f90ec2b7ec7ca2d058a601767ea9c"
    ),
    .binaryTarget(
      name: "FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/FirebaseInstallations.xcframework.zip",
      checksum: "47627c5179423b0d13d90d3cd7e4a022a9ca5a57765130fc1aad8e91519f5bca"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/FirebaseMLModelDownloader.xcframework.zip",
      checksum: "158c4672a20cae6e829b559c12a10e6679e140ad94b83c1b524373ef63ab6efa"
    ),
    .binaryTarget(
      name: "FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/FirebaseMessaging.xcframework.zip",
      checksum: "b00486d8bb3e64844ffe1bd3ccf745d687c3226e338b5c697a018757121bfa97"
    ),
    .binaryTarget(
      name: "FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/FirebasePerformance.xcframework.zip",
      checksum: "c90c9700825d98328fc4e718cc32296d1163add99666b3551c8137d64b528454"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/FirebaseRemoteConfig.xcframework.zip",
      checksum: "35601b769f0b20bdfc3daeb103df414dc8e455dd84734470378a23faf936d6c7"
    ),
    .binaryTarget(
      name: "FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/FirebaseStorage.xcframework.zip",
      checksum: "5b20ab8aaa1bfa4982c45df8858cc2e59d3183d3716c2599e39f8a0420a375e0"
    ),
    .binaryTarget(
      name: "GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/GTMAppAuth.xcframework.zip",
      checksum: "cb91b16bb50bd9532da903abd3465f2f0740ddec980949ca93e565a7e6800700"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/GTMSessionFetcher.xcframework.zip",
      checksum: "081c5b76de29fe415a39bddba04892d94d74cd3ed358ea8b975f021ca7269df0"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/GoogleAppMeasurement.xcframework.zip",
      checksum: "6202f8d3a4239ed14c5330bead862cefb5d43994545b82aaee59ee90c7bebe0d"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "e4f1195dcf8b8ca436c7b46b7bb9958c8b92f798e2e7b6365078e9132b5fc71b"
    ),
    .binaryTarget(
      name: "GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/GoogleDataTransport.xcframework.zip",
      checksum: "0ef7f4761318253926e1fc5703ac5102c4c532e71a2f3e2ab2fd1989ef3779b8"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/GoogleMobileAds.xcframework.zip",
      checksum: "20431e3b3bf0b518971147cb77d2978bf2c654fc17484933ae1743b3c2d0e2f1"
    ),
    .binaryTarget(
      name: "GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/GoogleSignIn.xcframework.zip",
      checksum: "e05e2d53460b88e1ab4f231f1f6b5e1e054da0b725fcfacafb74e4e1282b9961"
    ),
    .binaryTarget(
      name: "GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/GoogleUtilities.xcframework.zip",
      checksum: "637d33ad4adffe095de7f09cfc66d9c7bbb0a006e0a8cf8c3968011fc072d878"
    ),
    .binaryTarget(
      name: "Libuv-gRPC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/Libuv-gRPC.xcframework.zip",
      checksum: "679a4178e239a83d0c7bb1cb19ddb0020b302e27ae77f1cb085948f696677391"
    ),
    .binaryTarget(
      name: "PromisesObjC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/PromisesObjC.xcframework.zip",
      checksum: "57b50ee70fda6533801f5404f279f32d96369aed2b4adf506a2db3cdf11b048d"
    ),
    .binaryTarget(
      name: "SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/SwiftProtobuf.xcframework.zip",
      checksum: "51eddf5d2acc55189c182fa34479a674307c2574d08835abf50d069375c80038"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/UserMessagingPlatform.xcframework.zip",
      checksum: "1f100036b7d3570f7ebad812df422d7cdc7b281f87334eb7c5d0c454d46b517e"
    ),
    .binaryTarget(
      name: "abseil",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/abseil.xcframework.zip",
      checksum: "052c3a0bc9b93ef22878450e37e83297fce24675b21a1d7d0f3400d3d4d5b3f0"
    ),
    .binaryTarget(
      name: "gRPC-C++",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/gRPC-C++.xcframework.zip",
      checksum: "d77e41c0aa6fe1a877156d9828ed33c3e94830016ee52689a6a936732db68d26"
    ),
    .binaryTarget(
      name: "gRPC-Core",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/gRPC-Core.xcframework.zip",
      checksum: "d7be895b61e258c2d0f601c001234b26ab68dbd7493ff767c20bd073d65ada78"
    ),
    .binaryTarget(
      name: "leveldb-library",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/leveldb-library.xcframework.zip",
      checksum: "3a50acf8016d54572131f51675df7dc629554a51f7e9b40e5e8bc74e53a76b66"
    ),
    .binaryTarget(
      name: "nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.15.0/nanopb.xcframework.zip",
      checksum: "393f3e1a4c864d8968e4c0eff351daaa16dfa7d2973d39a22b0865a18aa14763"
    )
  ]
)
    