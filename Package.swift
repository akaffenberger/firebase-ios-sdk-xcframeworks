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
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_absl.xcframework.zip",
      checksum: "f45fac5e50075603e1def1d64cfba727124364b4dca5c158f3c08501e0c5a31a"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_AppAuth.xcframework.zip",
      checksum: "f01853e9689c652210c77fba41927874d19aec4b07f59d51f3eb1c11590c936d"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_AppCheckCore.xcframework.zip",
      checksum: "ab03f2be9b390d8a3293357a47bb6c625f0aa35a697b6921750e383ba0c9d37c"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FBLPromises.xcframework.zip",
      checksum: "dc32d207af4e47b9f4254d886e5fcbd37c51b3217f2330bbc31e84c223104ed0"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseABTesting.xcframework.zip",
      checksum: "56b21ed6a5b62757e7320f0d853d160cdd6ecca21e8805114472f6cfbfe27201"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseAILogic.xcframework.zip",
      checksum: "2650548dcebdc1311a4ad9f5bb1308c0bc7128a213d8aab589336e8e107b3fa1"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "9d2297f0bd8f48d9dc02df4ae5e1e65e1749827096a2bb833d330878c6f5889a"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "5babe78bbab9df4797f9e8af088a05a0457c90522b8ad14ecd04388532aa9c17"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "e07d34d5c0fd9c5cf21f6a5b9578ddf45de0d231adf6fb3a49e9106d21522d2a"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "0cfee1e3f835b70c362ebd2e0978405dd6afe2774900c17237e49c387242146d"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseAuth.xcframework.zip",
      checksum: "792c9f49ba33aa1a112b4931bbfd12115626b419d1be83febf80406c2175f1e0"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "6b8fc9ce2730f73fd55f6f8fd1af8c74eacfde146629967d2286187abe2a5711"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseCore.xcframework.zip",
      checksum: "82174b876ef41e68725b4dd7d8c9a1af570bedf3d7fa094c618663ae57fbb884"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "f81013e782f060616c847d8b14b7b2b0daf1566495c70fe87028fc99d2acb25e"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "3187adf0782d1147ade826e9ce93dde3e1ab00dc7835ba9cfcb53d0975e4eae9"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "398539604d409a084004dce69e6e821038ce347d6e9276d4fb36b4e13f989d9c"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseDatabase.xcframework.zip",
      checksum: "a94c9baed30d9fba24655faa6b16d932f647a4f5ce179d2dd51729342da53672"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseFirestore.xcframework.zip",
      checksum: "9e220cbf604fe458a79765b49e523af85b9c1e693ac6adfff83e77509c028b44"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "4e1e049ef5c8806361a6e3969c8d6d9cb4457beed5f7040aa9e61504745041a5"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseFunctions.xcframework.zip",
      checksum: "68f621cf33570d3d08b0a394840b38551bda930adea2766d52dd01472459213d"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "1dfcac32e6056d4bee0ba70e0918b5f3792da08c9cc86556e8f409831d697107"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseInstallations.xcframework.zip",
      checksum: "ee43fc7b0765d07573143599db44f1581719a222a2f58dd44e29521774103630"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseMessaging.xcframework.zip",
      checksum: "661e1c03a3c41fe62f1e17d016a684494384fbb54882460e2ea499c75e6b5020"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "b7892647f9876c486a85db7d023556172cfd807fd8d45f6b88e8f7eeb989ad8f"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "fcdd2be7e1cab2f650021156d5de76bfd9ef0f29734f8ae6468549de537a190a"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebasePerformance.xcframework.zip",
      checksum: "3031d3849801645e11a1045eb02b7c39b383f27957b17ce4a3243b7d8d55cbf4"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "432b734f01a1eeed8582a2f10985d0053ea5f362fe62628ba3f52d82358056e3"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "99c61623d85ba2272867a3ecef219b19ef4918cd6ab303f64c6bfa32462d8417"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseSessions.xcframework.zip",
      checksum: "c4c0dd06c4fcab44456534f438e57106751be5115af3eadaa893da4418a77413"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "0b140f10371e7dd7056955cf9335e08f9f8e3a9c5a5aff11b746feceed956c87"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_FirebaseStorage.xcframework.zip",
      checksum: "ebdf0af2e4ad1ca6bd4387a02538a462587f84527eb876810bc3e351cef94de7"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "b4870c2e0a36127a8297342e6271c273909e86cfc05b8a4ba1534d0e643a5e7a"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "a27bb44c6325b2f992cdff1cdf8e022129a1e9851cf3d47e0af9d92e0c90e93d"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "c8379c2477d4dfd57c0423bd5a21ad7f63912001f255846308d14900ad405c17"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_GoogleDataTransport.xcframework.zip",
      checksum: "c23a333f5ce5b62eeb2340e32bddc4a18751de43ab5c0f1fee8bf3e47c829ab7"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_GoogleSignIn.xcframework.zip",
      checksum: "3b1cb6a35adea9ccb310b3021395ba8e546d3005cf434b2a00845e4badf0efa8"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_GoogleUtilities.xcframework.zip",
      checksum: "adbb387d8df794696d4cadb2be6e0b409e42c3b88b1a7b6c1509afd1ea60f88f"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_grpc.xcframework.zip",
      checksum: "921703d51fc951b8ed3552e9d4e679d0a4886598aa14ff09ae5dd0625ee3aa38"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_grpcpp.xcframework.zip",
      checksum: "83a8aea9866f5669576cb04aa3db68f0ab329429843fb4f23f7da3fba8879dae"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_GTMAppAuth.xcframework.zip",
      checksum: "1c3949c5bd74bedde998bb4cb11707963bf44aba2a0cf7e9ec24480733d67c03"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "2cfff63f009886ef7c2afab4b7bf562c3171c3ca36ad84f63281511041e29a9f"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_leveldb.xcframework.zip",
      checksum: "fc1ecfe26ff409e15be2301fb080c4a1eec8c75e10c56c4fc49f17457cb1c8e7"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_nanopb.xcframework.zip",
      checksum: "43f9816f6430ecf1bded6f7f0d64bd1554ab38b61addd13db9a322a88b8650d6"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_openssl_grpc.xcframework.zip",
      checksum: "a703b372eca003633c18a2b99c2757a356e5c1eac2542f2b0babf8c5ae659d3b"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_Promises.xcframework.zip",
      checksum: "16aa1369eecb7f6e69327596c87e2ef6d5c70c68a10783188cae86a56d1c26b4"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.15.0/_RecaptchaInterop.xcframework.zip",
      checksum: "8f88e8ad43efbd0092c914dfc7e467881410f8f220634ac6ffc9a03215c53410"
    )
  ]
)
    