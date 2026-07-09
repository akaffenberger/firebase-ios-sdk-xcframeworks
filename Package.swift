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
        "_Promises",
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
        "_Promises",
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
        "_FirebaseMLModelDownloader"
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
        "_GTMSessionFetcher",
        "_Promises",
        .target(name: "_RecaptchaInterop", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_absl.xcframework.zip",
      checksum: "fff0388cf074c69a2da4bc197a005da0b8e5c23ebdcfa383600c540a342f9df1"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_AppAuth.xcframework.zip",
      checksum: "6e48a39e2fc171dc67bf9df4bfebb54b63eb1768b281bb65cb69393aeea867f7"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_AppCheckCore.xcframework.zip",
      checksum: "a18d4e5aff27ff4b9bce8d6e73e55ccf1d11515311e219aa4473319cdff3187b"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FBLPromises.xcframework.zip",
      checksum: "3544fb457e7f60c69740cdd26617a75bdd613943e948becca643022c7edd76c0"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseABTesting.xcframework.zip",
      checksum: "5a533fa4a7fa2cec844656f7d60e45d3fe1bf376d7476ce229c9b47166686f43"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseAILogic.xcframework.zip",
      checksum: "adeeaa7b1d64fc3d24aeea4396034af584f20e91abfc7cb91de704b30d2a491a"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "e3253a494375c5174d20cb81925e20afa1ff6b1419125cb608d39b092b53ff2a"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "af82d72727d55d14f65eee96845d4d9495e4e603b4673709d6f3448b9595cc63"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "7ffd54e6fe187bf8cd714e3d863e0095f7cbbb0fb802adb87a40c552de7cffcc"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "bb5d3c57317c95dcb9005d50621b868819ee0d59603d93a12095374a99214556"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseAuth.xcframework.zip",
      checksum: "fcde09db8d45ffba67802e81c17b8046db6b56568226ace3fca898983b08c968"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "e8e6f4fb42b3fa76c2bade7a522ab0f224558d27d2321175c791d307541787a8"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseCore.xcframework.zip",
      checksum: "30e3505c715e17682c1dc20bb26ba475e99e6981a9a0dba3cf9352eea632fc1d"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "e37ce2abcd4c218ab5426da78cbe7ab41f79ee7eba1d02dd4b0cde952ed2c4a0"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "72a15c0c63585faf93e9ffa91e8a8c1c50b24749405804ffae19a29ec05b07ab"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "e03c71913efd97678b895abb1e968c83e58b3fbd7955a81ec6e6581b95db16e3"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseDatabase.xcframework.zip",
      checksum: "093c66cbfe73953eba68ffb7e03708b545bb731955b900867f05d89f2033f696"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseFirestore.xcframework.zip",
      checksum: "f7a1bb7fc4a2fb09298b514114d6aaca9a4f00fd8868667524a05bc4563bf1fd"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "d9595a1784beaf5cd4a8e0dda0f4364ddfa6b536ad60f82746d81d14dce037a3"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseFunctions.xcframework.zip",
      checksum: "836dff7e9d117d23c0fdb3021267eed882037afd0125aef616a670399226c4c1"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "a74bdf1d2b2bb47c2e84d6e12500e66abe58dec15ff2d7c01f1d696c69ba6cd6"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseInstallations.xcframework.zip",
      checksum: "141e313325bab001f2dbb79dc8a433f884f4c4a12a5feb665e6958098d637f7b"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseMessaging.xcframework.zip",
      checksum: "428be45e81ad07fe15a0effbf38c7610e0e4400ae2f2a72fa8faa39d734d1e7e"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "85a5ad63db5c677db6490f6cdb98a95c56f046b27956997be4ff5ad2d19340d8"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "51ac192332d3d03a9c96a17f548aadd43e2393645cef1e25e5f1fa175aaacca1"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebasePerformance.xcframework.zip",
      checksum: "fcd1ec77e73e9cfd8011b9e615ea333a64f2c1b3bf4031cc06ce625a5e44a441"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "e0ae6d626a423d535bc67216f9f0cd66f98f1c0fb4b5bf88074d4496733e2db1"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "794f599eb4232058715b606fa671639c8cc5d821655a0f739651d17c5ef65c37"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseSessions.xcframework.zip",
      checksum: "1781d72e47dac0fc7a532412641021730bd5b659135633cd9ef7b97ccd31b0ce"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "8d63b09a517733ef3a58390bf1e8cf054f058bdd618bb4f19a1f4b5a0b4f09e5"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_FirebaseStorage.xcframework.zip",
      checksum: "636b33180dd5ad60b4878357691fe6472cf3bd57ec691e9d661c5444f523df66"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "31a5a1f5204f4844a480d3889b6ebe2e69473ef32b868935c51812c0483cb08b"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "5741e6334392e0345f1b5896111ffef4d5a78859970f5e197fa0b7d881165305"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "b70cb033eeb002ed1c5a8140953ccb3be0221ca754c05fe450ed9c9c6547f274"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_GoogleDataTransport.xcframework.zip",
      checksum: "7d08050419e0906f13039cc4d2dd69be075234c0bf5bbb34df9dd4891e48831d"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_GoogleSignIn.xcframework.zip",
      checksum: "104e0f0388f1ed2dec1efdbe94bea2226dda756686ebe74544292ce361e7fd67"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_GoogleUtilities.xcframework.zip",
      checksum: "37a9d3d3810dad763a8a79bd4c7cc4c37b386240725aca07f45dba1826676c8c"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_grpc.xcframework.zip",
      checksum: "918737c9f8f93e14127b3894e31c7a0522475f2247b74f87d8166dff3a6bafb0"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_grpcpp.xcframework.zip",
      checksum: "b83f85e0256cf06df00cf0ed728b5c0d68373ca401742877935771447450b90a"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_GTMAppAuth.xcframework.zip",
      checksum: "9baf4af4b8a9b6d625b349334715c1776cec5e1d9e0daee05365e7e8f06d3648"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "f58dc2bd9db39defd73f0f67e7a11893a0c6e6f0ba45cd83cf420b2b3c15f1bd"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_leveldb.xcframework.zip",
      checksum: "5521a6e6e4cd01b2e31b099d4341f1bccae7e8ba43de648b028928573daf8bb4"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_nanopb.xcframework.zip",
      checksum: "a7fafe2e4e16d99de4c58f72e22dcc53221885aa6d678d1270123e4b01badfa3"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_openssl_grpc.xcframework.zip",
      checksum: "b2aaede82457cdd15915762a4f57b38e28ba0f47b9b48556a7e0c46881973096"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_Promises.xcframework.zip",
      checksum: "6d8f1a4b3d561d67adfc2026834779b05685d1cdacea6e83c70d0641c39f24de"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.16.0/_RecaptchaInterop.xcframework.zip",
      checksum: "cf5cc62ebc237b34d5267c1190d18f33b424dbc7f81713f127108d0ad8a592cf"
    )
  ]
)
    