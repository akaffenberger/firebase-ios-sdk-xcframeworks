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
        "_FirebaseAI",
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
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_AppAuth.xcframework.zip",
      checksum: "858d03a32b87ce1f57db6c6cfcb25df1e6423ebe51c42d2b394786e0dcb728f7"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_AppCheckCore.xcframework.zip",
      checksum: "8892b170adf9de01140383e09fca733b3079180b404e1b8136688779f9363fa2"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FBLPromises.xcframework.zip",
      checksum: "d0529f9295175dc629624f991f17ee43556bab747b08959ecbdcd27b3f045609"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseABTesting.xcframework.zip",
      checksum: "162200d5b69f46d4911dc9477cd54bb1e7bd162e38a8907d94b1bf0aa3ed095b"
    ),
    .binaryTarget(
      name: "_FirebaseAI",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseAI.xcframework.zip",
      checksum: "ebde4fe82b4e085f587f60174afd7e54c98b89c1f1ec3c615a50fc2ed53dbf54"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "5253a95c7c785cf63c931dc37593f2186b745f6f86dd230957d42a64308de815"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "cdcb8fd31be104146070bf3f5c724ad0c2168ab62744bf01ab9e2ffbeba294b6"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "54a25f924225de5562a9c6a9db0fda22ea9181a76e48fcfd305de126f1a2c4e8"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "fba9b43487d27d096708fc8dac13ae9055f0c88f86b653ad59e9f86f55dd6d44"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "89b479b501d0a180962424121db620017dd1f9a87b95d5afc6d85d210f8c059d"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseAuth.xcframework.zip",
      checksum: "c7b8dc81d134524b790b96cbce70e7b2acb4e82246968791b6051a9161493691"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "a0a6c5bf98976e9a2531106ce84d8aab7338bded5c2a3fd06c2a1c5019f2dd76"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseCore.xcframework.zip",
      checksum: "9f8f93eda91d12ca37d73a603cd000b21973413c2ebedf8b4348eeb66ba0fafd"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "2a8aed970de4dc17813b17ff7eb3ee6aa1f83cb579748c0101f57c29c4dfc669"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "1d5f0e81227bf4afe215891c5ff9eecbc274132f3d6b264af63d648b257fd887"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "f3313f2deb93137fd368d7f3de4fdcc5d49e2b4ebb2b2e4ab75d840f8ec05eca"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseDatabase.xcframework.zip",
      checksum: "58ffff6897d4591748d1c8fe31fc78026f280db947e1e97ad0286d5cdd9505ae"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "f386817689967d79e49609e807433abe1c908973421232964bccc0229208ea5d"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseFirestore.xcframework.zip",
      checksum: "88f099d59f63d61ede01121fd43aa7c48d1f4b8ad9c577e855313b130e391a6b"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "492c57535db727ca5ce6931b424157d1200558ea9d8454972fa95d6b9e620e2f"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseFunctions.xcframework.zip",
      checksum: "de7226d0ae1a4738ec731fb3aec2df465332d8f0875a61e39da67cb162cb0014"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "58e5095095d8344156d7cb958d28e1a011d6eccf23e337e3d946ae43fda780f7"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseInstallations.xcframework.zip",
      checksum: "f2b6c7b0e595ddd1e8075de65821ac41d65fb3a1bfc4a9a5a608f71a293e0be4"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "8f6a7fcd0ba04aa04cb85eea654074f47f6c802c69f13f6fb3da5f37f5292dfd"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseMessaging.xcframework.zip",
      checksum: "410de0fb64b4de949e255bc310ae1b65bb74aa1a8a49b25adb18222762e29e8b"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "0e96d5f7ffea6a39487082c1dc8eec5c908e96eb1989799c17defd7e8a7e2ab2"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebasePerformance.xcframework.zip",
      checksum: "d6e910cc22e807cfd880ce88dbaa0b49bc81f3dc5304697aef0c7ffdb0e135d2"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "e5a0c8ec81f68800a3f6fdfb55a83bf61ce8e7c5addd200de5b54cf025b1050f"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "f94f4bd85cfda71e3e455b2db8badeb9f29b23980bb4e060ea93e7f931aa0d5f"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseSessions.xcframework.zip",
      checksum: "55e96edeb5bdca41fd3841789dc51cf93c3334b3e43c18785d7c195329dab02f"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "7853cd59bda643174b1fff5f4f8c357659b1d1e7b56788222ae3f12f4d28e8ca"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseStorage.xcframework.zip",
      checksum: "0c45e3b1de7e1ac3de1626ed3ac5cf00568b28ab77842c9517f9deb603dd9e41"
    ),
    .binaryTarget(
      name: "_FirebaseVertexAI",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_FirebaseVertexAI.xcframework.zip",
      checksum: "6c5f3f011c286db45f4e131b90149bf9adedd776b9db1d641e844789a4da1d92"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_GTMAppAuth.xcframework.zip",
      checksum: "91a954539ec7c0161fc16e8f1d748120153e7adfed61330a0e5e2d10c2c3630f"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "36918763538d6b342e4db9ff4e1edeb21fdff8781a589798d5371bef36822a90"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "4b89eefd4502a5e9d735f010530815b88f565301a2871a4850749fd4950a65e4"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "f46de782bff53a1f54db269906d431611e34116b6b08ce2dc640e9a168c8954e"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "3697809e4e9b225808daea2b3559e4684e978844f62f5cafae916cac543c0ba3"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "f220885cc2005477d9610233b45eb8f53cca976f8bd7095e75039eab58ff04dd"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_GoogleDataTransport.xcframework.zip",
      checksum: "6888c9075f78a5320860bc02ce2746d7c81805f637bce17e72269894ca80191e"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_GoogleMobileAds.xcframework.zip",
      checksum: "0cce96eea650a223c6a094a5a8a02ef028b246ee29b687b58ccf9e384b108019"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_GoogleSignIn.xcframework.zip",
      checksum: "9739263c924337669ca7177805db610127e3de4848238ba32455f69a05a4240a"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_GoogleUtilities.xcframework.zip",
      checksum: "5fe09098ab6ee15630983b8af4b96ad55e67755803a4a496825846f47f177ee0"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_Promises.xcframework.zip",
      checksum: "21b2d8726c3d185120a5f56564333d621486662fd3080c71fcd284a8b7f09ee7"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_RecaptchaInterop.xcframework.zip",
      checksum: "131aece23692ff1dfae2e1ba69b2c697653a7b8c0a4e8c1f5c25e7047ed88384"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_SwiftProtobuf.xcframework.zip",
      checksum: "b252aa97fa470f5f1f5c9a9ab14545f4960453784a7b12d18a0070ae3804a597"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "d6db0f82ba96022250f6381d71be79905bfd0ceaef3240761580beba15acc189"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_absl.xcframework.zip",
      checksum: "21faab506380ece4401d0669b870724571041e212c4ca1c308b1b521e67e7d6f"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_grpc.xcframework.zip",
      checksum: "ae6fabdd2b4bfaad0df9cf96a4381fdafe81e2961b43420463984b0b8a6d3531"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_grpcpp.xcframework.zip",
      checksum: "779cfcd9d969070046a3f21bc42dfe3b09a834a726a198a68629e95449ba016b"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_leveldb.xcframework.zip",
      checksum: "21f7f65ee221dedf7b0755157264a8143d0bca646c5bfc2be7376d8bcffb3ac7"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_nanopb.xcframework.zip",
      checksum: "5f0f786a8e54cdcba8136d377bdd5a532949bc73816aaa7d0daa1897bee55aef"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.14.0/_openssl_grpc.xcframework.zip",
      checksum: "79a9fdc65b5785bce0fc9cab9504fb117155d25c04ac2b543b525010f3ade1c2"
    )
  ]
)
    