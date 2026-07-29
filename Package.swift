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
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_absl.xcframework.zip",
      checksum: "71642779f5891ff26726333025b2692af6c492caecc93d3af8d9e2854466a551"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_AppAuth.xcframework.zip",
      checksum: "32c0b0b3bbbe77753e3cdb011de5c07c3820a357f12f40904076a9c34578c934"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_AppCheckCore.xcframework.zip",
      checksum: "3ada86daffb47795e8d5131e5d9ed3ef2f65b2953767971a9b17ed8c93078821"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FBLPromises.xcframework.zip",
      checksum: "fdd43c95dfe3a8561aebaa2a0fa393366d2200dd75b67d76dd4dafa856e993d2"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseABTesting.xcframework.zip",
      checksum: "fc604fabe2dc7b91a28325b2f0d2f6be55491aa128584448badeb95c695d39b9"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseAILogic.xcframework.zip",
      checksum: "0433315ffe11ca39194716579b5ae979781c616b1ec65c731fb229902057610b"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "cd5a8be28000a01140c74b2363216104a7ab68701ed0d126a61d3f4edf815179"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "401a3e1e3c4c9cea9d82deb3d1a2f37259164d0fa0bf70a4e1075b9f12a7a58f"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "ec27d39ab141ba5e9667b985ebfaaace01c1fdc19f854e372b43725d5508cd28"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "cc1a10561ba93d5c2989bf46c668d77c836df82a4b6015265f53a46a60e9a9c4"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseAuth.xcframework.zip",
      checksum: "ff0f692c82fce93145d05efb1cf9fda9366106e67a14dfca871079be98e4c47f"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "ac810d7930c95ead13fd4a7ba7b0824b16693db2e0f5a067ca2f36d6c916e94e"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseCore.xcframework.zip",
      checksum: "e74b0864c09e529c7823ee1ccf56634858d4ae06b8b1c48d23c73120b670dec3"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "a1db7d8730008af2d5fc151f982878af738e7164d6d2e2329d7de77ba77aa9e9"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "c6af78326921625d539e664ccc02d92201884c6ea82ea87a20ca0e57821049b9"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "f77e931abced73df8afc90a7e9e385c320308650733d288830d2ec82d12748c8"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseDatabase.xcframework.zip",
      checksum: "dc8294a95fc4e7b25186f826c239181355ed6ed53f30bcb685fb7cfd7c01a794"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseFirestore.xcframework.zip",
      checksum: "b174343f7117d029335da0a4093acea55cf4646da6f14be84c8f68ff051499cb"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "975eaca6fe12868397ee19a9387f8921737dbfdf3650bc1a0ab7eb0ad13db944"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseFunctions.xcframework.zip",
      checksum: "af456e7607a6c8b5e788652289d5a5fa98da6b34dee8310b2c15bad6a033a8e6"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "79bd21a98be5801c789e8de7d9d206593412404af409ed8f4eec1215b1dfcef3"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseInstallations.xcframework.zip",
      checksum: "c3f5803ca2fb951fe04df676d79a21f9a2db7e8ce2c48c302fa98f3ff807a1c1"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseMessaging.xcframework.zip",
      checksum: "c81e231ffc6c5114e9c59e1c77d7477367eaf3b8f9be40cf97a0b16f2fe66727"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "d8b5a379589af9afe51fb12b9f4d43b6e171ade0a3b4a515cd2b04eed7b3275c"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "dd46a5b2fdd95094191da1fdf4773f25a8cacf6e223e9df62e552256b1cf6e81"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebasePerformance.xcframework.zip",
      checksum: "d738283fe12861ee924dda39c740e2dc5d94bb85568608214794b83629f4f7dd"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "8d42c9cdb5fc066f30bbf8529f500b45a383847396bddd492b19cb5c10a67037"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "655783f9d6124a0f0d20e92623db2c2d6671e1a14fed5d3c440d4a5d53d3017e"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseSessions.xcframework.zip",
      checksum: "5fcfa5dd33fdc5d9bf9156f26f8db8d97f14dcc2a5a8812916f5c6252ef29eca"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "9320050702317b66539394c695226fc119986a98cc0834fd8d0e9aaa4ed10390"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_FirebaseStorage.xcframework.zip",
      checksum: "a4a623f59ad249a0ba13bfd2e317f09704311932c2e87e5005a9ea4cd91c96ee"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "0f088b8a085e62a38b016e33f04d000511deb0e6a0b15ada507cd73512593582"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "67204dbbbe25cc6806ad873a871446b9490aa81028c208023824e9bc163d5493"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "b377d570076a2f87d5a892a08788e2a7d6a5b5cd3420430ea0df3ac209e558f9"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_GoogleDataTransport.xcframework.zip",
      checksum: "91b40ada805b6ccb8cb3942ae76aff68e627116904f7e4ae0bd629efeea3769a"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_GoogleSignIn.xcframework.zip",
      checksum: "4e2ae768a98bad0495d1a1d8c97330a59ff7246fe1952a6933103a8d9224fa45"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_GoogleUtilities.xcframework.zip",
      checksum: "17e963c74d3889141d6af3f2a5b5354753b255ccba2cd52731fca7ee7a60a495"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_grpc.xcframework.zip",
      checksum: "5d57f2ccf5f14a22acdd40f77077cf4941ec8507d064a264233543a1ae0457dc"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_grpcpp.xcframework.zip",
      checksum: "8e6c3a520908ab6036905dafd43fc161df322e5de8e4cf708d8fb1f7b5287439"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_GTMAppAuth.xcframework.zip",
      checksum: "b7fd306f7124c314564da20eae2ca3435a3c5a61d4568d47c5ee01a28be372aa"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "998fbdcd40edd59b3211ab5d525385ddd3bef46d4ab71ae5a928b4737ffb53aa"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_leveldb.xcframework.zip",
      checksum: "d34f0e894e1d9b6cc51213d4503bb8dd14850e7ccf2b783101e29366201b3da3"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_nanopb.xcframework.zip",
      checksum: "5b7b5e32944db08c79edfce7aacd6b68712cde6df899218b73874f57d90b4bcb"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_openssl_grpc.xcframework.zip",
      checksum: "7876352626b1a06736431e9fdf78f49ea868e10b77a61ee37f8fca80dbdfc3a4"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_Promises.xcframework.zip",
      checksum: "40906d2a698297ee1e35e3c184c8077adc98e599d892c47a8a2ea73ffb0b0cfe"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.17.0/_RecaptchaInterop.xcframework.zip",
      checksum: "65dbe2cd3baa3416d0b6e3cebf8a0d75eb9a45f16ce7dcaa23e257519bc3add1"
    )
  ]
)
    