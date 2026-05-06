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
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_absl.xcframework.zip",
      checksum: "3141b4fbf230d49ff0832c23718172c00b26e858b293840e18df54124f91238e"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_AppAuth.xcframework.zip",
      checksum: "257137729486d349addcf6479da017e9f350c19b1cbff91e41b18f8d2cd1fb1d"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_AppCheckCore.xcframework.zip",
      checksum: "fe28897399efbc9f98ffcdb637aa3ed4e849c40da158e2b6352c602995184621"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FBLPromises.xcframework.zip",
      checksum: "d4dbadd533ce76e15d481e3328df5a891f6fd1e58fbc57ce13126bd04b7dda8d"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseABTesting.xcframework.zip",
      checksum: "16c941ca78f049acab63dfaa2626f0c38bbd525db20457f7448bd76b9810dc22"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseAILogic.xcframework.zip",
      checksum: "7c935c6ae2afef45d580c24834bd26d13e07c9f63715aa4cd7a5801ff4deb641"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "07a50c9fb804bccb78d2290bbc973ad9041914daf94f19f824e718e1f1f3bae9"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "50e781a2ddbdea18fe55fb0e94d4708acebd211a635421a4a75e73791fd055e9"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "ec840f4d0d7917578d463abd86325ffd392a0b51d36c03126515e3632db7f9b9"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "9f8ca1c0f6ad027485b2eb8a609bbadb22fc74825ac8dcea9775048674041b70"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseAuth.xcframework.zip",
      checksum: "37aa764c5c5c8f9726ab3ac9704d48f5014b5aaa63e05589a34021966086f263"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "5ea490e2ed56522738dd7342ea98521221f9e40f449b7c640366c79c81cb51de"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseCore.xcframework.zip",
      checksum: "1f81c6984337510f1de04fd47e7a3596276b945595d081bf9b4ad5f042b2a84b"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "928248aba81535aa3bb16c8e2e3ae4181ad0bcabf8804bfc9632ce59c08ee244"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "82cf1331c5bdf960998e4344bd89aa4cac6f5e119a2c5eaed212fb39aaad401a"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "e6c7e49d7fe8e861d84296504889fc96ed8a4480c4640cbe790d4974e6fc3697"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseDatabase.xcframework.zip",
      checksum: "0a5e7d835243ce65c67b120d03e078db88931227af39d71a0aaac64468529e54"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseFirestore.xcframework.zip",
      checksum: "54f569df90c0f93d360e2b27cc9e5681a7fec5b93e59236b7765fcd231ebb956"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "7122d2fa520b67a9ff86fd6f179a4e408ee8c3952f1b94e419eacd3c074ed094"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseFunctions.xcframework.zip",
      checksum: "89504f426f04260ce3208e15811bceb51be041f4ad9a661f88681e38b1b8a66f"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "dd3e419cf2624dc80dc85322c3e0d6638902c164b32b995e93b7160f4e1bc3f4"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseInstallations.xcframework.zip",
      checksum: "0f2673e1437f12e98169f8944f7f8d2262fd7ebe6a49070cfbe56a457eddba98"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseMessaging.xcframework.zip",
      checksum: "8924445849ce6d0130d397b84d2e1fd521cb231b4c9c32966fb7053ef6cb5f12"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "45432f311856ee289519ce1f8b7428fad4fd66e557d8308124ccc68ad6e6fc9d"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "ff5dad0d834b82a26208ccffc0cbebdcd97872e4f624feb857e2db09eafdbfed"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebasePerformance.xcframework.zip",
      checksum: "eb8ca9808000a1565d6c2d6fb2d9f69e82023c76f5134b9cc236753f591185db"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "ac430ade365749ef140fc4e7ba05547e2d9e82fedcdc3b75f2a2fdc6302f35fc"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "0b61d5bcc829c5ff74b4d7b58f772d0b2d4939dfb224ff2a9f6319297b9aa027"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseSessions.xcframework.zip",
      checksum: "5de559b33edda3fece0257895d0e19ff05be1bf5cd16455b6a42b7a632dfcaea"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "dc55ce1be46a42cb5e8d1b5e2cf6dbce95cbb09ecd58869f2043dc04a11b9160"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_FirebaseStorage.xcframework.zip",
      checksum: "1923fdf7848ecc7509d88fe9e6a4b208cb816c1deea4b735d1862cdf90c0d8f1"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "619f8db9178d0acc59dab0cb8966d74291a1306360b2840370f98caca2609997"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "be74b8ba8dbc14f81875183b3caf4d51563fe46938189bf574e4ded495cb9c71"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "0e015270eabbb1598cb51a86e9a852b6e5561b14f0f681b19f17829e8e248e8a"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_GoogleDataTransport.xcframework.zip",
      checksum: "ba125c672920ab870dc08b65ffdc2f93a3d043e75a1ab15d09d058c97465c000"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_GoogleSignIn.xcframework.zip",
      checksum: "7c0f1a3989514397e4ad484fe3a198f5b7f7f5c1b1f80defe546ca9e8006634e"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_GoogleUtilities.xcframework.zip",
      checksum: "fa615e42c50cada8a87757a7c186b484f212f1cb9cd0d8cef5064daa7b443b23"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_grpc.xcframework.zip",
      checksum: "ce2deddb1a49e2a4de694b9b4a8822541df17b6397351e86986500606d80fc82"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_grpcpp.xcframework.zip",
      checksum: "5223be525981849a59b058ff780b4bd3068338d85c636496de189ea1d0b23628"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_GTMAppAuth.xcframework.zip",
      checksum: "d62c990513d6c48194dc1fdc530ac03648dcc019202b0eac65457712ca0166f9"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "b46331ccf140426eed7ce0b2229116e11ba48d8b3a977776c54bc2e741fc3b4c"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_leveldb.xcframework.zip",
      checksum: "fd68a41652efe8fc35bacf7c139f8c46ac66805dfc94c40b3264f4feb0cebc3b"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_nanopb.xcframework.zip",
      checksum: "5c997bda4e8b93c60516184df61fd7ffde553773dc088009de57b8d01bc3f635"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_openssl_grpc.xcframework.zip",
      checksum: "4083fc104273ccd8d52cb3127639c07a1c34c99b303519c3cca4c78b1386435b"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_Promises.xcframework.zip",
      checksum: "0579850a9dbd4e8948736a9ef9b0f14518655469d0e7a6adae22ed3951b192b7"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.13.0/_RecaptchaInterop.xcframework.zip",
      checksum: "c94660c233f88f803a0759aa1e9517d819e7025b86deb68b4d07d1410d9ee149"
    )
  ]
)
    