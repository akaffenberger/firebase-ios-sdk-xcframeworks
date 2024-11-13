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
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_AppAuth.xcframework.zip",
      checksum: "1ce81dd46a660b8d1676d076b65f7f8a421fbe0b9fea12671c7286a3d8f503bf"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_AppCheckCore.xcframework.zip",
      checksum: "1dbe8eb0267157fa5f6d3f6c9a4c4b5abb3e77911a3a93127e2a2da41a183967"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FBLPromises.xcframework.zip",
      checksum: "8e144b579701eed675a89c348ee53e474253a1536df3bde3449c5e6a6bda1a3b"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseABTesting.xcframework.zip",
      checksum: "3e6c044764e246556f21af1ed2617b569ada9b1a6be7d52191f2e8820de06385"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "b49846e63d49f781af0a143dfe3ad55a44d41d0b8e23abb63924e466f7d14c06"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "51f55d221ff92bc10405915e8da077597ea3817700ed0b2e632fc499d174d633"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "2914b3963dc2664210506748f6effacc24cef6d5e6e690f97702040b91a3619b"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "3c88ca57760bcd152d3bd131604a521be9a5dc84ee4b983ef7ac423002a4eed5"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "f0d0e5ce83feff1d2ac895b951619cac751719d834afcfaf5ce5118ddbfb6bcd"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseAuth.xcframework.zip",
      checksum: "6bcb628f48a7d9656277f75489a6381bf0a978a3af606bc1b19bb06da06d5fe0"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "305ad81649fd6c8ec80170745ea88bb29722726325221f03c6f6901e5a6247fd"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseCore.xcframework.zip",
      checksum: "4343ae0fbac60dd7e1a4ee710f1e6ca6f07bc880b00773e81a5223af3631985a"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "87452ff34805f1e85c5f9ce029b4ef51c8c15a9b78c895e15e8190adda5635ae"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "c702641b58e8823a543c1052eb620da63f8eef5b5238540c6d403da808cc307c"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "732dcf392ac41047fa49f67b25a3a2ae3863ef7e642bb103eb7c6076b26fc394"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseDatabase.xcframework.zip",
      checksum: "b872a95d883143db88c71d35f33cd7db61786f583ca5f3a75ebd6f639bac2000"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "47f869bc6579616e0eb25fd74933406a48d971f9efbf7c64b34e6bc50bfd0487"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseFirestore.xcframework.zip",
      checksum: "4f3aa072f4e0f8787a7aef6260178fde0efb9e3081f3a26b4bac90cf3aab1c02"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "ef5016ffadcf7f39169419b4a51460b28c14788fd3fcde1615b059d6be882795"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseFunctions.xcframework.zip",
      checksum: "2a8ec62597940dd85e18861d7382f8e5784ea6154c765ff653953a11caa3c402"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "c547ed26e56d919ce0a8bc4e8cec520caeae1b6c6d17083040c37183e789e8b5"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseInstallations.xcframework.zip",
      checksum: "73024475d6b8833c2814df146f8911e307c0bebcb7200b33f62d159eb9758f4d"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "8157594d402c8963af9a2705b1b97d75f8c0df3f98bd9f1fcaf0cb96edb0e8b9"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseMessaging.xcframework.zip",
      checksum: "2e7d5af542b3c4cb48b50a567e41ab2e883c531014877341d80f19b2d04fb479"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "e165ee68a1e135390e20a4e15fd08883d25d625e9f9716b55ce538f9cd1c045b"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebasePerformance.xcframework.zip",
      checksum: "210add06c19b84927035a862f1d24460fcbfb5a281888d358b492c21d5db64c2"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "28f44cdb850a502c78b6eb08d30d8de57d0c961c05a655ee7e1212adb241720a"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "a84b3ad7ef5d706eff340c5de0acc903c088fa72cb0923f318cae6b0902d69bc"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseSessions.xcframework.zip",
      checksum: "b08f25215bd7db6214c650cc49009aae147b60b550d501476a54e5208e298244"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "9d68692438f6cbae15ea02d675783ee25985ec71af4cbd89b745d0a0e7bca589"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseStorage.xcframework.zip",
      checksum: "93589bbd29a495e245626e45f88d7c7828f759d85ca4db1dfc1f9374c6fa32eb"
    ),
    .binaryTarget(
      name: "_FirebaseVertexAI",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_FirebaseVertexAI.xcframework.zip",
      checksum: "ad7c89cc278dbe6586038aee58ce0f67484e933cde659a1d2c9e6fc8f8c72fba"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_GTMAppAuth.xcframework.zip",
      checksum: "58d3b0476c836ca5e2af384adfc4e5671c98054ebc8f9eb87860468f43a3a723"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "ed75f57d9945696860e352af463e18dff32f65fdece14f2b872b9be8f7d19d1f"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "462f0042f3914aac7245922ba7628ef81c2ab262704eb21823bc11ecf5819668"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "a71cf17f38fb8cec3f45cb4a7cdcbb131cf4a15bb50c8584eb029780c73f0224"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "460f64a7e67b0f4b77ec7c8fec493143b10d49d11d7275741bcde32edd1a2c37"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_GoogleDataTransport.xcframework.zip",
      checksum: "bab5ee628f89e0e7d70a9faad942075c53428605e03d283a5ad1d95c4d4124e5"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_GoogleMobileAds.xcframework.zip",
      checksum: "3d388034fdfcaa165dc595d437bdf24d90dafe4fe54604ffebc774c29530f1dd"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_GoogleSignIn.xcframework.zip",
      checksum: "28c6b3b19d2f5500161b2a13303d47f81e5ea7142ca8d3aca8a9d075c3a2d629"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_GoogleUtilities.xcframework.zip",
      checksum: "45b1791d4b001fb310f40ee868e79e5c06ae92c2cf9a2fcbb3e071cdffbec059"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_Promises.xcframework.zip",
      checksum: "7906271052670c55e7a6316d69dd0845cf05c8a56660be8538267626aac07d8e"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_RecaptchaInterop.xcframework.zip",
      checksum: "04308c32085d1eea0c2fe37b7e432c8e65eaa9cb4be6d82e0bd27566be682f52"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_SwiftProtobuf.xcframework.zip",
      checksum: "508c8ffdf4066e82c6492176f67356b002c1d98d65b38dcfb075114ab6994a95"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "fb4805ace8883c0e3374fe36e422f7b387c3663812f2537d101ba9858be25980"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_absl.xcframework.zip",
      checksum: "441cac7a9da91b2e1e56517f4c3b12467d0311eba3c5b268419a6a29c5a100ed"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_grpc.xcframework.zip",
      checksum: "cd397d99fa5d0fa5a0ca2700625e4cc755310d7dfb83bcf74eacaa0effa441e8"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_grpcpp.xcframework.zip",
      checksum: "1ab47c902ef9c3cc86db590377fe3b97f0283f9460572fe12d4c535cc70c89cb"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_leveldb.xcframework.zip",
      checksum: "0f551a062bfd916bbb22dba323f3a6f79b8e8fac71a3cb86f47d317666a15314"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_nanopb.xcframework.zip",
      checksum: "54fbbaf30dcb8748fe67ca4da7278761be497077b5c2f637b4be7d91518f0a2b"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.5.0/_openssl_grpc.xcframework.zip",
      checksum: "dafcf3ca51d06a63d8921272ad594e5391ef10597f2db41c9a8c9a3714aadaba"
    )
  ]
)
    