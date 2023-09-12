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
        "_FirebaseAnalyticsSwift",
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
        "_FirebaseAppCheck"
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
        "_FirebaseSessions",
        "_GoogleDataTransport",
        "_PromisesSwift"
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
        "_FirebaseDatabase",
        "_FirebaseDatabaseSwift",
        "_FirebaseSharedSwift",
        "_leveldb-library"
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
        "_BoringSSL-GRPC",
        "_FirebaseCoreExtension",
        "_FirebaseFirestore",
        "_FirebaseFirestoreSwift",
        "_FirebaseSharedSwift",
        "_abseil",
        "_gRPC-C++",
        "_gRPC-Core",
        "_leveldb-library"
      ],
      path: "Sources/FirebaseFirestore",
      exclude: [
        "Resources"
      ]
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
        .target(name: "_FirebaseInAppMessaging", condition: .when(platforms: [.iOS])),
        .target(name: "_FirebaseInAppMessagingSwift", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseInAppMessaging",
      exclude: [
        "Resources"
      ]
    ),
    .target(
      name: "FirebaseMLModelDownloaderTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
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
        "_FirebaseSessions",
        "_GoogleDataTransport",
        "_PromisesSwift"
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
        "_FirebaseRemoteConfigSwift",
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
        .target(name: "_GTMAppAuth", condition: .when(platforms: [.iOS])),
        "_GTMSessionFetcher",
        .target(name: "_GoogleSignIn", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/GoogleSignIn",
      exclude: [
        "Resources"
      ]
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_AppAuth.xcframework.zip",
      checksum: "a3fc4b30870fb0c0e34c3382a1e81d29afc1165a08154c7ace78a8d57eaf22bb"
    ),
    .binaryTarget(
      name: "_BoringSSL-GRPC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_BoringSSL-GRPC.xcframework.zip",
      checksum: "0e57919997cb76c840babdc09583e52b150d30f21de060be8c88f478f552d5ba"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_FBLPromises.xcframework.zip",
      checksum: "71699445ff30bf1341ef145044d7f4ce335de2a607097a01324bf87d99626fd3"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_FirebaseABTesting.xcframework.zip",
      checksum: "9a19b2416d80e1c562eb05f110bb8f53a80bedfaee47e4fa18d8ed85caa25954"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "e22272c78b9a63a8d013520be483c81a64e57d543ab93d84a0d4fb930b620af4"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "0f6ccf0b4c0494ba4720dbd4519e7246469d781480e12d3156311edfad09a172"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "bbe83a8181313e87193b72e5663e7a4f672fce528dc51ca97f1cc3fac50208ac"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "775719972caa09ddf720cab8f6a6ae7f7cde194e5c1669a3c1c03c9d77ffe5d2"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "bd1da0ca9d41fea34058ebf36f5986a95c8d8c2576e8a900d4a2ea7c37e2253e"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "2ad1ba4c5e3c9aa86b240f283116933f23c47a3c5902dbf0113233ec6d1f9b72"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_FirebaseAuth.xcframework.zip",
      checksum: "837174a4ef01978fc8f2bbe20812d0b0b0b8e4766bdab94b571e80b99c0041c1"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "47d0f5163c3893e27d7a3eb45ac8e9da803443d629146edb5b4bd24573f1c0c8"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_FirebaseCore.xcframework.zip",
      checksum: "ffb5da04ecda74902c96d2d04a869d69f1180bc5fa3fe4e89da22bcd413762b1"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "e6bb8737e55776350d4f0b560d974c6227dfe441cf26319369a807e19a2ec8a8"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "f5091b2fed45a76ec9dfeed727d23d177f12d3895bd6fccc907ec159ad2bce89"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "da3bba7ebe12f3454ba22b94211bd1a6c2db49f5f2d3220a88adb965f01e6ab3"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_FirebaseDatabase.xcframework.zip",
      checksum: "0e759da60864e3a941773c0c7f5f45fa994fd382a86f7b5c4e45a0f86b39482e"
    ),
    .binaryTarget(
      name: "_FirebaseDatabaseSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_FirebaseDatabaseSwift.xcframework.zip",
      checksum: "f26e6f575e145e5cd3f7d3296b6245345a2c192d7a7abc6753073281531cd72e"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "746a7469ff326077c0f2a6530b3793e515afb6cfd53ecf8e4cdaf02529d95359"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_FirebaseFirestore.xcframework.zip",
      checksum: "ed7d8090929aa9222a87f3f708e6574435c42e64fb08448d73654042d5d2ac59"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_FirebaseFirestoreSwift.xcframework.zip",
      checksum: "1015bfb245dda7457816fc22489136c375587842fa2a35417de42b89a91da787"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_FirebaseFunctions.xcframework.zip",
      checksum: "a90525cc71dda6a9443c4bfe0363c019fc48f774a2770531fa96ef58c80932d8"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "5238f44581d653abb4ebd52b1b6a3802491dffff75166d722fb7723b7865033f"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessagingSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "da0c65b2e93d47d6b592646ef6ae74b8cd63e4631be0d4bdbbf331a7badb2e5e"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_FirebaseInstallations.xcframework.zip",
      checksum: "c0e9cf41c53c49c83d97a32bda962178a0255f034aaf878555158ee5e0067169"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "74f4872ae55441cbf0982d52b466f97875099d8baf8c90349043469b4eb51ce8"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_FirebaseMessaging.xcframework.zip",
      checksum: "e8f8002ac226141b6202d6571f4893ea7164d50beb244c87978d2d2b931aaaf2"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "de9951fddf809eff32d9dade57773a9eb20954f44e1d0b2cd4ee3dc81aa46453"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_FirebasePerformance.xcframework.zip",
      checksum: "51fbc7e733aa60b6fd6cb0de2e6fb119ae8cceb4bc9c5cb7d88018a0fc305e95"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "0ed44f1c7cec833751a3bb8ad0b33097ed0c25125694f5fa021868aaa8b896f1"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "f132cd1be83d64ea60ca37b98f2fed81e3a4678965e87fd4adf2b0b7c5f17cd0"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_FirebaseSessions.xcframework.zip",
      checksum: "8d6041169575b69047177961fae81ce62ed1cfd995cb4500a7d28b34ac72d51e"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "567f3478241553faead55954e2f23cbc90615b753c7b1b1c2462d0142381f316"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_FirebaseStorage.xcframework.zip",
      checksum: "b74c01ea44e9e5231e82a8f1aaba1d79cbfedc2cd2db4f8601baa59193c8f96b"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_GTMAppAuth.xcframework.zip",
      checksum: "c47989545ea29e4061be64d117a0cf510895e7b7300cbdbad27d7b2bd9fb2025"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "aa58e0e2ab71461138b15b5eda4106944d7bc7d8b6dc759961f75c6e68f69ddd"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "747e7c4c8fb9e5d259f88ec05fa6a69bdb1d53bc0c8c4b952a0986df135ef25d"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "af95e29ee734d8cb7ca3fa107e4c888b9ccab9bcd78fe63ca31cf0729f1b0976"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "0bbd47f0e99d191e66c04285b9ce650814e8a362e2b71690470d8d5808e61eb4"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_GoogleDataTransport.xcframework.zip",
      checksum: "0ce94f7ed8d4ee0b225f1c8df9635b891ca97a0489eb1beca12cda162332e86c"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_GoogleMobileAds.xcframework.zip",
      checksum: "ecbc815364c25ccd227060f04b2efc555404962396e2fd6b20c96dcdd9a69b79"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_GoogleSignIn.xcframework.zip",
      checksum: "0e2162da4a9354ca0aeea0950317a8630bad31de380a61bc94ecbfc6573de164"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_GoogleUtilities.xcframework.zip",
      checksum: "35ccb087bb1c1fd99b4b6df34e6d85ce0b1dc6c52db0a79fadd405791ffd4a4e"
    ),
    .binaryTarget(
      name: "_PromisesSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_PromisesSwift.xcframework.zip",
      checksum: "4feaee06eeacf11860a0e2bed85553ff55bd95a8bcc87ab2ecf4ddc8d718807e"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_RecaptchaInterop.xcframework.zip",
      checksum: "0bd1b5c6f25f050a01b705f355cb5ec56c6d85101f4d9e8c5718f34a0b0d09ea"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_SwiftProtobuf.xcframework.zip",
      checksum: "874450bf514f159c190b993f664280108520dde76565a64452d7261da52ceadf"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "735fad73e540d232ee32efafde8b79ed564b1d9e7a314d899c13d567a4768b88"
    ),
    .binaryTarget(
      name: "_abseil",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_abseil.xcframework.zip",
      checksum: "cf47695f8312b390a74d898ee234d1e47da405267feddde251fc329f73d2dfad"
    ),
    .binaryTarget(
      name: "_gRPC-C++",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_gRPC-C++.xcframework.zip",
      checksum: "e6c5fd0fc0b84a67e03e3387c6d6b46f0e980691f8f1d8bd09e57880ac8d5e40"
    ),
    .binaryTarget(
      name: "_gRPC-Core",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_gRPC-Core.xcframework.zip",
      checksum: "c4f89ff8e63db5ce7b1d40fbf810f7e24dba5589cdb40a819c0d3e3737748a81"
    ),
    .binaryTarget(
      name: "_leveldb-library",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_leveldb-library.xcframework.zip",
      checksum: "8adf8031db2506bed06e40569740316d44b2a8d0ef1fa88e20839fc1c2a3cbbe"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.15.0/_nanopb.xcframework.zip",
      checksum: "0919ea90e23fbcf35c5410f715faacd2a4a89eea1ce9623dbd02eb13ded1a328"
    )
  ]
)
    