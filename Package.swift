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
        "_FirebaseAI",
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
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_AppAuth.xcframework.zip",
      checksum: "d170a16836509c903cffde0a2856618d2d89c0572a406810d9699b4c495918ff"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_AppCheckCore.xcframework.zip",
      checksum: "63233d6ee9e1b7883f8caca3abcc0daebb3f4db51775309f3ec973c2ff087adc"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FBLPromises.xcframework.zip",
      checksum: "88df5dff96fd77e02a37a5605b610fdb7443ccd887d407743e16bcbaefaffcf0"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseABTesting.xcframework.zip",
      checksum: "0876d22d4f079097b133f3f77ee360832b81cfc9d8ceb6483ecd2f1b5ef0f9db"
    ),
    .binaryTarget(
      name: "_FirebaseAI",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseAI.xcframework.zip",
      checksum: "d8bcadd31eda201df02d2ddedb85bd1777dd8bc656bbc33dd620e4fd7a43ae04"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "d3fec77726483f8a159656af9c14b1e0be17d003ab1a6591d77c64511140c8af"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "c0d3d1885cbbc096ea242871a78ec571c9715eee85cb6cae58667ecca0dc8538"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "290428e56f5e2b24538b565ebdd26e723c3554da28a71d68b0e807c31bafaed3"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "141098556f29d287ea987858fc573e850d1b2aae099c22c4e2f133537ace78d7"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "423f1ac5f5dab0dba464cfff428b4c8081781c215e8a380e32e2bd53a35eb2aa"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseAuth.xcframework.zip",
      checksum: "6a2daa65fa4df3f1248bbe47543e70bfe85d22768acaa044079c428c6c5d6436"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "4b7c3e45de5bf2f1e0a4d69eeb6ea7c3b37b62cdd11fc125f6d0d6b963dc61da"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseCore.xcframework.zip",
      checksum: "c3509cfb1213d74918d1eb0cf5da329db65fb1ca755311f36a1ff48ee798b0ce"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "832e7ebf26040272c770aced5fb8e95a93803a1d2bbad478bc1afd515cbbc17e"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "e3b60e43fefa9a4a7e2e7872d1fb589835dd3de53de08845ac63047368aa308c"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "f59c6780ccc28978bfc2cf882aeab359fafa460d557919e4032f744e25e17bfb"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseDatabase.xcframework.zip",
      checksum: "e8de22986e90803e9fb2dace11878107d9c0cb5e41afae8496000e131947f8c2"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "ec95d035290221edef5b93d6206e2ceda0b54217a286fc9f7cd097d1f642c14c"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseFirestore.xcframework.zip",
      checksum: "444dd15b2ebbbf046eab43182811fb67638da5783f6b49bf821a1c283d3aeeb8"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "4563ff8e25c210c7d93a89b73fa43ff18b668ecfa99ae910afb8f5396cbb900b"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseFunctions.xcframework.zip",
      checksum: "59b7ff5a62239604dbbef3e11d62058b4bdb50741a8260e30d2fd93d4a53ef9a"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "5aca1e7abb965a379e6974eb920d926709d57efb949540ac0abaa90366b557e6"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseInstallations.xcframework.zip",
      checksum: "29c857252b048f127c0332481b36bd402245a6494825735449e79e70ec170a5d"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "8df654c0af843c22c5e619d3454f09f876475aa4b5c144335de1de214e9323a3"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseMessaging.xcframework.zip",
      checksum: "840350a9c0c7b03e4fec99d11161f35f422cc9d125956728fa9c893415777bc4"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "4c183e178647418dc0705b63c49bb4d0196d484ed5466989c0d86f68b8b89293"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebasePerformance.xcframework.zip",
      checksum: "c16ce44008394b840c2f07e4d4b1e3081ebef4ca44f67db46a6dc9298fdcd1f8"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "8bbeb14c63fd8b7bab013e6a2340ca2cda00f0a057d37bd6f91e11167df2df90"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "ee92c4db878c222a70c3d441c3281ca44a465da8076808e0e94a62891f1216e9"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseSessions.xcframework.zip",
      checksum: "ac88c9de98fbf819de6f6a9d07b3a84ffbca918d2e2db956b5c065877bd6f8b2"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "6af28d19464ed4608e1227e9aea9b18ec6e2faa575d67ad9aeb3f15fd1163a19"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseStorage.xcframework.zip",
      checksum: "c8f52407f25df5c9d1432b0306220874c21b43dafb7ebb348a5e149a40434d6b"
    ),
    .binaryTarget(
      name: "_FirebaseVertexAI",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_FirebaseVertexAI.xcframework.zip",
      checksum: "e1cf5f1a2a8e6ec9f7ada8c631c83cf929f61ea2c06350608f0b91d32837e272"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_GTMAppAuth.xcframework.zip",
      checksum: "3218c1168021c16819e4e03ac4a2e6d5261e66b14740bc2bd75dfa2d30734d0d"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "e4b524a3ff11ac5f4ed65b92317cf062c2e97a88a5677a314c714794be46742b"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "8d57c1fadc6799394c5b3f9d7cf1590c8810f794272cd7dd4b1bc5ed2d4b26b5"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "f9ed359962d4aef1708478d5e081788e3e1a757da6d927f44c729aeb39b4093c"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "4b1c97de494aa660934511ce10aa89a83a0d5e290b6995122bac800447274be7"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "59c792e7a62e243bafbc03e5bc26450e6bb7ef5935de50d388256094cc1ab585"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_GoogleDataTransport.xcframework.zip",
      checksum: "5e94b7a1babed1902cf829ac46ca5c7c695c003908e999cd69efabe1090908ed"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_GoogleMobileAds.xcframework.zip",
      checksum: "079612c5a56322d1554a84d03feb32b3f7c7b6f9f217ab9e8a417a44b5a2a740"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_GoogleSignIn.xcframework.zip",
      checksum: "3b2b099a516710cc22acfe544f66ee78394165e19a5b7e32886683c36f016e87"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_GoogleUtilities.xcframework.zip",
      checksum: "8636f104029097c5111d5642e6b2ef846d32b71888b561ec43ebf7c039309605"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_Promises.xcframework.zip",
      checksum: "c7e5fc2fdcb4d9e31f7f9535abce6f15efec7e75e95e36cf25752d4917d847db"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_RecaptchaInterop.xcframework.zip",
      checksum: "a4f2835df827fa3a06bb9828bb18223b360a2bd314db5261be337fa807819b8e"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_SwiftProtobuf.xcframework.zip",
      checksum: "0486831459bffe32bb5dd6fe0d96726fa35fc1d8875ac6c5288eba2bf20a9d3d"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "5b223925d5b93efee3f9645c9e3eb93edccf2d2d32561f1bbce82bc156258413"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_absl.xcframework.zip",
      checksum: "968285b3f7070e68ad06dfd4d717893215b92af4c658e765c5330f1c7a8fee1d"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_grpc.xcframework.zip",
      checksum: "bf1be471148c9ae3b313b26dcbac0bf037a2e383cd3ec6cb59a12cd4590342ac"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_grpcpp.xcframework.zip",
      checksum: "7762949e202030548fd0652d845364fdaef517a3ff43d1e15e0f82130f25705c"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_leveldb.xcframework.zip",
      checksum: "7a627fc2fbb3c53802533a019b1ac6993ec91506fe8a6a9b6fdc31b10fc63348"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_nanopb.xcframework.zip",
      checksum: "ab4cd3e1e1d2faabad4d16f33b0630c326bb0a52dde7219f8bb5ba288c334e0c"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.15.0/_openssl_grpc.xcframework.zip",
      checksum: "a16a200ad01118779a1483b8d956f9aefd632dc7b6e76cee38e57e7a7ee1325c"
    )
  ]
)
    