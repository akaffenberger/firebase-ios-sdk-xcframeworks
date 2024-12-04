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
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_AppAuth.xcframework.zip",
      checksum: "237ee64365d092b735ee4733892940394e3ed534f07bb6db30639f553c7aa9e8"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_AppCheckCore.xcframework.zip",
      checksum: "77dde05abbf88a3f5724ca35239a13ea0eab3705dad355ad42efc8a302266290"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FBLPromises.xcframework.zip",
      checksum: "255082a6ec5333969add59bad7fc50f380fa8d275767d10c3cb14498c413ebf3"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseABTesting.xcframework.zip",
      checksum: "6ff271d7ababe8d6298cc2b0e2842e05fad2aeb6aa5c3d67be0d17f5aa44d55b"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "4491960ae0bc6dd5e64106af192a72c32f3ca2a2b5e337512aad62012f209802"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "b1ce0952ecfdbc0c854f7237e47ca5b3fd6e54474d150553128fc30d0a409068"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "8898bcb46e36110cf3e65adb17a0396e9ef6fde25baac84b1254b603c7ddfc8b"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "e9ff8e2009872c6f0aa3894f9a37cb3745b4ee7476f5e038b465e7735a0e9d03"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "203ab8c1797fca58ad34c7e3874a6e1acad3611a4ed0b442c56b6e1064d45748"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAuth.xcframework.zip",
      checksum: "4eea4222669fa2ec24ee7c80ada84008a0fa6144cc2cbf7ac510fce038e80ad9"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "465e782a5c2fe1374eb57b321783cfa19d7f370aa776978e56ad116f946aba5f"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseCore.xcframework.zip",
      checksum: "e40b93e10bb872e9664d9b18f34c3a15bc55bd5d82e3d13de0c64eb8cafbfef0"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "bd714bc479ca30eb1a0281413701f511a6e4489f9313bb9c26b17c1d54cf524e"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "64fe95eaefa95ec4bd41346d9e25aad6be36f586e2b8b24029e306d637a0d37f"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "6e57815f311fb6bb2b19fa267fee2e5aca68737e76043757d145d2fc7514c0af"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseDatabase.xcframework.zip",
      checksum: "6de6650d5f9deaddc53f43c466c71fd8f88eb548ac2d5526b616845aa7234044"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "582a93fdc76a131825324f617b33a2d2d8693d71c3bbf8e556ca4ffcec3a5828"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseFirestore.xcframework.zip",
      checksum: "17f25e67fcd51d17aff9e59d20b3751d7f04f6b3f488198a73d1426cf1bdc18d"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "2ca9a12e54fc19eab0879cc1b3e287823e6f14ef097bf1c4ef89b4a7ea9c5f17"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseFunctions.xcframework.zip",
      checksum: "2f0f0b35c0da32413f658972e165bba08c748846e16af3b7bbfb2f31c8af9f0e"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "cd71d515fba703f8b928a5e60862a51125922ce0b953d81a45f8d870e5399479"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseInstallations.xcframework.zip",
      checksum: "28b04eb3d1dbe4707d32b2078574acc10ef12b5cba2ac26ba0555bacce4c68a6"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "1f87ff1e4d16fd531d0c0224dee0367d1787688d99c3e7f51e60323bcabdb9b3"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseMessaging.xcframework.zip",
      checksum: "61290562715262fbff6152e9745d9071bc358947c5d7c4612afe2310d9662962"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "ddc0e76ebedbb77019b8f0845237234b29fce4349afa6b5ac19a60d474eabb56"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebasePerformance.xcframework.zip",
      checksum: "715685475e386d86bc9feb7f22d99bf2902cf9cf7b8741cde2b317cdd63cd336"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "738bc55690fdf3ad5c84093fad52487a3e6404cec91b654f58c3378f91474c7a"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "8d4debed65b80e396f71733f86c2b7568f3db11bd94135ad7ccfcf9d8711d0fa"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseSessions.xcframework.zip",
      checksum: "f3f01f0e3d837d71c47b88a4cc667d8024dc1a7b38978153fb7b7dbd862f7a43"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "44fc7cce92768f9ea57015a559d0b29c26089770e4e33388d019a57f6eb279f4"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseStorage.xcframework.zip",
      checksum: "28416f73c604792c06b1e969cc4187877ab0d1a01789ec6307560b6b40b54128"
    ),
    .binaryTarget(
      name: "_FirebaseVertexAI",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseVertexAI.xcframework.zip",
      checksum: "b25d702aee6a98af6bafeae7d8da5ce69fdde6981b4fae90afebca0cf1895274"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GTMAppAuth.xcframework.zip",
      checksum: "9f314be09242154b91685e60380972e10b92f07b4a02a17a9198cfa842738b4c"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "3ee03e15ac1711f705b1879aaa333ed832f97e68981d6609671931874b7ac8cb"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "218691ad7ed1f7e6884836e87badf58bd8c3f56e7c8c9910e2c5d94050a7fa53"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "028dfe79ca1539540281c1adddcfdaafd080d1b3add529697a6a77694b2d8568"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "3bcb85b73d85aa94bc917f3d316e63aa0d62d7e8246a49737fe67412acd6b7ec"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleDataTransport.xcframework.zip",
      checksum: "b3332dd5d27d39cebf12bad45d629abc2d4e6b92111f600e427a695140479060"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleMobileAds.xcframework.zip",
      checksum: "04ebd0ae7fb74954761cf77dcece51f0581b78697913d56412ef5fc56fd48fa9"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleSignIn.xcframework.zip",
      checksum: "4c6ba60133f385383088fc55414991b04a3b1764832fe834f226cbcaef920d7b"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleUtilities.xcframework.zip",
      checksum: "4f157b08c54f43fb099cadb43d1db7b9f1568aac4cdca6edea62ea0db7b6ee9d"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_Promises.xcframework.zip",
      checksum: "b081f24f8e5bfb0972098176b00b24df37c73d672a1f7156aea736a5b202f4be"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_RecaptchaInterop.xcframework.zip",
      checksum: "34e93963ab57e57d30765d02258d96f89a2c6c97e4fc5cd6f237e2fcd4488794"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_SwiftProtobuf.xcframework.zip",
      checksum: "67b6b253651aecab0b707ed7ea55c119bd0997b0e24c7aa9d64a8ed092d92521"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "5b63029eb33a6cb25febf18c4340c511340dfff7d42c7672bf0c28b43fb7d841"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_absl.xcframework.zip",
      checksum: "27d8d9c7b2270a3dff6cbb028de0640824ef5f99b22046933c8ef40cce468763"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_grpc.xcframework.zip",
      checksum: "e8aaf836da9d95d9a5f2db38f6fcdb46cd4f43f3e3ad2b0b374c579e364875d4"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_grpcpp.xcframework.zip",
      checksum: "0555565c594cafba2fc05de5ce057b0a9ded9c5d77b143ca03ad3f124a455ab8"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_leveldb.xcframework.zip",
      checksum: "34e5941ce166ffd4180483040caef21a1ae9d4c70fb9eec609144b6f2580ef5b"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_nanopb.xcframework.zip",
      checksum: "cb01c00bfa861cc05afaca4e568697d18bba195245c48d711c37f53b1f5172bb"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_openssl_grpc.xcframework.zip",
      checksum: "a1003f932e2e577047609d5bc6ae1b1dcba4daed8699aa0f319f103a53888557"
    )
  ]
)
    