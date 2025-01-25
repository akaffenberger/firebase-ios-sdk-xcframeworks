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
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_AppAuth.xcframework.zip",
      checksum: "4b953dc4b3505e39707703acc041f7e3822c6fb7ad175a9685be811cd262278b"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_AppCheckCore.xcframework.zip",
      checksum: "eb1b9093de3f0fb6d0d1460b8f5c6917d1728d37a7ba9cfa86fac25819e0a690"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FBLPromises.xcframework.zip",
      checksum: "5600c09426f4191a99fe50c092e035f451b876855cafdb95646255f842b7d801"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseABTesting.xcframework.zip",
      checksum: "4441ab28ead2230bebbfdad50c19cecfd831ff2858042c79d444b85d98be4e4f"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "552a3b57e9c22d8a0dda6140ebcdcb4a177674686d4043c9ed83d7b559f51e37"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "4d793adee16c15f6619a49f1e93b4f4411381296ea3d7059dbb86d97d18cedea"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "f013dbe321f94feaaf66a05640873b4f0bc3ea134deeaa5b7bfe8b100dc62dc0"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "ac7bd03fe5b699c96d0fe19b5657e25a3593e7ebe4c04fc8f2844c2bf427e4f4"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "49e6b81c38a4cc9d2de87db5405c7b812c7a1e67c22f7171b0869afd0b2cb820"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseAuth.xcframework.zip",
      checksum: "51352edb7dd00b669752859838d985e30fd4301446e53a13318f9313397b52ce"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "6898da6097bce92ec12c186180152ace194c741f36ab30c2be1ce6bb0a04ed23"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseCore.xcframework.zip",
      checksum: "eba91b1f29bc697d1df4acac8877b703d8c26c9b7fde74239534866992e0c2a5"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "1526e156d3f6533f65fba6ff0253ff0d84397627c51cb7eeab76140dda0f0c30"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "c64f3238ac2f4309c0785411583847009bd036497e7c9cf14fd715605efcf346"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "06463ac5f59a1b2f6047217b5eb919af0d1d8c88de63793d6609b923dd2f5769"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseDatabase.xcframework.zip",
      checksum: "5e42c99cbe96975e5b459f5f79f96e53b53797ed306581c9f3c469ec8493efd0"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "e76c4cc3e9420196c1cc7ef554a646d063049bf9a748a98d38cf8bc072dedd84"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseFirestore.xcframework.zip",
      checksum: "32707bec2e56563e794b09a3a6cfaff37a0deb9f04cca57087de1d94facd917d"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "4c225ea793373f7193f2d8edaf44046763f2aea1c7bfd81862df4c0c6c18cbe9"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseFunctions.xcframework.zip",
      checksum: "8895f3c995bde5c75b614a3f65a886bb33207c11ae40d754c4af679d670cba68"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "b339c614d148c39ab22abf2024f8d44e02aa46c398991686177caed5b5211186"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseInstallations.xcframework.zip",
      checksum: "e15e73be7ae617c8ba2532555935de323b19a2162807cfd23ffbd25a81541255"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "d4d2d6748cd8f6fb8cf96a26099af1f87341e889c29d27f55c13f2954c641aca"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseMessaging.xcframework.zip",
      checksum: "4ba2f022a7cf850c328b99009e8e93e9e53d011615f49fca94172806dd85271e"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "db0b567d726a94738e523337f67a1a22a60614485e93a03084bd8b2d07ebfd94"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebasePerformance.xcframework.zip",
      checksum: "a273b44e4d5cafb3da60fdb272ea1abaa97584bc84ab7560f1e0fb6b810c2b45"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "39e271ada447459861b56663d7ed24f5f244f34cf1e2d9bff624b607e910675f"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "39555e5ae8333280962b3e96f0dfb2f85874629206f05dad28c84d9aeaee620d"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseSessions.xcframework.zip",
      checksum: "9c54298a5ad1d72b63a25e0754a4929b746bd495610d7b2e48958de256a38106"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "460cfce4d939167699e65acead44519499089ba718596c12780dcd94a930535c"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseStorage.xcframework.zip",
      checksum: "3e7c9d632487ed189ccbb6a0d8eb2742dbf87976da68dbd07600aa012064eb3c"
    ),
    .binaryTarget(
      name: "_FirebaseVertexAI",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseVertexAI.xcframework.zip",
      checksum: "0a0367ddf228043ec44b0d51cbec0250d780323c916c572012c942c7dd9b63b5"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_GTMAppAuth.xcframework.zip",
      checksum: "cff813c3bce3531c378d75da892ad70b33cc1aa08a2a776182eec7cafdbaa483"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "5a23344bfa71d86c1ce5e0b1897673c66c4e6c0df0c78f276edd7227ad144f53"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "904713fad10287088db70a9b1f37fb2e171306775065e11dda648df3d14fa103"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "eec0b7177445f25ce91df080879e7cb7c996b91ddc077c863d8a505fc5e2627a"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "f4c3cab25812faae91cb81cb7b2f5a4ddf9325cb33d27bde79f092ae9c905068"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_GoogleDataTransport.xcframework.zip",
      checksum: "64b5953e00a6b59d468f7e9db8658537a1ecca7dfa62527a31b5e0656ea2c37c"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_GoogleMobileAds.xcframework.zip",
      checksum: "20828ca34b96f6438bdd51ee6503161748cb4604e8d9dfa3b40028cee163a1bc"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_GoogleSignIn.xcframework.zip",
      checksum: "3868d9c48b3d98162b17686a6458c922bfbc4e0150d8b3e4f26223f527242745"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_GoogleUtilities.xcframework.zip",
      checksum: "86b665c663dade8ecad12b96c250252cf562606ef3d49dfcb1d5b6bc97005192"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_Promises.xcframework.zip",
      checksum: "38cb00550e27f22f319ffaf4e430f47028c40bfba7c5a9f62f7d0b3dcbaa4812"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_RecaptchaInterop.xcframework.zip",
      checksum: "97945b94f9d5b949bb6c4bee8009d72e1da470a755cf40588bf0820e1fc32887"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_SwiftProtobuf.xcframework.zip",
      checksum: "74081faee127390315eb0cc361d25cba2e208ba31a4bb2be7e3f485a3bcc4747"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "d525504bc796aba7e71b2d948d1e167d0948a2ed735a551cb893f1d06a5dc07c"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_absl.xcframework.zip",
      checksum: "ba11767b7314beea2dbca66f37e83d8493900b6a2d63552afa95eb81bc617eb1"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_grpc.xcframework.zip",
      checksum: "656b17e6cf3a66f27132c5b22454af57c77fd595f22c6fc6d311a08951547861"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_grpcpp.xcframework.zip",
      checksum: "48e0e48891f3331cea6740932306de8dac951c5741dc6c636fce9b9fc820964a"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_leveldb.xcframework.zip",
      checksum: "202ef73de7dc6eeadea2479bb29157ae4c0e2de3968d72a3dd33b3eb5d5888fc"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_nanopb.xcframework.zip",
      checksum: "8b0ae6a690baa89860e50bc4eaad9be862f65f80ae153cbf3457ad1711e1b4cb"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_openssl_grpc.xcframework.zip",
      checksum: "99428c3f345a1a7dfc76d30cb0285dd373721e388aea2324701f4b90e6371830"
    )
  ]
)
    