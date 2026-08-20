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
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_absl.xcframework.zip",
      checksum: "6b43a98ada4291d08e968ad04904690515e758fbb04662d1b0f97fcee8619978"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_AppAuth.xcframework.zip",
      checksum: "3ba9c520b958a497d07b2bfb454a6b92ded5603923be43b10d9eebbe35efed12"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_AppCheckCore.xcframework.zip",
      checksum: "92a201d75491dcd4344bf2e26402f182204af72e95fd9dfab95587f15b8845ce"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FBLPromises.xcframework.zip",
      checksum: "486499851a66e207dbbe4619836fff8897d6c2597d86f09d711753f49fcc0062"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseABTesting.xcframework.zip",
      checksum: "f7a6dd07a226bfd8b374236011f5328eb0d772dd6c77a86c5f1d168f133138fc"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseAILogic.xcframework.zip",
      checksum: "c8251233c25714713f804524e84e869a40b19d1b8930152544763ba7226f39d1"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "e5bebba840375a1d502a56b1a14bcb7d8cfe445bd0b7eaae7c20056a4657ebb6"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "c6181587b002ff3bf4fc19c30253f44d8c9acc7ae9763fb8f0203ccca431eb68"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "abfc977504f1d9888c9556220735fe6f2de76e3d12fc6e0b4fa18e8e54c4e013"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "55433632a3eff8136ae68371b52703c3aab216ae7c475cdbdcef1e6f6aec50d3"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseAuth.xcframework.zip",
      checksum: "53156965980340d50326c34bb7b2f62c3c0500645b093c13de342b1394f5c1b2"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "7c7613cfcb574a6763f896b3abd97092d871c98f9a4e33af9acb33aff454abb5"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseCore.xcframework.zip",
      checksum: "8c50e468b9bea5244fe501f6a23f153400809f89cc930cba2bb8dfabcf2b645d"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "5e30eb9294500530908efa08219e2825d5148201e44c830ff1f77141eeea7970"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "11373c0414f39fea3a596df4118203b9ae750ff3912723f40c295a7a714207c1"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "dca374746eb0ac6c1a3a8ac77ec806ceafb872a4b4187b97e45adfb76027c5aa"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseDatabase.xcframework.zip",
      checksum: "c35dac85258a0354ab0defa776b89b047cacc8ca7bebaa3fbd98ac0429656d25"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseFirestore.xcframework.zip",
      checksum: "7f89564cfc91b9ccd771c93bfb1a29ccda5c71d912e8190da7f03ab5743ead17"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "6c49d43609c7f15b8ec3fa00c221a7d985088aa5a2e4b710aa22483e147c3a33"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseFunctions.xcframework.zip",
      checksum: "1df1bf72ac6776c8d6900fd6337282fe0fbe80fe84b104361194cea63e681be4"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "01e140b59d54498ad3fdb5abfae3f5218169b797478bbaded61b8faed95ad913"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseInstallations.xcframework.zip",
      checksum: "eecbbd0b3821813dc4abe9fbc315827361dc8888066167b9ede4832a1c076ef5"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseMessaging.xcframework.zip",
      checksum: "f8f46d3630b6d41b557707114a1b80bf7cbed46914c4f38c5f9d4b590ad2e8bf"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "e4a25ad769a6aecfa5ae099014052d75e814df004d2b7d34586bc43405ec1860"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "afc6b99eb5be197eb982958e953ab03b7df044142d56fd9a0474b5fb5bdd73cf"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebasePerformance.xcframework.zip",
      checksum: "a85ad3f574d8a143abcd89981503e7e5b53fb016941fd9c710adedc61c689034"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "64bb20968b5c528818d87740869353299fda47ff20074621f74447d6b195c12a"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "214efca5a4ab5e48d92f29a745195d4a45983e25b5257ab64c5be5e097a88011"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseSessions.xcframework.zip",
      checksum: "e7ee88cd31c6e635c0efe98995e2db8e71a89c9b708d76206cf758626f614bf6"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "f3dc2fc16d2e2ac4ae0465bb206dd9f06ca829eeb9791bbb9363b70cab2516bf"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_FirebaseStorage.xcframework.zip",
      checksum: "44eb444117dc9ad0622b7f1bbea25042032f7ee9410fcec13a0d0b81178aed22"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "f32b2f063de63e50cc4ed360a56c223d75bdd64b38309450c77b254d74370315"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "96e4d807069d0db7dd547bdcdfec09ca6ad830840846b75bede31266121eb8ea"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "06f6ff415858f51435517fbb4b1058f9825f00ca1e33c3fa383ac1a8f21b7059"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_GoogleDataTransport.xcframework.zip",
      checksum: "bce08fca4f5165d98cad669baa6973bd3e8a55d8b2f24139e43eaf9677f7445a"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_GoogleSignIn.xcframework.zip",
      checksum: "e4ec8030978bd4e2bffb83517e15a5f5f27c30100da82bdb97f6627cbc5f5e54"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_GoogleUtilities.xcframework.zip",
      checksum: "fd6bf62cec46f1cd227760cce130e06bf55d9eb6262292aed88362b886ca38ba"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_grpc.xcframework.zip",
      checksum: "b5c88b82b5ee80e0bd8dfb062d078f336ffc6745f13a3da75d291ed90b2d8d34"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_grpcpp.xcframework.zip",
      checksum: "a011d014946214826dc0c7e3e6b5b6028132d4b39be4a982e97af51be294bbd9"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_GTMAppAuth.xcframework.zip",
      checksum: "d270255d34af94a42e999f6921df4af192ed7f85c080e0f462b61d837562edbb"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "dde92d0bb512b2a9dce46e470f34c8354d0993d55fd6c75bbf8182688d95f7a0"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_leveldb.xcframework.zip",
      checksum: "31aefac58eb37b30557e85ae302cbbd3b00de3517a75a936adb75d209419e9e3"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_nanopb.xcframework.zip",
      checksum: "42b0a0fc89bb359a95df5531e27d916da5426fabfcd1804db137f04c7ebae98a"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_openssl_grpc.xcframework.zip",
      checksum: "1045108dc9c8a91db510c94c8b59455e929a1e4e3204873fe2a9b8bf51682f6c"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_Promises.xcframework.zip",
      checksum: "33800671d6e491a07854f11655840e7e89e695cbe0dc5920ae117787b86eefc6"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.18.0/_RecaptchaInterop.xcframework.zip",
      checksum: "76ca6d6116a5f777f6b4164eb1e9a314c93a590445597d38d8e104fa0972fb59"
    )
  ]
)
    