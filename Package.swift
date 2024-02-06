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
        "_FirebaseSessions",
        "_GoogleDataTransport",
        "_PromisesSwift"
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
        "_leveldb-library"
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
        "_BoringSSL-GRPC",
        "_FirebaseAppCheckInterop",
        "_FirebaseCoreExtension",
        "_FirebaseFirestore",
        "_FirebaseFirestoreInternal",
        "_FirebaseSharedSwift",
        "_abseil",
        "_gRPC-C++",
        "_gRPC-Core",
        "_leveldb-library"
      ],
      path: "Sources/FirebaseFirestore",
      exclude: [
        "Resources"
      ]
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
      path: "Sources/FirebaseInAppMessaging",
      exclude: [
        "Resources"
      ]
    ),
    .target(
      name: "FirebaseMLModelDownloaderTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
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
        "_FirebaseSessions",
        "_FirebaseSharedSwift",
        "_GoogleDataTransport",
        "_PromisesSwift"
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
        .target(name: "_GTMAppAuth", condition: .when(platforms: [.iOS])),
        "_GTMSessionFetcher",
        .target(name: "_GoogleSignIn", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/GoogleSignIn",
      exclude: [
        "Resources"
      ]
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_AppAuth.xcframework.zip",
      checksum: "5363676048f1e306884e6684b0bbd1acae2ade5f524761a43b73231eb9e4928d"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_AppCheckCore.xcframework.zip",
      checksum: "d7999ae5249cace40532d4bc9b08edccad83bb0ee828aef25e47787e61037a19"
    ),
    .binaryTarget(
      name: "_BoringSSL-GRPC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_BoringSSL-GRPC.xcframework.zip",
      checksum: "e63b76769d6799b476a1a65b7bb67bc6be70ca6520fc441e5ba2986eedee390f"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_FBLPromises.xcframework.zip",
      checksum: "be755a0b84261af09d34895ee9dda4a12484fb30c3f889b9cc2d6d3ed664c1c5"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_FirebaseABTesting.xcframework.zip",
      checksum: "1e931e659927544c8bcf49d44cef85d80f84d445644f84736e616f24e0ae3718"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "52e23c950bd2203294d2868f5f2529cdeca57b573ba171de86625ebf3439270c"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "184bbcdd2bc3e16942cdce2fda8dfcea8e929617e477d02b60338924d723b666"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "d1d1ba37b29b5a21eff59e7e5cd561d19a4446104cbe93e97f59cbab85aba096"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "169fff73d380b518c4714e1f87eff4b6591b842542e5fd294e3127243a94d975"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "fa7d4f9ab40acc8c8df4cc680ceb26e0729fd279e051237585fa8bd70fba0c99"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_FirebaseAuth.xcframework.zip",
      checksum: "42461768d5bfc56c3d56989d33c69446076285ce6f743a9231243ca9587772a8"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "29c672493191d6139c28f5230be213954ea7b7e9f0748d88e4289374614c3885"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_FirebaseCore.xcframework.zip",
      checksum: "e79af0994c963a8c1a57487ed0257a9ba669e721f3a8b5dc9747b0e6df896493"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "b4b091a8a933cf5a99314e16c6c8b35c981469d275b82b0c986a2fcc1ee39171"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "4f3d2ca3181acc41f4750b19292d320d06e21edf64c2514d252d06af22a13c13"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "2df1a095ba919bc4ce937c7e877cc9ad50cc5f4d395ad3c6ebd662f937cd7de6"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_FirebaseDatabase.xcframework.zip",
      checksum: "c57d6110d66d23748a8765f8d104fe8f651a018490388b00df6d522101eb4e74"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "aa6cc13e32e0ed019b1b0521cabcad834169428a4bbf06f55ccb5a5da756574c"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_FirebaseFirestore.xcframework.zip",
      checksum: "e8bbb9b039e7b6edcc62797dbb78bc22e54c0d84dd032d5f6a059b9aa4cde71f"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "bfa8d0d680bf3ae39322cc949eef96f5062d583f01f3fff41d9c0d7e7aa106c3"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_FirebaseFunctions.xcframework.zip",
      checksum: "98dd1653cc0339f968d337aecb6c3d57dc766532df77ddbc8bf4fff094b7fc28"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "4368d324085978dcd2023267d7f7bc1b8dcc07297f3472109033c0f5332fd0f5"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_FirebaseInstallations.xcframework.zip",
      checksum: "bd0960c4608df80e04fe585fc849deab65eb127ed4361f030b578053298ca468"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "f66ec4e6e3e2df616f2a92bd158331f79d3d35434c1263d3e4936eee9bc72025"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_FirebaseMessaging.xcframework.zip",
      checksum: "638c80a2de1bdacf4a7b5df606ebc131477f5a81159056bf6fd7d5f6319757c5"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "9401c5e237409102dd4bd8058904e3e9be96e17d593922379a8212333af90c55"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_FirebasePerformance.xcframework.zip",
      checksum: "838aaeab2d9a31342dd919763623ff4388e12abff08a1c18b74188ebf0b6a254"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "83e51693580a610e304a3f20afc198c16cd0469aef5ff6d5760cd06a0098349f"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_FirebaseSessions.xcframework.zip",
      checksum: "c8b9193174da31d3891f34a0d557560d469588adc139009553b7ce1ce60b8fea"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "157c21bc65784fdfcfe0c048a0091645e514976c4d15d8695e9eabb57180e84f"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_FirebaseStorage.xcframework.zip",
      checksum: "40c75b62057448e42ce284e483bc29ae35f1fa8c37c9c6854732ff054a9757e4"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_GTMAppAuth.xcframework.zip",
      checksum: "f142ecd6626778dd33d4fc9ef87de217ea9baf8a305f8dca3092b458331d3765"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "608fe11017919e0efa6fe9efdac5ae63836aac7970f2dffe1c54629bab585abc"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "ece0efbfa817ad1a92958c4c777ccd850cfe7275b00777021796a9e1ab168196"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "f26be5b077de1a71f55a3fb05d914d990d4eac424f071991123bf21e080f7185"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "8ef466d66488c3da32e06404ebc7dd255a0c9403f3aad0d6d39121fcf8b2789e"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_GoogleDataTransport.xcframework.zip",
      checksum: "9471f88dce83c1946fd19a6e986e1c2d753c1d83c5487f8594bde7926796f7fb"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_GoogleMobileAds.xcframework.zip",
      checksum: "63710b1813745516a71bb555a29a70683886bf3117328c71f1ae3f20722f2cd8"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_GoogleSignIn.xcframework.zip",
      checksum: "e7bee97f3d220ba1ae560b67963761747e10bf7b85c0ccbca4e1066283b5ffd5"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_GoogleUtilities.xcframework.zip",
      checksum: "995f9d6437f48d4d98053429c2391ed1e2c6e95ca1c9914e03cde66f95453835"
    ),
    .binaryTarget(
      name: "_PromisesSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_PromisesSwift.xcframework.zip",
      checksum: "c3e246ce34c9a0b28194e53bc74e47fbc770353d9c0055132e263a600b4bae90"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_RecaptchaInterop.xcframework.zip",
      checksum: "6e8f0d492bcfb5be9bca45a3a45ee14b3208283619c2958f270e57c50465216b"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_SwiftProtobuf.xcframework.zip",
      checksum: "ccce4c711c7b46124895c3a1f3095908a4d2801619410a348e0651c74a261490"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "524ba044e03543abe8a40c0218203a6ae3df27df395bcf79ba61e5b8c4213345"
    ),
    .binaryTarget(
      name: "_abseil",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_abseil.xcframework.zip",
      checksum: "ca17aa10ce81357df8c940137d242a264bf9387406ae1cbb6e1b4b3f28a99d69"
    ),
    .binaryTarget(
      name: "_gRPC-C++",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_gRPC-C++.xcframework.zip",
      checksum: "a9f8a32286a1d18f737ea3138efa1aaac300b95d033b86c8f56876fbad527792"
    ),
    .binaryTarget(
      name: "_gRPC-Core",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_gRPC-Core.xcframework.zip",
      checksum: "e7f47b116b0d1a5a7bec4f763a16ae7948665ab57f84e4f6b4ca6c7b88279612"
    ),
    .binaryTarget(
      name: "_leveldb-library",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_leveldb-library.xcframework.zip",
      checksum: "d72c1053a7a6920d3ac0cae74ed0f8c9c20a544dd92b1cc910257002580389f0"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.21.0/_nanopb.xcframework.zip",
      checksum: "2f4880c15a812f6c42cd3a23f9dba2d18c4badc73c52456d3f3db1ac1f95c27c"
    )
  ]
)
    