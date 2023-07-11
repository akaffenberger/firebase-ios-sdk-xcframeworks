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
        "_GTMSessionFetcher"
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
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_AppAuth.xcframework.zip",
      checksum: "29650c64be15ee61ab5ee07e227affa77aea6eb3c10bb10e00aca2cdf7d69eb1"
    ),
    .binaryTarget(
      name: "_BoringSSL-GRPC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_BoringSSL-GRPC.xcframework.zip",
      checksum: "3f872962639188d390dffd993e3cfbe0210ca97b40acaa4e52d6da03ef72e238"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_FBLPromises.xcframework.zip",
      checksum: "44bb861009af7e71f7ca281e25bb913d39adbdd4a4946272effb5f328c1a20a6"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_FirebaseABTesting.xcframework.zip",
      checksum: "d82b5660ca8fda43dbde8593035cf9090707c55064c13497f46e1b4840d08ef0"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "6114747b9089570df852fc3cf8a17eaa9c393ec4f2d57194145be43d0a16c446"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "45291aa3bdfe8f13a1e2fd3718b377dd983b574cd8f33f95998d0442dade5758"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "a79be79df41fa730cb062a962d956d4d1362c3493986fe262dafe51f6ec10369"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "84453f3801738c986245e4a626913e781e8acd53470c853143312d74c07fd3f9"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "113e51e82174bdd9da0f8f875a2498cf2517893772a50e0bfe4eec8637dffd01"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "d722359324197df4977768f89aaa8ba6deb11fe782e815fffd0d7ee7c2e7fae9"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_FirebaseAuth.xcframework.zip",
      checksum: "6fad85244aaf23eaec32fd0c845fb13f4942d8664a97899a309e38b73b53b340"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "f8d9bc360c2e245073534bb24b36bb84139ed00fc6cc31facc19c191c1a3fa2c"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_FirebaseCore.xcframework.zip",
      checksum: "03f8bcb814391d70fe75f06ace3e1819db997c1ce4de17b5a9b118be30320a0c"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "ca3305b162188da4dafd84b1c94cbbc637c5336da6362593051b616b84ddd9e8"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "cb8f10a15787bd20422d19b6a640b296bb3355abfb2d1073e3f03f1a9c8fa2f5"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "5c95cdb21dc900a3365805a32b1000d5d3af38a37fb7aac0b6c10cd9e03e39c3"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_FirebaseDatabase.xcframework.zip",
      checksum: "757d59074d42d820057cbfcb321cac01e6b71b6586a1494d4a0077481c5c91dd"
    ),
    .binaryTarget(
      name: "_FirebaseDatabaseSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_FirebaseDatabaseSwift.xcframework.zip",
      checksum: "6a27922f603bdb3ce84e807a97029b2589731aa198b18d0a8569e080380a8b55"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "edf8a51c26a2260db3a6521146a0ae46e717c5e52d798ba7e08af1b4b8b185bf"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_FirebaseFirestore.xcframework.zip",
      checksum: "5a9d112c1d83f2623b2f1a04f4d1e8ef4797aafd0eaa76917d35aec66a1236f9"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_FirebaseFirestoreSwift.xcframework.zip",
      checksum: "a257c046d464e9276cf9945c12602740c2b6849efdaf17a4c14829f24172cb78"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_FirebaseFunctions.xcframework.zip",
      checksum: "a4994202e1c14531f761a11e6131185b951d7ab130b90343df1eca805fdd59b9"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "5ed1d95fef0e89ae19c80582bdbe33fb489d3c77e8ae4178eb9cf6f47183f74f"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessagingSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "d71b7462246e05e8ef2e0c10aa6ecb80a58e5877069aba6416880ea3791a6623"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_FirebaseInstallations.xcframework.zip",
      checksum: "1e90cbbbf6e32d196310f13e70ab4945dadb680caaf71133b8910e5aafaa2bed"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "1c6d6ef8c5e7439fe3e537d2c8c449b44fb8d4674b251f62c417ee7311280fbc"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_FirebaseMessaging.xcframework.zip",
      checksum: "2ae6ce2cae2a3499f978c0fbcfe9a544f6561c5d1aee35959469905812042213"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "4d3b87364f9fabd619d4564393126de981606b599bbe2d4604448e37d4a2cc98"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_FirebasePerformance.xcframework.zip",
      checksum: "358c64535fa3492e538ba211b95aa501334cbc77668f6254c4c4a76259944051"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "6fdf0e5191e475ea986f7603bbb45a4b9490020f68551860a947e5f3f490e96c"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "7b93ee5ab8b24467a92cdcd9e463b64a654451dd480397b0bb4e1131e0a378be"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_FirebaseSessions.xcframework.zip",
      checksum: "12a59d682fa9843c1f39755e6ebaac6c571515cce68aa989d8355430a2611158"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "c17067784e7a6244d19ec8ad617b6dbd5572cc0cca0ab1a1a8d0f5b650bda0f5"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_FirebaseStorage.xcframework.zip",
      checksum: "f50a31523cd5e53fa56470ae27e721a2aed28acec7c594100ca32be93856753f"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_GTMAppAuth.xcframework.zip",
      checksum: "f484b0bbb8764c27ce5e2488b7b070248437ecf0966a23a7075618ace35014d5"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "675cdaea72c90753a821b6318658358bd6650281909a4b442f97a9e208b1a5b6"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "2fa9f715dec88157b2088b9a4004fb8a503e7140f50cc1d9523d0c7e5edd9c86"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "7afb85c1cc5711b97f5910445c6aaa8f1c19e4b2860f5be9863057c3f0d1a32f"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "f8427b19aef8fd3bae7500bb09a8110061bff99554c108b28b38baa2e81759f4"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_GoogleDataTransport.xcframework.zip",
      checksum: "13592abb567deb2a05059ac669a185672417277fb092bdfe422b44a2d2922de1"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_GoogleMobileAds.xcframework.zip",
      checksum: "b6b643f69ec476bac6eb703031aa2825d73d18d391b99b0fde2d188b457cbb58"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_GoogleSignIn.xcframework.zip",
      checksum: "ce003b6078f5eab027434d6956a0943bcf54a4d508317b1a89f9c67d46532b9f"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_GoogleUtilities.xcframework.zip",
      checksum: "64a19dded3be520683f330613d76071f05ca51cf0f19d363a4cfd697eab7a0e3"
    ),
    .binaryTarget(
      name: "_PromisesSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_PromisesSwift.xcframework.zip",
      checksum: "e9633f0cbd39949f0fd3af0e83935660b3dbf7d30601c840917b56117852bb91"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_SwiftProtobuf.xcframework.zip",
      checksum: "e4037a0758ff164203c63f9b5ecebb7403b4f8eb9defca5042c77e3fdedaa7be"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "75ca667601191767939741d0ea65692694880383c78ac974fdeca5b163a56bb7"
    ),
    .binaryTarget(
      name: "_abseil",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_abseil.xcframework.zip",
      checksum: "5bbe58eade36944c7f9b94fc88d6aebcc63cb7853e7061c07c8437da162b3488"
    ),
    .binaryTarget(
      name: "_gRPC-C++",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_gRPC-C++.xcframework.zip",
      checksum: "d4807daf648bd104afdd4e97b7f37f57798dac8aac5a4d8f485890c907b54460"
    ),
    .binaryTarget(
      name: "_gRPC-Core",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_gRPC-Core.xcframework.zip",
      checksum: "56b1e343198a14f46d5e148d9b77f326518c2c3b6b59f92ea59c6008b4821708"
    ),
    .binaryTarget(
      name: "_leveldb-library",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_leveldb-library.xcframework.zip",
      checksum: "8386d50d36cea1f9225d244641a4739ad85ae4c5ab84d0349ad943a884719754"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.12.0/_nanopb.xcframework.zip",
      checksum: "09639d49aa0693b76f8ed2ace32d0ffb2e74c70370f1c821296fff7ef7b544fe"
    )
  ]
)
    