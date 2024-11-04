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
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_AppAuth.xcframework.zip",
      checksum: "219565061443ef98361a67ffb5d367004137be98b3576a19c25f40a7b83c6f74"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_AppCheckCore.xcframework.zip",
      checksum: "7a0d83f6702958ff00da9ae40b33c58b2ae77b25fe321d66c2a86af9727838b7"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FBLPromises.xcframework.zip",
      checksum: "423a61196ac0aabc07f326b84ee45c8b8f0d7c76099dbd122b01e990484a38b4"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseABTesting.xcframework.zip",
      checksum: "54c217fe9d7c33f78f023172b0ac912528c2d0decc9cf39a2303c28072f5d867"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "53bb90bc90d5802391d37e3621bb99982dc547cfc41ac5f342766e1f04233528"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "1715ce7bb9c806047a5b7710ffb55374ecc1c26323b18f147b703db87d96226e"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "86a6acfabad4a78bbf7525b4aa9174f3fff68a310c16a881690bd52d5892acd6"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "7df7c42fca10ff10571ea3087f47a0f19ae4daf98348782aa72f4cb95ff18746"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "4f85d6bfa994b265660786bf9ceb3d23fe1f41761ab6c52e861cb430cc960ca7"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseAuth.xcframework.zip",
      checksum: "b555b7598c51c90b7bcac1086ab30e4b53443cfb4f34b00fb9485dcc10991129"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "5346d587c2872b80a6017b26099adeb38ce6fac2fc1f9906e1cfd4fd483bbd78"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseCore.xcframework.zip",
      checksum: "88df5e3ed24a08df7425a9420fa4ba20845e4f98b0226544cc310b157e0bd37a"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "99f5133176dd296bbeb87806815f34f7fb42e9b64624f26799eb79f51ccd5370"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "8f0fbc6e3b4a09ac679bf0986429aa1df413030928a6d75e94edfc6b8ce310cb"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "82b25ae48140ea4ca0d967f90f528c1c300e0e38c98a963a56dab31e3edfbec4"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseDatabase.xcframework.zip",
      checksum: "a20b4cb884ec1a4936b64c80726ad4493ce78dc83c597acc44032ff13d46589a"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "7fd22f463b793656eb30e37bd727130f2f4367b4317a2cfff01d206a85ee3e8f"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseFirestore.xcframework.zip",
      checksum: "ceab5d51b6385ac628b095b092acb56cb2e2462b93313c9a3b7b492878e93071"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "33619e2f9170b1f92c5771d48ca07ce85b9cb7d7d324da131acd3850226a2387"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseFunctions.xcframework.zip",
      checksum: "a2c6c73b0a8f438b40f62a555e93aaa4ef35837be4111c795f020ab856c9244f"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "5ed66bb3824accb7388f8f8a29d3b2e78293e6bb6ba7e673b257abd9ac3506b5"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseInstallations.xcframework.zip",
      checksum: "2b25a9feff474eb6883dffccb925f827629305c7d1d458a8966845fc7dfc6be1"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "8ffd32ee2b715d31d4c8ad23a4c54280fb216328b268ae88fd52ef966c713931"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseMessaging.xcframework.zip",
      checksum: "025acdc74fc9cc9d15b472514d7171d2622634ab7e3a872a9ad6f3ebb02619f2"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "fd2747c5f2d0c7e37ab59cb7cbc3c3456b7c7c7cb31ccafe84aece1c60930a23"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebasePerformance.xcframework.zip",
      checksum: "7e78473b8d94728f6a912a618c977adacdea2c6aceca436b367d17d0852277a4"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "9699175d521728abd595c96991ebee5e3bb962a56719f39f49a78da98127a00c"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "50ca2e8e8ec0c0ace3cab2b66e37d9bd63c9abfa2eb90994f6d188e4a70b1610"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseSessions.xcframework.zip",
      checksum: "6e0d6e0c645c40041d5c087d169cffc483efb9ec4c98c431e871598674bed77c"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "29e334e461d47ea1c60bbf5971f8d01efa8d6d83db1c3354ab3edb416d7b0e67"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_FirebaseStorage.xcframework.zip",
      checksum: "a985c912fc1b56fcbf7d536f2c4b2dfd77574dd9b4f54b07f380e57322472908"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_GTMAppAuth.xcframework.zip",
      checksum: "a81f8979a80bae95b4201826ba3f03d15beef9bd977bc314d450d8c9cc51b073"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "995ce8534212502680a3f19bb84a00f6e98eb7a22643d65f7e264866fdcd53f2"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "0ecbdc448d83d26c494aea44b9229117c6288fee8d25c73304c255e79398a4ef"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "5e4934eccf2c8099ae0d9c05729ed2b3c1e2a698cc9dd58c2bec4d17b6e75d6c"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "85efdc50573de5bd0daee4c6335862ccf1b9c1b8309c07000610cadef1de48fa"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_GoogleDataTransport.xcframework.zip",
      checksum: "5d27518d6b9b783977974ae29ee0e742047d87ecd27b514041b8650e96664ec7"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_GoogleMobileAds.xcframework.zip",
      checksum: "409b27fd5a5b27d7e1d603d78ecc0d4f0b9ac061a4d4bbafcff224d6bc9f373e"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_GoogleSignIn.xcframework.zip",
      checksum: "4cb5ef1a08def49c95df6b0d2cc49ac22ad85de88451875be39131327fb1adb7"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_GoogleUtilities.xcframework.zip",
      checksum: "d07ba349cb061459c96aa5de0c0d73bc2a2e4c6a2657b4d9288f8e65b9dece01"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_Promises.xcframework.zip",
      checksum: "bad62dc42ec3c7b4890c680143a53ce1a9503cb504afd3cf0b8e8fb743406086"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_RecaptchaInterop.xcframework.zip",
      checksum: "b63835fdf8aea90291a5ba51ce0c60b68cc988e5d7c5eb80f23496f659bae1a9"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_SwiftProtobuf.xcframework.zip",
      checksum: "5cf1d59b3d25f435a9702dfcdfb91d08f092753eca17cf30a6be90ade124997f"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "f7225b2b458795265ba12e681626b535d7a0f740a9b51e9833c64f1c8831566c"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_absl.xcframework.zip",
      checksum: "c80ce52fbb02bb336f6e73e39f56052a4ba0f2fce36fd483129d78f96cb446c7"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_grpc.xcframework.zip",
      checksum: "e91a21142914f3320208b465bdd5aff61d592d02e6061ecf932c8c9649ed232d"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_grpcpp.xcframework.zip",
      checksum: "98c44a3a1dee2de98fcf8fe99220734c078d64854c3583b3a05eb8672ff4a264"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_leveldb.xcframework.zip",
      checksum: "380f1b3e738718fbfb58300d9257b3fc8fdbf10b414bb04ebe2e6b19a5251ef8"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_nanopb.xcframework.zip",
      checksum: "302f809e1a509cc18d3a76c5e5e2fd5559fd29f677bcf5516f99a9a81c2a7534"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.4.0/_openssl_grpc.xcframework.zip",
      checksum: "ab55a4f41336ab5ff2e7b26a4879fca50466bab1ecf43e9c444ef9e54734e39d"
    )
  ]
)
    