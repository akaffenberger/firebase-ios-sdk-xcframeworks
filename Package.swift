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
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_AppAuth.xcframework.zip",
      checksum: "cc635ede819b10d2b54376111093d4dd0c025a187c3e9fb354ccbbdaee9fd9c7"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_AppCheckCore.xcframework.zip",
      checksum: "0417a5bc04246a5350ec14a57daac05a3ec5db30619b58add5b2146dcb5442a1"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FBLPromises.xcframework.zip",
      checksum: "d1c980722244fa1df092f8ba1bfea5ac06864f98b013dd3e627b8da832cb6035"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseABTesting.xcframework.zip",
      checksum: "2530662fd91b6b522cac63251f33ecb2f39fd21c1387e6ec2be789c9d31e281b"
    ),
    .binaryTarget(
      name: "_FirebaseAI",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseAI.xcframework.zip",
      checksum: "e049b798481a7fcdc869627fac7574a5a3eafa5dc38e9f487738f7c17fd99835"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "474c91586797b58ac05a3fcd45861c302cafcdb9a6877b13bc7a5eb6e4a76d9e"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "cf3b5d1bfe07ff280b292f7738b995617a4084bd31fe3445bc55364617c68ba4"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "252099cf028f44f961a96d3eb2c114f251d68347aa31c76ad8300d42a0812d3d"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "b14c26d86e9ff302ec935cf056a5920e7fa4868f6676b23eb2cbfc59ddaa3fef"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseAuth.xcframework.zip",
      checksum: "fe53ca28b8eab28f3c28a5fdaf5ce3e717944e32507d6dabab73033a8d0edf64"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "c5ec55c0543c469ef5101934202684836c88a1d46c1124768157b9ce0206722c"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseCore.xcframework.zip",
      checksum: "365d5f1d3d3aba167e8383404a5c978bdbd407566862416b17e455536c21a852"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "5f62009ed04c05a87861a68e0f6745eac11a6cc5abd2f4b3fd290ca15cb2c892"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "d6bf13b1805fbb712411daea99a733d23fbfda6b21b183409f6f14e25e2dff2e"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "7b5d1616c1bbd78f68f6eb541d5f9e51cf2ba0a3a4dd480888337a23845de339"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseDatabase.xcframework.zip",
      checksum: "4cf6d7319d4375f48fc1f42032477383b9173dd1eeddd525f34e9324d0e67bfc"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseFirestore.xcframework.zip",
      checksum: "d1f8cdae563b600a9fbdf399ecdd3765adef4e480fadce34c79ada77747d5887"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "a35409e5aa900fdbb5d718d4a1848d9041ded54b42fbd88b7eaac346edc942c3"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseFunctions.xcframework.zip",
      checksum: "aeba8d4de600c3262aa724233efdb303e1633ea61c1e1d31da0d431490905527"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "377a63b6f0512cfdd23e937bc23c9e6c29d577fad10aa9d77fba899e88602097"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseInstallations.xcframework.zip",
      checksum: "779e1d348bd05112fbbd10653b00b888bee2fd17bf0c426c38327ed37cc7960f"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "4819dd3b056f9e3080cad6ca765e03a115f55a72072a7f827ac36b967bbddc48"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseMessaging.xcframework.zip",
      checksum: "ed3ed786dab2a4564aec40fe370895a8f7a77ff6abc468fc8e03e4ec3f01796f"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "e59abdd789918004032e4ff42fb746f9c01b6e2b7a3d8e4b4c43ba920e3e35c3"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebasePerformance.xcframework.zip",
      checksum: "06a81c0b8e854d65b916d22bc43e37dcf912935f78bd8d31ca6124149273f889"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "b548300cc8bdf7656fbc35067e7bea887f96556408d4cd014bee8727d48eee1f"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "3fc12996d17efd1cbd52ad5783b5b10b385c61d9f5f8e2673cfb65ef36f05138"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseSessions.xcframework.zip",
      checksum: "dd36aa1c5b57cd88e4caa15dbba0d1bb1d06a48dbeb6b67545fc0c5d93125a18"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "1f9160e6e6be49b22c364f309c910e0df149ac78353d3803fce8db89ffbb1f50"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_FirebaseStorage.xcframework.zip",
      checksum: "a44195b32ed471fc15d38eed26588f44d6e074fdb242ef72ecc27642d825768c"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_GTMAppAuth.xcframework.zip",
      checksum: "bce927049a3e12a6cee9c315ddebf44468f853d41dae45ed7cad62899fc3cddf"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "62be0a652680a462ed09e6d6936a60eef45b7924ef333076aea31d158ce9cbc2"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "479b159050517302140736a135a38458d49e8c27b777064b0a3cbab07f4c63fa"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "d449d01cd568e51660567da5443bbceb42dd0f62591b3c18a1be603e1a21b501"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "b0493c23e575bd9d1380330a56197b9aad7bb5fac21687ead2551f810eae5f3d"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_GoogleDataTransport.xcframework.zip",
      checksum: "a75f9ae53303c1e7fb7675f3ac2c914747cf9bf7d1ee1c39ade3b84134fafb14"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_GoogleSignIn.xcframework.zip",
      checksum: "d554d0cd439eecba19927205cb58aa6d4f980bdba36ee2dc893fea6ad206b1ac"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_GoogleUtilities.xcframework.zip",
      checksum: "1abab5f518816a38b31941e7210350c2de92372ebf4299436c888aa09bead851"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_Promises.xcframework.zip",
      checksum: "d33f2d25b02911fa5ab079a2df45ed2a9b6425d4cc41b35645c0bf398600a737"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_RecaptchaInterop.xcframework.zip",
      checksum: "0583b17133a0b738c9f0dbb45848c24d8a739f3e11e31d6b294028bd79a0fd38"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_SwiftProtobuf.xcframework.zip",
      checksum: "52fe6ddca344d53e0f77cdd7a54a1810583eae9d64b9795f394cf42fe56128ab"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_absl.xcframework.zip",
      checksum: "d02c4faf8ebc5ef9287780a8aa8a0079850da724199fa005f441bdd0cf36b4f4"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_grpc.xcframework.zip",
      checksum: "2cbe0347ae783d719701d5a823d0df757f59d0835201fc5bee04ae0db3adab22"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_grpcpp.xcframework.zip",
      checksum: "3ddac6096223680ab3f0bb470cf6f2220d269988d04828bbd7745312431a83b4"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_leveldb.xcframework.zip",
      checksum: "a5e749da331b213855ad860c457428193688eecf05a7a6b3894db32da0c70ddd"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_nanopb.xcframework.zip",
      checksum: "60d569a195d0064a2f39790f5fd4ee0a1797814bd14453efdcd4be3f1411109e"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.1.0/_openssl_grpc.xcframework.zip",
      checksum: "70a3c9c1e37024ba9216ba90448ae6c52f0fabd1ea36907bef27d4c19f0d7dc9"
    )
  ]
)
    