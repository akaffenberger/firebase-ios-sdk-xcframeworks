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
        "_FirebaseMLModelDownloader",
        "_GoogleDataTransport",
        "_SwiftProtobuf"
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
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_absl.xcframework.zip",
      checksum: "4eb52223245212355e5b001a2680ed7e23fe4cf72641905030476426a0a513e4"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_AppAuth.xcframework.zip",
      checksum: "80ea48ac77fd0a7e538a22b3999f99155e9ff303bc0fa303551283ec0525a61f"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_AppCheckCore.xcframework.zip",
      checksum: "230e601df336a3d4e37c7a5fe56dfef468932cb577fff4d664156a022612f6c3"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FBLPromises.xcframework.zip",
      checksum: "2a4780ef3657175b9e5e3119bf12108f4ae90bf33ff93b72738234a158bb2f1b"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseABTesting.xcframework.zip",
      checksum: "85d54f3efcf16d481e88bb7e9668ee1138b63ef6ea149485cf1eb04c0bdd1f46"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseAILogic.xcframework.zip",
      checksum: "4ea56d951a61a033d8219adf0e262f2572828c1dda69add7f70eda53f3934263"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "997dc646a2f827dada7f8512d1df61e4697593c5e88186c848c1ddf0ebc30ee2"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "69494ad91478472bd3d90d4e1ee9532b64fff8ab35f249a0df31db0c7ef82cd4"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "94f9a23627b88e9280bb0186643466010b7c528ebad01b6800d4bc69acd56471"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "a4b517b18102d847888fe048b42721cb11906b6312bc1ce85f80d2b962da4ee4"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseAuth.xcframework.zip",
      checksum: "255985ad4302ff860159928f1193c56543442bcb22f36fe4d529296fb4e1c24a"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "4b34990fb7df00b1c05c56c464e1767f62e17ae9c69698bf9b2d1c42d316f09b"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseCore.xcframework.zip",
      checksum: "c2580428e158f4ff4c48b6ace178b126550fecea626dc0e679fe798bb35d104c"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "98694692a1f2886753f8918bbf6c6a092d5582314332a976a0933d92395d097f"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "8388b6e8fe85175d58ba930f63ac2b9e2a4ba6d7ce0f6064edf48378ebda9d0b"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "77570c53720ffbeea2ebb8ae657fa7100b68fa06a14698044321db9914ef4465"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseDatabase.xcframework.zip",
      checksum: "de0da876dcac6a1cf94d2c0e965bceb993367b6d8f792daf8e950d267890b8b7"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseFirestore.xcframework.zip",
      checksum: "689fb9977eb37ed5844000dccd87f513220ff7a8fc9f46c0a5a86b1bce480042"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "c2a60a9badb08acc6ff6d20ff3d5f67a76b538c30e4cc63c2a8816ac6ed82e38"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseFunctions.xcframework.zip",
      checksum: "115e2fa1a093dbde9789a3a261f76a3de61072371e6557884a7642551e2807b5"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "f34295a815271f448ff6a923336ff2d175ad4d4d7468fab5a1d3733eb5d448d5"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseInstallations.xcframework.zip",
      checksum: "050f88ded9a9ca92266109ddfe7dc34bdd033c9deb45e6fc6bdbd68db7896989"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseMessaging.xcframework.zip",
      checksum: "4dd029cd90818987555a51917164333a42f6559575321122eab9d7b50242a9bb"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "2b154e4dcbf5c35ac231fbf040702114865cca8483036dc26e42cacbd2ff6673"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "e7231b1691cc9ea27909f4abaa369318e4fda307ccdec5448b5b0b0de987e00d"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebasePerformance.xcframework.zip",
      checksum: "2da6772f7afa0158f58690ba8cf824170c92aa6caef20477db666158dfcdf572"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "4c87f51fd49ba3992f36fe2142f9c39fa959b434c5942713b9bd73281546d0fc"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "21262a0786549acb0f416057b73c9f06807a5e1ca034dcfbd4d0bce936b5d046"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseSessions.xcframework.zip",
      checksum: "968f4b8b943a5f660a2facb6438b7893847e8950600f3584d63fc4f6c7b8ea8b"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "57da06e6fba3646f45a34a7af1dfb50b91bd60b9d2adfb98d32ac3226d0954a6"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_FirebaseStorage.xcframework.zip",
      checksum: "8c19b0d779032c2da91cf03ee42a6224b68b894e35892ae99ecb18d9f76fc68a"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "af4d56b25ef7f4d91c7cd77161ea21432479987a37299d9d874462c25ea3c6be"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "fa3801c57ce3a94a131e659f1cf587b8c9a8de29dcb6b86539fe6ae3e2930354"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "3372b7d15e9be5a044cd307612ac1d9a504dc851344380ef597d37dda3b4cf9d"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_GoogleDataTransport.xcframework.zip",
      checksum: "8ed840cd815880dcc9eb6afe2d9e43a2e9c0cb9609242f9fcdab80ab91025a68"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_GoogleSignIn.xcframework.zip",
      checksum: "93ca90a27acb28a4563faabb23975188c995233f8a19a8bd671a73c4e439cd90"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_GoogleUtilities.xcframework.zip",
      checksum: "623ad3bf763c2d49d220bcd2fde208ff0c03431754c2aad5459b5917d28a0e99"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_grpc.xcframework.zip",
      checksum: "e94ecd18327bf2a8afca48260ce96c3ce595f172868d138c9ad79145668088f2"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_grpcpp.xcframework.zip",
      checksum: "17cddc7abaf2a33db43c95e8460beda7a2bc25d9f486f56d26db288926c7844b"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_GTMAppAuth.xcframework.zip",
      checksum: "00d933cc705a33afcf69c457c333b02cb736d578a95399bb6afaf1937a6da8e8"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "472573c59e9ead5321317145f0eeddc8caae876afcc8351735f714e66ea30aa1"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_leveldb.xcframework.zip",
      checksum: "349755d8c56260866818ebf8a778e54423abc7fd3d1fd9f62835b8d69539ee2c"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_nanopb.xcframework.zip",
      checksum: "88cba29074bbc7c283947e4c74a9b7bd2c9b08123eaa1ac7fc57e37c53a84b66"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_openssl_grpc.xcframework.zip",
      checksum: "fb6395c8641861510d714d60bcaa7a277a9042cab4a2b325260f83379a0c6820"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_Promises.xcframework.zip",
      checksum: "19040343fe93107179239a0bfe64bd1d4eab67db6acb7bb9f1a74c2cbf2e87cf"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_RecaptchaInterop.xcframework.zip",
      checksum: "8c2f439343ee706079b73047d570f85fbe13de17a1c47951a1615b68ddb45e5d"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.7.0/_SwiftProtobuf.xcframework.zip",
      checksum: "135357e86c868fb43a0dbd0e3a7e6094be5ee61085def18f7a2c3d8a938fb1d5"
    )
  ]
)
    