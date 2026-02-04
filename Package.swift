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
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_absl.xcframework.zip",
      checksum: "4739de832a597448cd9131c4f3ebf2273927177ad887323db69adb8611554cb7"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_AppAuth.xcframework.zip",
      checksum: "bf7dc0f846a7d5cc91e63ff830a8d6dc87eac7612a0cf2b972e1d7581aa438ef"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_AppCheckCore.xcframework.zip",
      checksum: "f559a5ccbc620b0d0eafb7ea6a3ba45312dd4b62a4ceb54750bb5c77c63bbb37"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FBLPromises.xcframework.zip",
      checksum: "da55c6a0795d2ed8094ab38640b510311f07aa21da627bd367194278b017e70a"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseABTesting.xcframework.zip",
      checksum: "bc3351b3eaa39b7aae5d5a5595ce3a726316c34904176f487cf8e2372fbeeee0"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseAILogic.xcframework.zip",
      checksum: "f2a4f4e1e4e4356622108ca6e14df75161da67ec0a27eba9639befef37a42f93"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "ef44f3acfc53f5c5d4c04487cc71c2dd4c37e6932553e7bbebf4374274fb073f"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "60d61d6d353e87c2161bd308c7521001f2ae41bc69cc7eaa37bc5bcc0da08a5f"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "636845cdc6fedd1b4c2c862c814e46112bdefb32f8113498cf833190f279b7ed"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "255c5e9f83eb9362d10b577832cc10916cb3eb08b574aafe99b75b04a72e8057"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseAuth.xcframework.zip",
      checksum: "b195985ec38b8e47385a800fa188f83e3c3850ffa31ec9a24e36972bd2e60ad4"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "c2a9968e80b736b6f2f2443e29d324912c040d4370f2edbce97d81ca9f7b6a9e"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseCore.xcframework.zip",
      checksum: "25434141e095dbbef29f5a2cf5a20b4ad78560418562877e1628fde81c98ac1f"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "f7e3a5402d13b190af1273a71eaa58c44d51034944c949b9a77366c9b05c3680"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "c7ec20637022f13e6cccc95a7d40007d5273bb54a81b09f5c7a48c11ff85d60b"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "6362d815b1c415f9489050d3d68f746d98b73a4fd8c82d94d0cefa577380bb0a"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseDatabase.xcframework.zip",
      checksum: "c2c2ee1149d37594c37f71d77a146b0ebf25670a18eaa7da2797dc5f8f387789"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseFirestore.xcframework.zip",
      checksum: "3eac158db4ae24ef0177d172a0a59f5318a7f667595619012ac61e010799c694"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "0d843f06d282e8a4801e97bc6f03b42f62898392bf1e7c34f378c628f44d1faf"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseFunctions.xcframework.zip",
      checksum: "ec6e7b52db61c874947f2c9c673d66cdab6b9202786ea84f069b5b4bf3fcdc37"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "db007d5ff3953ebe66d7f4e27cae8ed9fce8c10dcefa4e6d8cbe7c4cda929822"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseInstallations.xcframework.zip",
      checksum: "a4cb472f95b9c2e77848f2f021bad8e16d2a21cf6d30fbbc6dea18f31504db5d"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseMessaging.xcframework.zip",
      checksum: "d56e76e96705a81e00790db0c9667f338e3c4622f2dfd6a6032c89d6e14876a2"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "6f14387183d17e263be87e5b34bc551bb6f6b4a34059238c0be1a748267e4990"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "45f1eb59ffea5320f950e3d7d60fdf5e137ebc7cd36d47b6d31e17936784f471"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebasePerformance.xcframework.zip",
      checksum: "bc5d026d6a5d7fcaa52deef7453cdcd98f63519774d0da333039027693f80fb2"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "ffb72c1f128998ae8475f64cbd43966fbb64a415652aa6f7baaf055278dfd817"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "91ef662a32bbf628bd832594f35dca102a1b218374184febf20c0c611036ed51"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseSessions.xcframework.zip",
      checksum: "4ca07cd5d5d9f751846cba3a692947e52dac25435661537841984231b53a7ae1"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "f89cd06c0fbdfdd6f5cda35543642fe2f4c23ee7ee511f22ed8406f455016b45"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_FirebaseStorage.xcframework.zip",
      checksum: "a74a08e36a9b579a949f42bd8209b0052a5acde08a9a50c3326bd06bd850da08"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "2c85b78bd7b63fb467a40fdd68dedbb1f879daae263be9a98a1ea2ca19fa7bd7"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "78d2a90fc580d0e6e53e1988eb020584607c6cb32de1223c0c6a3fbbb0b02343"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "8ce3aa33e75a3f602635d6892b5f1fd63af992684f87e970b55a59c070451a81"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_GoogleDataTransport.xcframework.zip",
      checksum: "0126906a68a67e5b19d747d5e75d2916ce359b228e94b5d6d624c95e4d41b10a"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_GoogleSignIn.xcframework.zip",
      checksum: "5b0c308c3ca5152839347de1c17894886f71b576600fe91f182b971557c7964c"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_GoogleUtilities.xcframework.zip",
      checksum: "546f57337b3a4dd72e3bfde8430caffbbd73d8d0727eed45a2f35ca4be5ceaa3"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_grpc.xcframework.zip",
      checksum: "445e3e895c51acb11bb0db8adfde222f9eaab2db29f35266aab83c0fbe09928d"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_grpcpp.xcframework.zip",
      checksum: "0ba37a703e19776f6d9dae06235fbb98f45fd589e620b4cc46c7ff052df76ef6"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_GTMAppAuth.xcframework.zip",
      checksum: "933ef1e8fa09e6d43cfba5c9a0b752b5d076fd379b3c88aee46aa81ee1c1ee7f"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "3671cae8d4025458241d832cfae1ce8c182c80ffc5bfb59348f215323981e33b"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_leveldb.xcframework.zip",
      checksum: "15b86717d487b89a9b5701d7a515049a65a528df8b41e963f48a410f8362a1c9"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_nanopb.xcframework.zip",
      checksum: "4ff8e78892f14c2dee0376ecee787bcb83f756279f8a50e99654941d188f02d1"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_openssl_grpc.xcframework.zip",
      checksum: "12d08e4e04284126df71b598c91208fa919801de8d507708153165d2dea62548"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_Promises.xcframework.zip",
      checksum: "bf7f54c9f49531441e6367d5aadbc8e625d76a390bf43aa5c22e9a565e9548c5"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.9.0/_RecaptchaInterop.xcframework.zip",
      checksum: "e155fff9e21a53ea7c038be3b1bb98b7db62fd237477d2289e9efcf6d2e7ec53"
    )
  ]
)
    