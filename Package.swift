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
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_AppAuth.xcframework.zip",
      checksum: "aa127938409de00e8861fc4d130e177248ee28236a4716f444bb0f4aee587d64"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_AppCheckCore.xcframework.zip",
      checksum: "bdadad7aa781a782ae673c5d71b114d75da170334b31dbdc9379b2068d4cd2b0"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FBLPromises.xcframework.zip",
      checksum: "c74f758d3ec809b85d04f06052f1c29df467af3f3f80492844bfb61a30a79b47"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseABTesting.xcframework.zip",
      checksum: "66c303b8d95e78221a5b6139fa8f08c0b15c3cfa0ed78c6825795a48c2819e2e"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "bf330562789b17ff41ba4aba18ebd4cb9a3f86a744ff60008e54d0545bf45fba"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "e5dc06684082d17f83fc4e039caffe1d9bb033c810a627c47737d1a9e805a82a"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "f88dc404dabdb875b91de2eb040c91c50a2f7279fccb5a420328f9cbac9b5e37"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "785a413e4e90ccd609bf5a5d6e1a69e17890647733b58ab0256b457228fc9cee"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "edb24477364cb931cc40dc93d15262bf3e442690dd285dfcfd3bd6909c995cc5"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAuth.xcframework.zip",
      checksum: "167fde6bb9fe0c0cc8dccce90aeb684ada8f27aecf51ab069faed14f612721b4"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "41285e1c6ffb9f99b8488c5fdecf1ee26c130db04f43950f74dce0c951399501"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseCore.xcframework.zip",
      checksum: "ccac71f2dc5a36617c04f0ab8fb642fabf3a0d252aedc2224754f4f2b7659f97"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "ba4ad97e6031b024fbb6269e6b773837db60055b910ee73661874293066c1416"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "8c0457fef4fc38b986a6ed85406c7b882d74ac59831b2e260f9527851b9e647e"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "45d9727906d4950936238c4a325b7f12bb9859d63931ed973334243f186d4766"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseDatabase.xcframework.zip",
      checksum: "bbf5c07c54a1fe3b595700248fdf228d0d84a5272493a299f2efe938ef3f3070"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "89df33cea983526a44f06ecddb551b1f0693f77e6bd8905f8afeba3d1b807261"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseFirestore.xcframework.zip",
      checksum: "df1bf15f6fcb948c2d218eae1b9e8be3abe2d2d03cdbcec7872a06285676fdca"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "6ab8904c773281bd917f60819e6d8794a7039a85398c9e6d2d7face37fbb4bf7"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseFunctions.xcframework.zip",
      checksum: "9021992032be51db2290efcd5d376568152561627795df6e461e16bb3f5206fd"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "a51d3c4fc26db9e68284fd862a55aeaa2e8d39ebf665bb4bc4c667f3add0e509"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseInstallations.xcframework.zip",
      checksum: "eb1cc18ecd39f4e84e0d1dda2de356386bd0ecb580d7cd195706e0026d808bac"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "f0eecea6ce412ab5467511224c3db9eb1ef08b991e30fa9319c71bc16428d665"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseMessaging.xcframework.zip",
      checksum: "79fe78a75cea4ce8411ca250971322d03837dbeba5388d21195605d666b126e1"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "19fba9630b8ffb5ef1e4a4367877bdd65f9ce741e409e5db9fcad5ab1d1c0a11"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebasePerformance.xcframework.zip",
      checksum: "e77abc9e0db0ec10e1f7d186f61d3a347cd03c7b684cbeb3e88c733a970450a8"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "319648f64a4d2eedd7f501da6f8e733bd7d0c30ae9c4aee421a434c680e18422"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "15cf4a3278dcfe3fd042ab86d463c22da58ec9e463c133e5dbd4a66b2d230ea6"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseSessions.xcframework.zip",
      checksum: "ad48410e3d19dcffbca2b6dcb792e2f0ea93c300a4ed4e1a295692e04d373d63"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "be08805574a324678f2b1a078ac3978a8d45b91065316529a5243830f904d794"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseStorage.xcframework.zip",
      checksum: "ffe748840519b35f036b3046beb37637ffd57a11198291a92a464a8ec2d90a5f"
    ),
    .binaryTarget(
      name: "_FirebaseVertexAI",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseVertexAI.xcframework.zip",
      checksum: "e57a3f89518ee3b4c1a13041bbbe478733a42c3332dd1666538019be3bbe455e"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GTMAppAuth.xcframework.zip",
      checksum: "180e235b2731e483a379f710a6dc4c5a52dd5964438ac99d435251ae60083096"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "85fa2a656bd019681981b005751f943a3aa322c4e9aeae7a9cc1b35510e18b9d"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "ad70f27c22aa9f8344bf205c6409e31ac1f73cfcd77b87496fe1b0d2a66c5d36"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "b18ef81b33b85b024564c8c35d7667e3ad020a1ab5b8f135384432cf3aafdd46"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "3bcb85b73d85aa94bc917f3d316e63aa0d62d7e8246a49737fe67412acd6b7ec"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleDataTransport.xcframework.zip",
      checksum: "33681b8cdb0bf56881c19d15c5a69afd376c1c9e416f620e2d99b4c81cae653b"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleMobileAds.xcframework.zip",
      checksum: "efd463029a81f06f2ae11ab19cd85d2d8ae4f12c592ae6cfecad92525adf2da6"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleSignIn.xcframework.zip",
      checksum: "b6b1b07728c103f58ca8e226979f8e85f20e2b81bb5fbdcecf61bc2dbd0e035e"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleUtilities.xcframework.zip",
      checksum: "787dcec84698439482ae61ae6ad0a95cf71fcca5d0e2a10b74b1a6c7b8ed58b5"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_Promises.xcframework.zip",
      checksum: "2fcbb9a898f1fadb41fcac3308543564d1f54aebc0aee3451c6549907987b5b0"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_RecaptchaInterop.xcframework.zip",
      checksum: "be74014e99446dba529e4e4781ff7a7ed47fc3a2b9194e58e6ad8daf1eed5527"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_SwiftProtobuf.xcframework.zip",
      checksum: "4ef67a164d0ab4f512f9a6ce53bf36ea5f501e4a6f49221b1c053f6f37d8a4b5"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "f644c6cc4cff76a7fcf05cc4d48b9ff5fb5d1b67cce87602c594f75ea108c1f7"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_absl.xcframework.zip",
      checksum: "583acafbaff7504c58ae03c6bf10f930ea85ef7783b6447efd3358354a29e372"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_grpc.xcframework.zip",
      checksum: "8fc5f92118160735ad02de382137d2c65522a1fe65411c61dce81abb25b486fb"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_grpcpp.xcframework.zip",
      checksum: "778cd868819bf1f4aeeb5a595463c4fffc62bd1073e16df2e1f3bd1a52a83f4d"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_leveldb.xcframework.zip",
      checksum: "50a55737c208dada16ff3b7baaf05661eced1e07f257f6e334554a92ffc5e2a0"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_nanopb.xcframework.zip",
      checksum: "57399aab52da9ce5afa82c5e31dee8b34fe27a5ebbd6d90807c5e448d064cd59"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_openssl_grpc.xcframework.zip",
      checksum: "c93a26327d26e20aed6a4be6484acdefbf191495e428d31abc586f9628b95122"
    )
  ]
)
    