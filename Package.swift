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
        "_GoogleDataTransport"
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
        "_GoogleDataTransport"
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
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_absl.xcframework.zip",
      checksum: "2c73eed7fbb36fb2c1dd07f48a7a1040d930b9606efefd24cef682093d7a0fbf"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_AppCheckCore.xcframework.zip",
      checksum: "2ca030e191183853dfee8a79d04facbee212cb32571d9421c78ebbff46907cc0"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FBLPromises.xcframework.zip",
      checksum: "9cd9a00478dd634c5b573e902d09bc90417e374e047ae3c8583d0848631ce92e"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseABTesting.xcframework.zip",
      checksum: "2b0400ad62012f78449b62b6a8f009ee3fa2c06d4b3f3f3237107b13bb176c33"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseAILogic.xcframework.zip",
      checksum: "fad66901c34b01ed2d7942572dedee1ff18d4ff28c0c8be8884d5868e5836416"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "86e3c6b2e7f49adc1d3c6a1c1112ce745b5686b6fe9d598d644d448c3c6e740a"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "b662e6fa6c3e86054ef5d78ec8d4455ec24b149f1214beb113503fd3ebc122ee"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "e4b8a0dc0a3df16f57d82e345f1362dd310b7bb3d3c594ca7fe921319c75d255"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "5d0979e5368d667de9f4ed71c8eb92a1f68a0dc4b9b3704ffeb3e74b1e3bae98"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseAuth.xcframework.zip",
      checksum: "1fe75579412dbf8eff77e66158ccefcd7ed0465813c2a2a1bb439d2ec8102be0"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "3f35bbb3b1709bf83ef8faf6c654fedf22c6c7c222b6a4f7a16025a75fd8637c"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseCore.xcframework.zip",
      checksum: "cad0d3b7eb38d311df5a10a283dafe7e01b15209db5bddcc17e2535841c8aa0a"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "bd2303c0436937501bd3a8501f29afefdbb246710b6876d27c9bbabea0d4acfc"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "7effabf8fe0c9b0d90693966a592394d716b3692853f27be47c0568894131556"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "2f90e4a0a01e2d856c651a2d2054f0ca5155eb16f66f3dc0f15cbc2bac73c450"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseDatabase.xcframework.zip",
      checksum: "d6c539bd74980ecb7ab6cfa82a801dcb15538a5250a675b608254be5db396c18"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseFirestore.xcframework.zip",
      checksum: "023ace3d9525d8d686011200516f2d8cbb3979ea2358441b635a39a7a7a2ce3d"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "433bde283b9a14206234f62cde75823bd281f054ab2962d9ec266dcc25ec7f45"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseFunctions.xcframework.zip",
      checksum: "a5c3c06aaec322eaeda8828f43dbffa595d3b2e08efc0e5e6e76b25e799c1db8"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "51eb46514458f853b1facf287cb4438763c8f8915695fa5b6f3a346dd97f54c0"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseInstallations.xcframework.zip",
      checksum: "6ef309f4bd76d35bc66b17f5817775dc3d66e8e50cc36ec7a43a7226b96f1859"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseMessaging.xcframework.zip",
      checksum: "d8b802af7a4cca90ab6f8b5f4c1687ae5b140798da6d77b678584444c6a73ede"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "9fe13220856bfd17d576a8937952c3006b9c1ce630f930d05d22a45dadaf49a7"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebasePerformance.xcframework.zip",
      checksum: "3597f0e61cadf39342e1c37b2b1a76a40e653dd72ffc2623259bd79eea66e722"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "f76d0a918b48e16d0998db8d1e3afd59dcdd1378295f346a4977c7b7a0d7c1eb"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "c2e3ffa332c9ac0b72497a0b2bb0b3d7a9e6f0173c24cd1d34f2548aac1be310"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseSessions.xcframework.zip",
      checksum: "3dca9c3454ff143507a24317beba968fd58a6a5558b7b8281905355ae9521524"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "6d276a6eb6bce6a197ae6a7583944eb7212cde074bdc5a64d5c35d000d1fedc7"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_FirebaseStorage.xcframework.zip",
      checksum: "d77fcc45c09fd41a9c2f4d565026ba9fdd01e4252ea14bd26bdaed4bef223462"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "fd8b7fc1525bcf19c1894b844afdfe4dba236195fd2dd0417764d1ae088eb1e9"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "8b565c10dd423d9f78cba25482d078ac3f0aac340ad9902c9ebe9900efecf2ab"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "0b4e2b312742284f4a32dd4bc5e1e369fe3a5f83477b4fa7c939bb52f7312926"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_GoogleDataTransport.xcframework.zip",
      checksum: "d2ecdb97501c2a00b0310c4e1b8547516bccd6e1f5b675b82078b8bbe6c6b031"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_GoogleUtilities.xcframework.zip",
      checksum: "10a5d28fbaa9e1a569bfcbd1081c9145d5074551a102be14ed9da0b98127a469"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_grpc.xcframework.zip",
      checksum: "60a6665b384d1e986542f35faca318b36ed407b872ebbab4c6576d7f4099ed37"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_grpcpp.xcframework.zip",
      checksum: "90bad88e09f4446e710a544f15dd28699dfd4b42c70c4a6b3ff90a8b65c7e1ee"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "0c88bb4ebcf681d09ed7238aa3901af4f0b884c365f8d52f2047c93caa1949f6"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_leveldb.xcframework.zip",
      checksum: "e1436b4d3b4bc32a1125aa3f08133e5e3e73a7efc0ab2592e0ec6e18a9eb43b3"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_nanopb.xcframework.zip",
      checksum: "733a2d12dad69dbcbabbd79d9426c9f164efa41b7bab6ac7f95bb9a020e4f8b3"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_openssl_grpc.xcframework.zip",
      checksum: "378fb2cb38dbef726ca759a6dc3714d40c6d3ffa233b97bb2d9b74db14d77e0e"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.2.0/_RecaptchaInterop.xcframework.zip",
      checksum: "6ac325de31eafc1ed741a00c3f1b1307df5c84d12f0cae2e3476c5bec0d6d809"
    )
  ]
)
    