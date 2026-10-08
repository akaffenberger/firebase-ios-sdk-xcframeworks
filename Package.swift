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
      name: "FirebaseAILogic",
      targets: ["FirebaseAILogicTarget"]
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
        "_FirebaseABTesting"
      ],
      path: "Sources/FirebaseABTesting"
    ),
    .target(
      name: "FirebaseAILogicTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_AppCheckCore",
        "_FirebaseAILogic",
        "_FirebaseAppCheck",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        .target(name: "_RecaptchaInterop", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAILogic"
    ),
    .target(
      name: "FirebaseAnalyticsTarget",
      dependencies: [
        "Firebase",
        "_FBLPromises",
        "_FirebaseAnalytics",
        "_FirebaseCore",
        "_FirebaseCoreInternal",
        "_FirebaseInstallations",
        .target(name: "_GoogleAdsOnDeviceConversion", condition: .when(platforms: [.iOS])),
        "_GoogleAppMeasurement",
        "_GoogleAppMeasurementIdentitySupport",
        "_GoogleUtilities",
        "_nanopb"
      ],
      path: "Sources/FirebaseAnalytics"
    ),
    .target(
      name: "FirebaseAppCheckTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_AppCheckCore",
        "_FirebaseAppCheck",
        "_FirebaseAppCheckInterop",
        .target(name: "_RecaptchaInterop", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAppCheck"
    ),
    .target(
      name: "FirebaseAppDistributionTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_FirebaseAppDistribution", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAppDistribution"
    ),
    .target(
      name: "FirebaseAuthTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuth",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        "_GTMSessionFetcher",
        .target(name: "_RecaptchaInterop", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAuth"
    ),
    .target(
      name: "FirebaseCrashlyticsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseCoreExtension",
        "_FirebaseCrashlytics",
        "_FirebaseRemoteConfigInterop",
        "_FirebaseSessions",
        "_GoogleDataTransport"
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
        "_FirebaseAppCheckInterop",
        "_FirebaseDatabase",
        "_FirebaseSharedSwift",
        "_leveldb"
      ],
      path: "Sources/FirebaseDatabase"
    ),
    .target(
      name: "FirebaseFirestoreTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_absl",
        "_FirebaseAppCheckInterop",
        "_FirebaseCoreExtension",
        "_FirebaseFirestore",
        "_FirebaseFirestoreInternal",
        "_FirebaseSharedSwift",
        "_grpc",
        "_grpcpp",
        "_leveldb",
        "_openssl_grpc"
      ],
      path: "Sources/FirebaseFirestore"
    ),
    .target(
      name: "FirebaseFunctionsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        "_FirebaseFunctions",
        "_FirebaseMessagingInterop",
        "_FirebaseSharedSwift",
        "_GTMSessionFetcher"
      ],
      path: "Sources/FirebaseFunctions"
    ),
    .target(
      name: "FirebaseInAppMessagingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseABTesting",
        .target(name: "_FirebaseInAppMessaging", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseInAppMessaging"
    ),
    .target(
      name: "FirebaseMessagingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseMessaging",
        "_GoogleDataTransport"
      ],
      path: "Sources/FirebaseMessaging"
    ),
    .target(
      name: "FirebasePerformanceTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseABTesting",
        "_FirebaseCoreExtension",
        .target(name: "_FirebasePerformance", condition: .when(platforms: [.iOS, .tvOS])),
        "_FirebaseRemoteConfig",
        "_FirebaseRemoteConfigInterop",
        "_FirebaseSessions",
        "_FirebaseSharedSwift",
        "_GoogleDataTransport"
      ],
      path: "Sources/FirebasePerformance"
    ),
    .target(
      name: "FirebaseRemoteConfigTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseABTesting",
        "_FirebaseRemoteConfig",
        "_FirebaseRemoteConfigInterop",
        "_FirebaseSharedSwift"
      ],
      path: "Sources/FirebaseRemoteConfig"
    ),
    .target(
      name: "FirebaseStorageTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        "_FirebaseStorage",
        "_GTMSessionFetcher"
      ],
      path: "Sources/FirebaseStorage"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_absl.xcframework.zip",
      checksum: "7c4013b60e377182542694740d5efb54487c61a47f61c5101f19b2f9b7b1e3f0"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_AppCheckCore.xcframework.zip",
      checksum: "d3a5b06f721fce31a3b5c397f709b3950e28c25c8438e642bb13000d7869b1b4"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FBLPromises.xcframework.zip",
      checksum: "3acd71cf422960c3e1cbbd543951e17cea8691e694a0c9ddf0177eb3a76879a1"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseABTesting.xcframework.zip",
      checksum: "fbfde394c3b78c2a500e318911764fee076e1bdad20cb8249f2f359745668ff7"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseAILogic.xcframework.zip",
      checksum: "ec9de52bd15fbb71c174a16e2619543349c882f408ee08de4b559d926558ad2a"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseAnalytics.xcframework.zip",
      checksum: "46841a46ba00419772464216e9610ac579ffd6cf0624cdf29c01f64fcc566858"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseAppCheck.xcframework.zip",
      checksum: "bf1c5e98e33905c276bce316d39ba641e2e28b3079bb7f2a26d19b6b0d5af89f"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "653b403e1c223b2949811c1a7459e3c65861f27264fc99165c3c328f57cb89ba"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseAppDistribution.xcframework.zip",
      checksum: "f1dc63eb16ce5aab29fbafb6c049c118316ca476af670534123edd287ed944eb"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseAuth.xcframework.zip",
      checksum: "e24a0f41f58c0d7f80078c03cc92fbe92af4da44457a1de0a443b51aa3613327"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseAuthInterop.xcframework.zip",
      checksum: "ed319690d8db66a02a1de14dbef7e0a5778dbfd37ae2108de9d473eb26f4e439"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseCore.xcframework.zip",
      checksum: "cff4c7e8b961021c42c1a63914a7794231212413059debd6252e91db7d15648b"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseCoreExtension.xcframework.zip",
      checksum: "d35eea354748ab644964709cbcc15c7d24221c0aa69d396a4ca9349fe0812f60"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseCoreInternal.xcframework.zip",
      checksum: "2dc9c34e1a67c154fe90bf7ce598aa9c6daa3d5daf2fb6b43209298fdb12fe57"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseCrashlytics.xcframework.zip",
      checksum: "706efd9750f4aaf46c3166e63a0f4256612181a9c3d157282a446d285713804d"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseDatabase.xcframework.zip",
      checksum: "e15c81cc57e5d49cc491cfb047f3ddc9b2f54a6e0bc5a4dae39cc90a705d56ba"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseFirestore.xcframework.zip",
      checksum: "460ff424b0da18fd16bfc11bd889b072dd216783d0c70a845be9f05bf9dea445"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "546d5b27439c7b7b3ff50e212ae309af32664392fcf8a00b68d1c2697e2c7cea"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseFunctions.xcframework.zip",
      checksum: "f2ec32f58e4e363b8958cadcaca95ff242a8f3570737d3c41be0e8e3d53d6af4"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "6faf51752f5948ba841f32e2ae32de85f3df342b4ed9928dba4e26b2acd0d671"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseInstallations.xcframework.zip",
      checksum: "4d2682c0959775a5c19b76eb32f7bc0ba72fb1a7a7a4c5667c80aefeeb5bcfc1"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseMessaging.xcframework.zip",
      checksum: "ba2db7ff1ecf904be8ce9e6216055b796cfa2f1d398d08941e9a7d561217173f"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "ddbe27de0ec7a18b65f691c2b69d1b62bf3fd3d491275948d88107868e7ce4e0"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebasePerformance.xcframework.zip",
      checksum: "8b8a358867a3431342dd14eff9505767cad50a8b2d1e4f85b58a81452f06065d"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "8348ff49e2371828948d757d62088b513b2d987ed2f845703137ff36814889d1"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "44f7a20ab85960acba0b25c4d94e987a15bc8d92b9ac344d3d833afc29970594"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseSessions.xcframework.zip",
      checksum: "9b603210157a7fa3df36bed578555718595e768ba032c4dd9bf136a328ccd5d7"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseSharedSwift.xcframework.zip",
      checksum: "b416b8cc7b49368e5d0eb305eb9798b567963121577772816baea5080ffb6dca"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_FirebaseStorage.xcframework.zip",
      checksum: "f8d1276bb5d2a0b0d4f5c2296d5ce0c0093f491df0d07264a30c8eda5e3acf92"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "70f013777ffcb9591b0d66a4cefddf6c9682717374cb504beb39a62b3ecc986e"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_GoogleAppMeasurement.xcframework.zip",
      checksum: "fd4f06d5d5372f51dd9e7e8bbb664f127c5d9e0e1653885ba40c24e383d32940"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "17e1932aeb5af402cf0a9c290562543d30194e6e574ef3dbd641e39b7eb5160a"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_GoogleDataTransport.xcframework.zip",
      checksum: "fe50dc5e8dfd5522af0d8a1729996205c84211078022e776cb942f50d453a277"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_GoogleUtilities.xcframework.zip",
      checksum: "d1647138c7bc3492c27d86b6cac9ac8484e9384ccaedd2862529fc376a551823"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_grpc.xcframework.zip",
      checksum: "97a772d0bd1dde21bae3635951f7844a455140c3af8d1c3f43a2a67b3bb6374b"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_grpcpp.xcframework.zip",
      checksum: "bf29bd21f7a0f188bb66501b27cf324f7aa0ce64198ae6ff730f6b6c52249ad2"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_GTMSessionFetcher.xcframework.zip",
      checksum: "b368c1abcb19d1f082f921c1a65324e3fbd2aa1033fd556e5091f3585a37d128"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_leveldb.xcframework.zip",
      checksum: "d80655a12a4b3a5b831a53359982d705f16026e6fce6227de117dc659649b338"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_nanopb.xcframework.zip",
      checksum: "797dc7b70155c7000dcc8a1afd6d323ffdf84b93755a8838b32eaea0f193769d"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_openssl_grpc.xcframework.zip",
      checksum: "b050132aea5dc9108b4e74a91e314b303938dd0bc90e2e6e49d2890b0598ff37"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.0.1/_RecaptchaInterop.xcframework.zip",
      checksum: "f413f2a19feb9ad36992f68f25f4d3a2bc926a3ec245bdba82c3478d16723178"
    )
  ]
)
    