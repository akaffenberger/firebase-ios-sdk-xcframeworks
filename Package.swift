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
        "_FBLPromises",
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
        "_FirebaseAnalyticsSwift",
        "_FirebaseCore",
        "_FirebaseCoreDiagnostics",
        "_FirebaseCoreInternal",
        "_FirebaseInstallations",
        "_GoogleAppMeasurement",
        "_GoogleAppMeasurementIdentitySupport",
        "_GoogleDataTransport",
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
        "_FBLPromises",
        "_FirebaseAppCheck"
      ],
      path: "Sources/FirebaseAppCheck"
    ),
    .target(
      name: "FirebaseAppDistributionTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FBLPromises",
        .target(name: "_FirebaseAppDistribution", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAppDistribution"
    ),
    .target(
      name: "FirebaseAuthTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FBLPromises",
        "_FirebaseAuth",
        "_GTMSessionFetcher"
      ],
      path: "Sources/FirebaseAuth"
    ),
    .target(
      name: "FirebaseCrashlyticsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FBLPromises",
        "_FirebaseCrashlytics"
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
        "_FBLPromises",
        "_FirebaseDatabase",
        "_FirebaseDatabaseSwift",
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
        "_FBLPromises",
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
        "_FBLPromises",
        "_FirebaseFirestore",
        "_FirebaseFirestoreSwift",
        "_Libuv-gRPC",
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
        "_FBLPromises",
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
        "_FBLPromises",
        "_FirebaseABTesting",
        .target(name: "_FirebaseInAppMessaging", condition: .when(platforms: [.iOS])),
        .target(name: "_FirebaseInAppMessagingSwift", condition: .when(platforms: [.iOS]))
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
        "_FBLPromises",
        "_FirebaseMLModelDownloader",
        "_SwiftProtobuf"
      ],
      path: "Sources/FirebaseMLModelDownloader"
    ),
    .target(
      name: "FirebaseMessagingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FBLPromises",
        "_FirebaseMessaging"
      ],
      path: "Sources/FirebaseMessaging"
    ),
    .target(
      name: "FirebasePerformanceTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FBLPromises",
        "_FirebaseABTesting",
        .target(name: "_FirebasePerformance", condition: .when(platforms: [.iOS, .tvOS])),
        "_FirebaseRemoteConfig"
      ],
      path: "Sources/FirebasePerformance"
    ),
    .target(
      name: "FirebaseRemoteConfigTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FBLPromises",
        "_FirebaseABTesting",
        "_FirebaseRemoteConfig",
        "_FirebaseRemoteConfigSwift",
        "_FirebaseSharedSwift"
      ],
      path: "Sources/FirebaseRemoteConfig"
    ),
    .target(
      name: "FirebaseStorageTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FBLPromises",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        "_FirebaseStorage",
        "_FirebaseStorageInternal",
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
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_AppAuth.xcframework.zip",
      checksum: "00462293eca4967418dee3cfba7ccdc24d2aaa3dc8323fb4fc008a653025ac18"
    ),
    .binaryTarget(
      name: "_BoringSSL-GRPC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_BoringSSL-GRPC.xcframework.zip",
      checksum: "34d3c1f0b08982880d9c8be5d8c4fbabbac5d9fc3dd0569ae9be45bdca6d1497"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_FBLPromises.xcframework.zip",
      checksum: "50eef7d917d9cd47c37acf79abb73795981c22168fba77305d9030d11bd495d4"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_FirebaseABTesting.xcframework.zip",
      checksum: "5ed3a60d02bf4378e0a9d23c442090860f5d2a526ca3028ea8486952f4778c6a"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "ab33dc0f77afacba257bf22ff9b508e7d968707c7f823fecb1858d2d24c1d551"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "024517d48f278f91c49363770f98ec050a305c07d2cc50408eeddbc5fe2ed89f"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "582059571d596dba221350f7e0df8e0196b4b47c7ea56527aad03be7ad26e18c"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "31d70523f7fe44fce4cc9f26a0c3136a58f99b189e0accecf4b37ad61efb7f26"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "a4c58224d7c0401c3160247546425b6ab1749a3323d2151aeaf4a00946761fca"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "f55bb7fc2ef2d3729f3cf54ce3ae60fa2d93f0d7b5fcb44f32dff4e85f52c841"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_FirebaseAuth.xcframework.zip",
      checksum: "fa25700dd59a12007ac4ff59f7e874a847bf36a975c61dddee30c6544f4ab72e"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "3fe368406dc210835a3af4bf8e91f2088de16639e7c2a47cbba4b47c642e24d3"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_FirebaseCore.xcframework.zip",
      checksum: "073942fc7ef12caa7d7942633a62f743a9504fb061e0cce6a31145c247ca8e1c"
    ),
    .binaryTarget(
      name: "_FirebaseCoreDiagnostics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_FirebaseCoreDiagnostics.xcframework.zip",
      checksum: "0210227d3c9ef839d55f0a2dc97f55e9daed4983cb20ba61562e73ce0ccee5d5"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "662739bec7e67d77736d2e1c31e0c526cd888dcaa382bbd108e1c33103d713bf"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "484f2da66b5baf273dead3ce0165a855edf3a321aaf06c4d6dde0528405e83eb"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "7615a057b80b33c49c5f63327435d2dceb1b9c012e53b7649373222a185bb4fe"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_FirebaseDatabase.xcframework.zip",
      checksum: "5cda9872fa4afd7b450428f0c1efd644a886bb9103dd1d102d42ec93869cce86"
    ),
    .binaryTarget(
      name: "_FirebaseDatabaseSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_FirebaseDatabaseSwift.xcframework.zip",
      checksum: "db7d5528d2d7bb47ba5205da13152830a7994f2af00ff74e160dd18af20a244e"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "226f73b1ee5d73ac3bc2312aebe2064a39e4bb788d335072c7ec4668bb799bf8"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_FirebaseFirestore.xcframework.zip",
      checksum: "8920d5be1e6d50edc0d85b133abb35a0e668bd282afd66ddad8fbf274e2d832b"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_FirebaseFirestoreSwift.xcframework.zip",
      checksum: "61c97d7b846b2a06ff7d489b7089be9feddc42785b3f8366783fb92f88ae150d"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_FirebaseFunctions.xcframework.zip",
      checksum: "2136185c6e9670a317fc177dda62ee462b10f0dd8559ffc920c577a05db4a49c"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "3feab77e60d00e1f2da4d203b62cbd14c9047258ec04f0a3695a5287fa0f15fa"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessagingSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "d67fc475eed6040fd7e23ceecf01c1208c2ab44afd1d71d3a7a31b76cf73bc0b"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_FirebaseInstallations.xcframework.zip",
      checksum: "73d4f7ed325b3184dfed2319338364c9cc59d9c96735e14d15906b714c14c722"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "5c8413f721f8c84782187120f8a9b88569c71f5e9e691a920b2f3bf62b3f1fe3"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_FirebaseMessaging.xcframework.zip",
      checksum: "5120f603a36dc1cf12b0c2e386a995281fc29cd2c05f903f64b291fd24db71a3"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "24d2ed9ab85ba4619bdce0e422d37435135ddd8aad67fd4a74be598de6d5eb34"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_FirebasePerformance.xcframework.zip",
      checksum: "e4b1b1ea1cd19d369e296e3175099127d11b13e65ecb9b3ce70eb9bc6d703ae4"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "4cd368256df559ee615778bacd5882c9e956e8a830c5749cd7aed4ebd8cf52b4"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "acb0dd8b28b174537b85b891b37e53dd509065a3b02b073899c7a00485c055e2"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "6b432def5389bfcdda7b024635b39eb2633899f1eff73593ae03a55c07323fbe"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_FirebaseStorage.xcframework.zip",
      checksum: "6a2037325830040f1d845aa6817c9d866f069e9372d3b36b96f619b3028ef3c3"
    ),
    .binaryTarget(
      name: "_FirebaseStorageInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_FirebaseStorageInternal.xcframework.zip",
      checksum: "bd59afc709a881534890da13ea74c8a3f60b319f463350a4bb559aea16dc2c5a"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_GTMAppAuth.xcframework.zip",
      checksum: "d0f9b7933df24e246778f543bbd6f1c75c2535e62dca4d8dca32fe5a8bb3396c"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "404590fa23064550adcbdf5d82fb4690aa8778d1bd0b3bd8240ef3353940d9ba"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "30b74a0f8693c4dd47c99f672877a47ec437f4075d4c44de960cc4af5c9f0533"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "72fb9538a6bcc8e03e59448c52aa2133bd7c25c4ea00cabe819b7188f03ddb15"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "3865e0d92b28c7808eb2572be55799b92c3eee3c49f74ddf698c2327d71fc57a"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_GoogleDataTransport.xcframework.zip",
      checksum: "3d730595cd8fcfdca86a6adc6d39ded1e16f7f33a807041a51dadaaf8181ea5f"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_GoogleMobileAds.xcframework.zip",
      checksum: "7383c26ccc43d1fcc62c834b559e0bf66c006b722a31d1e6a63b06e3f7d81457"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_GoogleSignIn.xcframework.zip",
      checksum: "1a41efb20f8e2b037577950d289d598eab3d118ef1b26220711592747d5dd04c"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_GoogleUtilities.xcframework.zip",
      checksum: "b573c3ea2816589f6f28b13d44596726e313c354807f7c707a919c6ca48144e3"
    ),
    .binaryTarget(
      name: "_Libuv-gRPC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_Libuv-gRPC.xcframework.zip",
      checksum: "f4580f53648382793537fc389a1c92913d3d98a0cd41fb3b8730e3ea2746f204"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_SwiftProtobuf.xcframework.zip",
      checksum: "8beb0f43dfe8120d02fb95ff8a977c4920ed009763d32371c9929a14bda4ab48"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "2997b6d6a3333d61386ed673b620026f8ffd725b0e95f9486f44caa2c50068b4"
    ),
    .binaryTarget(
      name: "_abseil",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_abseil.xcframework.zip",
      checksum: "a053cd52dd85963b1610906255aaffd8dfd654cd7938ba50d722882f93b4be30"
    ),
    .binaryTarget(
      name: "_gRPC-C++",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_gRPC-C++.xcframework.zip",
      checksum: "1eaf5a866414abcd514d90554e58221f7fae8d4c056d05cf8fd11045d22aec83"
    ),
    .binaryTarget(
      name: "_gRPC-Core",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_gRPC-Core.xcframework.zip",
      checksum: "1099be9446e1252916697ed2adcbb40f40f4429cb724c3d6c73bb794f7acd6fb"
    ),
    .binaryTarget(
      name: "_leveldb-library",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_leveldb-library.xcframework.zip",
      checksum: "4183570df9e6f479afc8f67f9ccfebe80b4b060edbf66c3b4861075f1e3d3d53"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.5.0/_nanopb.xcframework.zip",
      checksum: "3cdd938ee4d8214132efbc968fe208dd5b2994afd61dd9e49500b902fcd8bb84"
    )
  ]
)
    