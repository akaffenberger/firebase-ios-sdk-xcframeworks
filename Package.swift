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
      name: "FirebaseAnalyticsTarget",
      dependencies: [
        "Firebase",
        "_FBLPromises",
        "_FirebaseAnalytics",
        "_FirebaseCore",
        "_FirebaseCoreInternal",
        "_FirebaseInstallations",
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
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_AppAuth.xcframework.zip",
      checksum: "bfdada12877c03edbc74aee5729fc6a27d25f30e820bf13adedfd3eba8408e0e"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_AppCheckCore.xcframework.zip",
      checksum: "db8bdeaf47dd8d35183352e4ebf66ba01a7fe659dfbd77b338d454152438aec9"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FBLPromises.xcframework.zip",
      checksum: "f11eae290d8ccb6d2696f2226f11c5cf003653527968cb785a2496631670a954"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseABTesting.xcframework.zip",
      checksum: "ffa31e03c32f8598a3f6c0ffb0ace2f8a44d91d122f73f2a9336e4b1c4d9f834"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "367c8e9f78861a59d2ae06725dfb7d0bfa93b3ed37633483df2784d1497cbaea"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "e54c2e4d742b8139215ace0da54f9b9287a99d3a5a358b201aabc42a1dec01ec"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "06dacabe31abc2de6323e4c81dc0cf49727bd7905487f230f183380393fa4f3d"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "a5bf7eb31a4b1c540c9e40781a52d43f93976c9c8a579c128563e702bf1ea564"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "7fc6837c7520d382854a807ae7a8819e86056d700019cbdd6232077636c132b5"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseAuth.xcframework.zip",
      checksum: "6c44c0e125525098567c9d748ab0ab2cb9f86d7136125412e3c2116800d12769"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "9b3d324a2960cf678f621fa94801314b2229a6784a3606c1238b74d533fc838c"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseCore.xcframework.zip",
      checksum: "750acdcd0a60062b0e665da2126833c5f1ef6d96a208e973753fcf2a2c00d9f1"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "b0370365b9e60883d865c97cb8c3d1398b5e56bb57507698c28ecc599863700f"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "a1a45761c7809f0a7e1e41d7c71adc40157d293f14cff37b66818ad5f4df9900"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "2409e7e80e0fee32024f6b5c6391196c5a7b4f14e98cedcb641d7d68a7bddbd5"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseDatabase.xcframework.zip",
      checksum: "1e08c63a1ead2e0731ac51060c299cb4c3b4d295365762d95d8e8b2c3d4a5750"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "15276aed291259efc122edfe501e2f8543a1ab3922ad82193763152685f155a4"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseFirestore.xcframework.zip",
      checksum: "a68303b3a23d8cf251c298b37ec9b47b11311ff8b58d4713129e605cdb5d6858"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "d989bf58133e6a1e736779d4842161e5dc15794c304e17e2825d31d7b30b6d0b"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseFunctions.xcframework.zip",
      checksum: "6cdfa40754e709c23ea74d845b92129c5516cc2364ddc149f6c835805955bcee"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "bc1dad5936f51d39a9380da4b359dc0c2f2c488ba064aecc2697b1f3997d6b77"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseInstallations.xcframework.zip",
      checksum: "bf382e5467e8ea26f59cdd973b7851e812f52ac1def743a91c24c8a7e03a7a92"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "ed58daae940ef21f0513a41d1bb2cce59d7367951194d58ccfc5c8550c2607ae"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseMessaging.xcframework.zip",
      checksum: "76c4a8ebef20458939613e0c0f395209dc3e05471f1a2d20b7c95007be636a9f"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "fbe9063773a3c5adc6a294f7e0058db6929ac22380340088e4ca65cce542dd83"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebasePerformance.xcframework.zip",
      checksum: "84ac7b0e5e8fa5847b83f143ee098dfa3da071719e340fe3308a107474da99aa"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "8028fc0eeab1e47708b46805861e0f1283ee0f41e812f6b6a5e9f96a47d175d2"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "89c086894face0da6c9109ed4ad9e99d7149f135157f59f93e0974ffae8cdda4"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseSessions.xcframework.zip",
      checksum: "137181674cb7978e3718f9e7e2c4fc4018c8d540433666dcfe3d0ed447c32ccb"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "18132d38f6651e2436a8ab3d75966258c881ad36221b29780aa554c4f274dc6a"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseStorage.xcframework.zip",
      checksum: "09bade857b5902c414a82713527a7f83740326051a373e6041667e2241a11f6f"
    ),
    .binaryTarget(
      name: "_FirebaseVertexAI",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_FirebaseVertexAI.xcframework.zip",
      checksum: "faf672ce96eac6fa1a4c093b6365548d8e45bea26d8167db9b29603774c838d4"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_GTMAppAuth.xcframework.zip",
      checksum: "70dd484ab2221e7c7c3ce90f4783ee9e65e6532b2c393f00f53eb7a9713155f0"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "5e3512d10e6ce968430924410d2f2d7602dca7399a3449f19d88b2a69fce433c"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "04422bb5fdd7e83df99c6b07495e677a0c7ad335316046d59c5867e341d9807c"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "ffe4e77dfd6f0234f456f71b7e8de96503fef0cf322337f3c0b8982db598b23a"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "7865f74b63243c5df80d8258699182ced86ceff45e43f4b11ba168755315cd41"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_GoogleDataTransport.xcframework.zip",
      checksum: "ec88be0aa5d5e3c5cde68b15b7ec6f89420c0e7ad3161fb9a0be5896b933173f"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_GoogleMobileAds.xcframework.zip",
      checksum: "0cad716bac97766305f30ec8fed066f6d8f35dd1057609a78496f9d6ba623918"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_GoogleSignIn.xcframework.zip",
      checksum: "fb1b64dfbfad8bbcdd7e48ebbabe108420d9c8f3fa77f45c6dd0247fbd7deebb"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_GoogleUtilities.xcframework.zip",
      checksum: "65f9e29ee37f4cd18986135d63f593f1b74caa96ac41441e2a0c9263774baec2"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_Promises.xcframework.zip",
      checksum: "a2802022af7f8274e1a0f6ea5f5e0e6df58ed20ac862a8501dd80fdaaac49668"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_RecaptchaInterop.xcframework.zip",
      checksum: "0282276d5566d52ddf1c936df759a565e6fd82bc460808386aba2b669b680598"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_SwiftProtobuf.xcframework.zip",
      checksum: "97743982bb74abb294df227d34015d5f937a628e39d2c9ddd4f21feeb7c34fe0"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "7f3dc415bf1c84fe50b38c70cb3aef9275dfe35642efef1f20f60a93839f2556"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_absl.xcframework.zip",
      checksum: "eaba0fbbe14198970ac9f3165370aecd8158ebb11a16d3d3f7d6a6f0ed756240"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_grpc.xcframework.zip",
      checksum: "612d8d573bdf12ca4198bee449ae0c9a9c6221663caad172ab7e1c2525cdc901"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_grpcpp.xcframework.zip",
      checksum: "802c32747d181fae2bf94f69008a06f57c1c48ecdd1bfbe4270312801cc9747e"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_leveldb.xcframework.zip",
      checksum: "9a36d7b0406bdb32afb324d702694cf7da0433cc5f011f3af25f7facd9783742"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_nanopb.xcframework.zip",
      checksum: "9c0aa30cccddfa2b70e7188be68e77a1226395721821a83e778dd4c0b22ccc96"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.9.0/_openssl_grpc.xcframework.zip",
      checksum: "fd878b117d2dde74149cbfb84e0264eafac3544aa6c44b8f2ae6ce423b263830"
    )
  ]
)
    