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
        "_FirebaseAILogic",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension"
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
        "_GTMSessionFetcher"
      ],
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_absl.xcframework.zip",
      checksum: "d16a24de27720eab2bf2c883fff41f0635033c00350639b08a4979ed25f2c10b"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_AppAuth.xcframework.zip",
      checksum: "aa44cdbd17236684cb03aca70c44885fed5ec40d12edfa7920368c1a332357ce"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_AppCheckCore.xcframework.zip",
      checksum: "fc12522167fae340ccd517670cbe1293682f946ce8ea043abcfec5b07c23e67f"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FBLPromises.xcframework.zip",
      checksum: "e21afce47c53c18c08edf05149a301eb42f965ca41338df2cb3766bafc664dbe"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseABTesting.xcframework.zip",
      checksum: "250f2772c6c37f5576700f831fb19b92d0d495d18f124f17931223316da7007d"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseAILogic.xcframework.zip",
      checksum: "19964dbd3b7ef1a384bd1a42a433e0c47115d33acdaaa9facd429cbd381a3288"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "a8a0dd4dee07cc909ee52bedc84e3819a8e68c859d36d8ef0c18626a1b098aa2"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "92043db807df48b51b4e341962e33e9c04972d8ac757033ebd8b284a1306b76e"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "8415076228926533901d9e14dabdb256fec4b81595bdcb2c68a8ecad1eb221a9"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "98fff6b49834fb7b3e7c5b2e6d20585d2619072422774e3ae94ddcba2ed73946"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseAuth.xcframework.zip",
      checksum: "f830cbc2029ca6005d5fe7a9703f40941446981b6ab38a3f77eb79cf74897734"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "17812d986c1cf21b3dcd45e42d1e6f5cec2fdb68ba4165be67c06e2c0053abaf"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseCore.xcframework.zip",
      checksum: "0228563f1ba5488f799ebd69b2a7eda785748a8d188159790be63f6e1fe99031"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "843186a2d81dbbe260b8e4e5e70b662250bbf130766209f21eee00d7b2fd2776"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "40ae2af0fc9997b8438c94c16658944ae8659589a558aaf9d95832290a2a6168"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "dd33b0599f697f0816cfb70b64ffb19051ade414bc432b8f59442b9d3a435c17"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseDatabase.xcframework.zip",
      checksum: "80919a5816c0da935ce95054b30b56605ac708a254242f0cf0e4591a90621dee"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseFirestore.xcframework.zip",
      checksum: "2fd3da34d21ede91e90d9edcf682ac4f2dff05ff0729e02b2fe68fa6d9114354"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "6e4b1c78a55035512fbd1f739450af3435a3bfe5ba076ae69e19f3cc1ea4b3dc"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseFunctions.xcframework.zip",
      checksum: "cb91d06f7b850c23a559b1808da22c18c047e6935b8c000adba1d8603e21b256"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "2735a5e05d5141596bc25103a969c7db3075d8964c693456ddff962f084f0266"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseInstallations.xcframework.zip",
      checksum: "2d49c4b4fddd5984201fd75720eef8bf1c1bde66aa075d18eadf9caa2f325afd"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseMessaging.xcframework.zip",
      checksum: "c29e3cd21520c1d92edb2fff80e4aedadaa1f577352e0bac79c18e530143425a"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "ecee80b4f84970026161d0e1c1eb50885ccdd85fd7303e8c56a9e50b51f5ee80"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "f12851413d5e10ff6fcbffa714145108c7a38a36d16329a0aee87863fc37880e"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebasePerformance.xcframework.zip",
      checksum: "a70133bc6f2620acc7b63eaca74f2e4d5df47e56c30fe2024dcf8cafe1dd5e9f"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "fe2682cb4eceb644a6b0dfa8d089d33c10c15c185391652bd2f8407c546498e2"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "1bdea5c888d034cfe6e776407654a983ab08139518d6dd04acbd24ca1c7cdca9"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseSessions.xcframework.zip",
      checksum: "2d943ba88d938fac206a325114a8a4376b5029ab3491ee48d30e35641fa02022"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "20b6f2b16896783b5b63bfe4d39982e9285936016d3448cceef18ac079600480"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_FirebaseStorage.xcframework.zip",
      checksum: "35871e4c4b9d0d47bcc17ece15230061b66eeaf07676146891a9fa29e0d5bc2b"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "44531c07bee6093d93280534d804f78792ee1b597ece9449fd26fbb9a6557be8"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "aa2f835ff46508b1b566e91339facd138bb62804fe5c1f6ec893d4ffd73f023e"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "08da9eee7c998885f063927290614501f8081fc6fa1fc6bd168478d4d4e0450e"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_GoogleDataTransport.xcframework.zip",
      checksum: "449209cb8ff0979762510567da06ca0d2f3d9d8da62d40029c7255ccd4837976"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_GoogleSignIn.xcframework.zip",
      checksum: "edb1d89dd5621afeafb1074dfc389370379c570b464a95c2507eb3eb4695d96b"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_GoogleUtilities.xcframework.zip",
      checksum: "9458662e7df33f512d6ddfc05ea0ff31b946481b8ead5adf2431a4cee2f86559"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_grpc.xcframework.zip",
      checksum: "d334a32ff1cd9d6edd9394b729a4705e8a1898ba50aab6769fec417f4e26503e"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_grpcpp.xcframework.zip",
      checksum: "df2b824be8c19f89a135c9d667061439708c7d1f2d1d13ba140d81724968a493"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_GTMAppAuth.xcframework.zip",
      checksum: "fdfeb58088b39b008660979487d49cb9c8dd54294a81091b6a284317d7809517"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "0934060b96301a85402b74b0db260c9461358984c21820e9e8a7cf39c733f55a"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_leveldb.xcframework.zip",
      checksum: "40337f63e8908228537ea92cad0a188360d0bfa8013be5c1ce69a36b01aaee4b"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_nanopb.xcframework.zip",
      checksum: "7b78cc3395a64d64a57d2cd120b853163b71efeef8df28331d2ffe6eca1acbb4"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_openssl_grpc.xcframework.zip",
      checksum: "d203d8e9fd8154f810e2cb5fdb6b6a504bde7f8fb9bfa84ab08a0cf76a4a3947"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_Promises.xcframework.zip",
      checksum: "c474ae283a8e8bcab0e5e000ea49a8d3a3808993068f92a6ad45071f3019eaee"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.10.0/_RecaptchaInterop.xcframework.zip",
      checksum: "28833318cfe0e15460d767f006aa8cdcd1b349e8edcffa698e85917e29659537"
    )
  ]
)
    