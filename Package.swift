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
      name: "FirebaseAnalyticsOnDeviceConversion",
      targets: ["FirebaseAnalyticsOnDeviceConversionTarget"]
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
      name: "FirebaseVertexAI",
      targets: ["FirebaseVertexAITarget"]
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
        "_FirebaseABTesting"
      ],
      path: "Sources/FirebaseABTesting"
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
        "_GoogleAppMeasurement",
        "_GoogleAppMeasurementIdentitySupport",
        "_GoogleUtilities",
        "_nanopb"
      ],
      path: "Sources/FirebaseAnalytics"
    ),
    .target(
      name: "FirebaseAnalyticsOnDeviceConversionTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_FirebaseAnalyticsOnDeviceConversion", condition: .when(platforms: [.iOS])),
        .target(name: "_GoogleAppMeasurementOnDeviceConversion", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAnalyticsOnDeviceConversion"
    ),
    .target(
      name: "FirebaseAppCheckTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_AppCheckCore",
        "_FirebaseAppCheck",
        "_FirebaseAppCheckInterop"
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
        "_GoogleDataTransport",
        "_Promises"
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
      name: "FirebaseDynamicLinksTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_FirebaseDynamicLinks", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseDynamicLinks"
    ),
    .target(
      name: "FirebaseFirestoreTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseCoreExtension",
        "_FirebaseFirestore",
        "_FirebaseFirestoreInternal",
        "_FirebaseSharedSwift",
        "_absl",
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
      name: "FirebaseMLModelDownloaderTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseCoreExtension",
        "_FirebaseMLModelDownloader",
        "_GoogleDataTransport",
        "_SwiftProtobuf"
      ],
      path: "Sources/FirebaseMLModelDownloader"
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
        "_GoogleDataTransport",
        "_Promises"
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
    .target(
      name: "FirebaseVertexAITarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        "_FirebaseVertexAI"
      ],
      path: "Sources/FirebaseVertexAI"
    ),
    .target(
      name: "Google-Mobile-Ads-SDKTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_GoogleMobileAds", condition: .when(platforms: [.iOS])),
        .target(name: "_UserMessagingPlatform", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/Google-Mobile-Ads-SDK"
    ),
    .target(
      name: "GoogleSignInTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_AppAuth", condition: .when(platforms: [.iOS])),
        "_AppCheckCore",
        .target(name: "_GTMAppAuth", condition: .when(platforms: [.iOS])),
        "_GTMSessionFetcher",
        .target(name: "_GoogleSignIn", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_AppAuth.xcframework.zip",
      checksum: "f04f95b5e351c61e217d9a47aa033ab6c00acdbda0d47cd3f8f60040e57cd4f8"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_AppCheckCore.xcframework.zip",
      checksum: "fc8d73f051fa40f5f8552f57171c61ba3975b197c60208fa08ff22288b862853"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FBLPromises.xcframework.zip",
      checksum: "9a7fe474a6e7c86063eb9f8caaea306384b1f9806d73369dd5fdc3f6688428d6"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseABTesting.xcframework.zip",
      checksum: "db2ca11713b1ec5cbb64acac247fbe7ff3592373d4228a00cdf6dde9d06b2e1d"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "6e782d98a95388b95131e206904f6dec9aebb9a2702ea797d8cb90945be09798"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "795999db0e6606229ac097d6a43a1434f2bb58cc11b23aa2242bdb63a6890df8"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "5a4a620123f79bdc4f632ab89f354a61f0ab6697b8d0fd9057d591322dc8c3f6"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "a1c64b51f8d97cdc27705667010161743dbb821bb0f1c3d03dba0900143088a1"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "166086f47cf5f2739aed5b93599f703699cd51d1ba315fbe64e8866546d0f7c1"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseAuth.xcframework.zip",
      checksum: "2c233c85740b5c3c32b4b81b025864bbb036de7357723983b3a132f33576923e"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "bb951301fa818203941bafa1a2a390563740934a3b7eaa5c0b805cfd36dfc575"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseCore.xcframework.zip",
      checksum: "312f2eae7586d9bd1fa0ae89330fe157fb5cc56ae4c1c2e9ea5bfdf9e24672d9"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "6c76536f4e5f42e85f05f60555b3715a9152f918300932411ea413a0a02ac8b0"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "bcbbf7f8f4d4270432c202d1c4ed107ed2a3c9e58e4d64848f01d3be29f47af8"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "698b1b61274fa7e8d10bac9cf51db1fc4b97a23272d270b95a9d4dc84802f379"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseDatabase.xcframework.zip",
      checksum: "7bc68d3922e72ecc79f859e4dc6253a6c89537551d552e1829eec5e6c2a00021"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "1090a5e438e65798aebf3e88ba90cb6eb247f62be96501d8a5fceac45fd77333"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseFirestore.xcframework.zip",
      checksum: "d243e33dec762f3ad8b9f317c9cc571612321905ca9be9b437fd7f6418b14834"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "aa24f16f472302ed6c636b9794262747ff648ab69b371a56914fcfba0c8b9898"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseFunctions.xcframework.zip",
      checksum: "2717398183babb39c8e1c5a863c9935e9fd8948b1b009d0d8b14f4ffd2bceddb"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "ab66feb5a0bc0405b1dde8e9afcb383a68260c7dbfbb3651ccd7cf5cc3ab8e60"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseInstallations.xcframework.zip",
      checksum: "5b42244ab5d8b7a8846f7667a09e0bfa25ae1ddd0e3e37c94ea425e399fc563a"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "098b0d016a8ee9c0d31b989742527e3614687b33cc81f14b9ad8e39e90221e98"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseMessaging.xcframework.zip",
      checksum: "a0b6072ae0c4bf64fe0a15385069100a4b13d4aea46d8afe24334eebaadebfb9"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "240d575c9fe66f1062e1cb3a516d0a7210bd6c4feca241a48675653c6b56b6fc"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebasePerformance.xcframework.zip",
      checksum: "77f44aab490420cc5b72f747c133cd62777ca64cc5d738db49cc27c85d7c50fb"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "f1745ab558738cad1ecf2f299f00001d38cb43769fddcd48fbd7542de8005930"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "8f434a33d49fbf7fa7998c12f4014e8659ab8c5a29ae658e762cfd16dd1e6528"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseSessions.xcframework.zip",
      checksum: "16d73b39dd68818041fe164de5c5ef727825881450e02bd9cda5c84733734c21"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "9770aaa940bd2616b6420be1b4c45b8632f5fda5efad8f8994ddcb084278bd3c"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseStorage.xcframework.zip",
      checksum: "c988cb82af131bb25e9d72c1d2075e8ce1122d3cbcf0c8684ce9771d7c91da2e"
    ),
    .binaryTarget(
      name: "_FirebaseVertexAI",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_FirebaseVertexAI.xcframework.zip",
      checksum: "55c15e2d01e0b81f6fa3b06af0eebb23cbc8bfb82b2d155837f9e7d535f1534b"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_GTMAppAuth.xcframework.zip",
      checksum: "5b3ac76c5774f1e969991d466399d199935c9f4a3c5ae0f034195c8f0be933a4"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "6deecce88b24db7b3e7d94d6716d64491dafd2819f5139335fc57281e3a8f69a"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "d2b3517f6fa7f99fc0bb9d9f312c2151ef508839f55a88cdc9173490537cb4fa"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "cab7d1b8b729c00429bf049cd3e9c7b1de8fd571438ed4dbd851163fef76e5fa"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "f35ba673e6600ac5d750465a7add29672ac52619f9e8638d08f2f552a33ccb89"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_GoogleDataTransport.xcframework.zip",
      checksum: "7b47b6499b4c306b3bbca5fd0fb15570de3b140e9886db2cd8ef3f06efc2f5b6"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_GoogleMobileAds.xcframework.zip",
      checksum: "27c0bb703c7fc62074ec81bb9f39922fe74c3e9db3ba51099f1523702806e46a"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_GoogleSignIn.xcframework.zip",
      checksum: "c62d51908e65895e742c9d2b77b6c5251b8d09730f27871ccc1af2000dbc2d42"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_GoogleUtilities.xcframework.zip",
      checksum: "541d4004269c2e30fd1b128b994df63b973c2c3a3d68897827634a1df3a10359"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_Promises.xcframework.zip",
      checksum: "65da77ad31286ad3537d7a67d56940aebc948b22a5597c27ec6a7ee91415c2bf"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_RecaptchaInterop.xcframework.zip",
      checksum: "1146309e85b0496459c200d8479ee27dbb69d4db33e0dd6ebdd5a2fbfb2c8193"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_SwiftProtobuf.xcframework.zip",
      checksum: "b6bf0ec3b39fdb9af8ce34f054cceaf668871fa6b812a47f834fdd368f20cd03"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "8ac229dd2e4c6f9043faa3d64591afa33e4509037f9d5c9f1f73c789883b80a4"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_absl.xcframework.zip",
      checksum: "d30c0d92028b4e909cd0004fd88b5d6fa30cc24632ad608365337c1482bd33c4"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_grpc.xcframework.zip",
      checksum: "329df481d2cbff65935aa7428c0ef77de452b1ab4862806a56433383c63369e6"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_grpcpp.xcframework.zip",
      checksum: "992cff57b8475730c1bb94a3ef1d2e89207df8a1dd3614db21e5ec25fcda2f93"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_leveldb.xcframework.zip",
      checksum: "f3e91f3c5b31d20e2d6ae75ca4f0b3c689b54d2578aaf32b21291583d96cfcfb"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_nanopb.xcframework.zip",
      checksum: "d06e4d9fd339159e01a68ade882881b694559d634f572be64760dcab92e7de83"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.11.0/_openssl_grpc.xcframework.zip",
      checksum: "79d3f2d9befcc28d72f0afe890299508f5af7549cffe1637357b2520144057a2"
    )
  ]
)
    