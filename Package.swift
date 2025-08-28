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
      name: "FirebaseAI",
      targets: ["FirebaseAITarget"]
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
      name: "FirebaseMLModelDownloader",
      targets: ["FirebaseMLModelDownloaderTarget"]
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
      name: "FirebaseAITarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAI",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension"
      ],
      path: "Sources/FirebaseAI"
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
      name: "GoogleSignInTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_AppAuth", condition: .when(platforms: [.iOS])),
        "_AppCheckCore",
        .target(name: "_GoogleSignIn", condition: .when(platforms: [.iOS])),
        .target(name: "_GTMAppAuth", condition: .when(platforms: [.iOS])),
        "_GTMSessionFetcher"
      ],
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_absl.xcframework.zip",
      checksum: "a201de860e5a6353b8f19dbaf18b51c67d34fcbf4f4055bf0900f943ab694007"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_AppAuth.xcframework.zip",
      checksum: "cdc00da1235bd5c77e0dde3fb50c9d135bc839359d2ca9b5cf2c77ba86241f1c"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_AppCheckCore.xcframework.zip",
      checksum: "dbc63f20dbc2da78970b10525d5f86a9c6072d63fd4c7d6ec9c6ff2c08964727"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FBLPromises.xcframework.zip",
      checksum: "6b0c053301d0f3b6f3591d4596d4844349a9904611c95fe01d8527abf30b8f77"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseABTesting.xcframework.zip",
      checksum: "5c7728b5141340c94f68cc50f97168e88011febe5182ca93955b443e6a41dfe2"
    ),
    .binaryTarget(
      name: "_FirebaseAI",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseAI.xcframework.zip",
      checksum: "18abe31aba6bcd82496c0669bc71685b95f055da156b8fef6258ec0cfce8874f"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "51cc3a8d2dffec3d2ce1166e8d1432956c10d385e414410c5f0101d5baa8cdce"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "2f7f57c3737423a7a9101cb057bd65d0ff3a67e9dce4c5064745c674a9f5737b"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "8d35b83ebb7ebbfd476dfadf428a0785dc10bb35f2298d4ce671640b6ff16fd4"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "8d46fbcc7c711fa63db85262bbd54eda68e9b27b282c5ed0dc5450d811e0e21c"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseAuth.xcframework.zip",
      checksum: "26211ff4cb2e9100ca677681ca443b16d6a45613a421a3cdd3875c5aacc8d546"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "9982f6927c172a1573800bbdc906357e6ce216879c09b5865d6e5072fa90e4d6"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseCore.xcframework.zip",
      checksum: "bc2c862a4fad8025e3ff3f2ff60274ff1306b3c9e354e6b44234efb37bbd49de"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "c9d1292b04475660407d3d9c3e742082b543fe670e3668857ae9836d3f01c0ca"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "a183be2ff2999430ce555a8ae979a244dc379ca7bfa0d7b07597892a3d2961b4"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "f3a25c1545956fd69f0b6e7993d7f766e4e6221901fc703efba8985ae618b44a"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseDatabase.xcframework.zip",
      checksum: "f9d78abe2d21c859a78f85d5d8390da4f736c2decbcfe148f09cfed47a4b4885"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseFirestore.xcframework.zip",
      checksum: "2607bf40745f615896ee2175b53021cbd98d47cf454f9d54ceb48320561cf935"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "c3e96977955a8a31f747242b040e97467b4a2098215984a14c686d136a6a3468"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseFunctions.xcframework.zip",
      checksum: "8cdae9bdeca23184b75f5da770935ad6e14f4034e4039ffa1a7120da7bd5031a"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "13f87265a2e5585d167369b457cbf7f9691308ea73eaf00c23a052af4c56c966"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseInstallations.xcframework.zip",
      checksum: "76aac8aade33215240e397ff1819e5a18e5e976153de59573d1ac0a6ba37917b"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseMessaging.xcframework.zip",
      checksum: "33085b88ea78c8169a6faee23c3b2bec9da57551c624fcdbadfa6424f7cf1226"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "af40c90ea18c8faa4358453d27893fc806f53e3dfd87a129544584a26eb4e109"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "cbf1b6c77005ab1cb881877bed1e5b7560d87fad56ead567f98ac934c8242e75"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebasePerformance.xcframework.zip",
      checksum: "7c0c72eddb48640d8c57d1065389646bf2859327739839208ff7497a96dd4b4e"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "d2a0fc41647bc5435348110d7b026b01fa4f0f08b27ea83623f5631b19af9af0"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "125555d66b8808927ca0520971c71149cd091053641717dcf2b55a15a42c92ef"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseSessions.xcframework.zip",
      checksum: "09a4c6b8d874fc18af3b68cd4e5a7b09e2f480a26c1140b02a922b5cc7749144"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "b77f803f6e60f11afe36ee9bf215a0cf98d67ebedade3ae14e33a65f67a60878"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_FirebaseStorage.xcframework.zip",
      checksum: "ec8b0242e42502c5f8c3f272966c39433d8bd13999c7f29145d1f34272d1892a"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "9049336e7ea07eb70294b8e35dc52308d7fd4f66f1ce4589d1fcdedc515fee36"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "4731bfc19e9ee71b92115cd420545d3361234fe9fafc0ca410f77fcfa29fcd0d"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "494db5def04095d2e106569764ad14075dd6fabe5ab89b44f9c46074254d447f"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_GoogleDataTransport.xcframework.zip",
      checksum: "45a6bcefc18e67c6d01432ab3adef86a3adafd5478db86c2a8497725d3ea44fc"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_GoogleSignIn.xcframework.zip",
      checksum: "10ced3298e02b7eb4b9793b89bb0eb99ddb7805e38b360ef2b261221fc3051b6"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_GoogleUtilities.xcframework.zip",
      checksum: "43eaba54873609897f4af782710361bfb832a6299c16feb31323f91e77ee8e01"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_grpc.xcframework.zip",
      checksum: "19d427f8de1a90a75740e444ed152bdf81c9dfe4d750b906d0650f0ad952d624"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_grpcpp.xcframework.zip",
      checksum: "64e275a2f94272f75b2ed9d53442af461383c3bceb91bb61cd88b8cff3930009"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_GTMAppAuth.xcframework.zip",
      checksum: "6550cb494330b0bfbc92cf3d058dd0dc7ea80c13db6acbf220042f76c8c1645b"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "6c6f6a08223f691da29a3350d662687e36e297b8642f1b3124f583e46044f719"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_leveldb.xcframework.zip",
      checksum: "00b60d146f393eb30655365361c25818504a123d0b82f7f65a105abcec5703f9"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_nanopb.xcframework.zip",
      checksum: "956e40c78a6ff71a7c8d3ca294da99f1ccb9837a3910beb30e8e2148508d8641"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_openssl_grpc.xcframework.zip",
      checksum: "5cdf25070f68cdb39002e0c4a33d1fb0d64ed670817a4e557681d0faf7a7ddbb"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_Promises.xcframework.zip",
      checksum: "d58e7b9639eddb4c38304febb6d1d8cfd9db8f42092a24c818e102d7ec41d2f3"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_RecaptchaInterop.xcframework.zip",
      checksum: "ab3230f88c97d2fccdcc4d6192af6f7223c4c538d635a6dc4e628799e5d5b055"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.2.0/_SwiftProtobuf.xcframework.zip",
      checksum: "f602b128c53d33c76f3564d877ba22d7194528e99ccedcdbdc41707f2af5fe03"
    )
  ]
)
    