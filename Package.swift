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
      checksum: "2af9a381008ca39f677eb00f6ce41e4e6a02dd2c0a87b42ae0f4f67f94b76c39"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_AppCheckCore.xcframework.zip",
      checksum: "ba985270ad2631686bf52184e7aa4b447d33cacab72e268d9fdc15803f06e354"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FBLPromises.xcframework.zip",
      checksum: "81fbba5fe9c5ae4497506d8f003a5ed4540a220b204822d44de3c9d959c8290a"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseABTesting.xcframework.zip",
      checksum: "b1cad9b951ecf53055ee83bf4783c3d0492df7ab76a4382dea1e47bb20899cdb"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "c65bef97dbc1e9e7178826e79025e31bbda65b65c889ba77f6596f374b9f2eed"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "265230ae0fd5f7762a51a2e24496269df25a414451ee2e52caee014cfc0e1a5e"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "b11cf676e7c3d83b1529e1c4d16b423db91dbd529a5ff7f3f9795570b4cf12c7"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "1b75f71cee32613cd085d3745602a9580964c28f14440deac8aae1520f86a6f8"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "039a292d5b86840b3256554e1f1dd0c1c8cb1d8db922132f35e5cdd7f8ccf2a4"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAuth.xcframework.zip",
      checksum: "39be1c6ae046651e4ee8dc8094e0e605344be55d2407618f011d2a4d00ce6839"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "7a80b34dd89e624b24a8077f20fd4549b720c16969e033e4dad5947c82a53a99"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseCore.xcframework.zip",
      checksum: "c888f05a722536c8e3ce7a3d54165ecc1a039292a54b5d43965c8540789f4358"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "13f326aaeb2fef70b297ebb72d614ade80291f5420d059518c9d414025709801"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "6b31d3a814fa279865a284d106623376f6a1935e3f6f4f772dfe28a4d7f3b5e8"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "e316204f03286cdceb8a0e7c0c8d667b916f8acf61c028647448c0060cf62c8f"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseDatabase.xcframework.zip",
      checksum: "c46b6b4bc5a16cc0d55828e6259f1fc82f3613716f2386cc57db22f77082b672"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "1202dcf16115ca4b077fe30aef728b42499e6e101ae87541e83bc8d0eabd4b8c"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseFirestore.xcframework.zip",
      checksum: "bd7222e2ab41627bfa9b012d8c1f4d5720e420df831108b7c85cfe753541a0b5"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "1e945dd96e247166c16207dcd69b0c9cc49d8b9839607786e1af6ee579ae4c26"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseFunctions.xcframework.zip",
      checksum: "9772ed96db7aefa39a5f301f3fd0bfc887de91d3b61d49319de23287d6a22248"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "c4e004690221bc3cfdbf9b5f986f826776c52f3d93a8d3d1b7a05ba509756b7a"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseInstallations.xcframework.zip",
      checksum: "ebba1db65d4b2b0df61b01dab0466a661f699a4027d2be87b9c2ee7dd5a441c0"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "f9951ac9d98ae4b15ab017404a75bfe0de8a65614bef9dcc312bd4f6381a9326"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseMessaging.xcframework.zip",
      checksum: "addff09f1d6eb0a88efac5e74ad9373fe32299adcabfc669afa15fe88d38dd78"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "ed252b0fdb62029606722c69ed6faf513263dfa38f4d6200d0daab9a5ad6fbf5"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebasePerformance.xcframework.zip",
      checksum: "ad877c0c92e55e7dd700dbbb51182b093471194b062dcb1328625c23abbc5722"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "c6ad5efa2866cf6348459443f69d925d8180d26a5223b9668e6409a94a06f84f"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "29c94d393c92327479149b057f1cf528217cdf1062b9afe2e462f34ca87d48f0"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseSessions.xcframework.zip",
      checksum: "ab01befc7ddb49fc953dc76e1284794b23171c5a58de0b0a973ba512268c0804"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "3e00835146782cfcd710862d5e169702678a292a3e94dac673f10506a8e78ec0"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseStorage.xcframework.zip",
      checksum: "1dd8e70e4e8c50144b68277ac62541af9b629a4717498a4aa256fbcd72722674"
    ),
    .binaryTarget(
      name: "_FirebaseVertexAI",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseVertexAI.xcframework.zip",
      checksum: "7324270b9631c599541803a6baac4588b81afedd4007637aa5760a3d31e9f9f7"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GTMAppAuth.xcframework.zip",
      checksum: "dca7337f9cde059de4a538bc22ceffa83b84aa5cbac312a3c00418ad1c4b1e8c"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "5dddee19adc7d902f26f73ba31d634a2741e6010736eeafb1a790cbd6fee4947"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "4816a03558a1ee537026df1b98396910002d97e23e18b290fb1093feb9864369"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "59bff58179426ffa63d950287b02a22d55db2fc9498fe6f04b90821e87b4ed65"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "3bcb85b73d85aa94bc917f3d316e63aa0d62d7e8246a49737fe67412acd6b7ec"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleDataTransport.xcframework.zip",
      checksum: "e8ac911772bdbf0a023ecd69a648984904dc5164b6eb161b41fd1bd2df5c57aa"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleMobileAds.xcframework.zip",
      checksum: "b13c7363623d88b517e01297173350ba0da33919a43d42b0bcdca752d6727065"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleSignIn.xcframework.zip",
      checksum: "cbb14964e145f19052e9911c25e2ffb8df8a424e51167b0f5a2e43a258a8ddb8"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleUtilities.xcframework.zip",
      checksum: "4d31a071eb493d45e78741d8d1e80fc715751ba2ad5e6d49e9a94e6645d2acc3"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_Promises.xcframework.zip",
      checksum: "80b87d32c046e3c41c40ce118a57da7f357ef66d772964e15522734672636457"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_RecaptchaInterop.xcframework.zip",
      checksum: "51d13638b775253dc3a53c7d61f389c6423084c508d5107d969c2d2cb29edb65"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_SwiftProtobuf.xcframework.zip",
      checksum: "9c2ae92bb6f98287f345f1c9a27eee307950bdda1de61eb1a6e15e6e9012ff80"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "b6020e90171f575fc5df28f3bb5e239e3582b965183b3151e475f2e657efdc24"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_absl.xcframework.zip",
      checksum: "9f0fd04c0dc05acda250e68723814f143cefa4af3caade3ef1272cbbf03619bc"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_grpc.xcframework.zip",
      checksum: "deeece6b2244f78f6702aad674cf51ae969ae465260b3ef91454a131a501ff96"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_grpcpp.xcframework.zip",
      checksum: "9e11a57fab7d50148854a65c51cd538978bdea8c12f897481ce99ede37ec83e0"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_leveldb.xcframework.zip",
      checksum: "e4697623a24fb0aaf50e8b13cd26a73aa8a651bb2c1d0c52878663cf442fe4b2"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_nanopb.xcframework.zip",
      checksum: "f8a3dce8b07fbe9e6a7027c47b72ff08782e6df1b55dcbca349ae6314ac9eefe"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_openssl_grpc.xcframework.zip",
      checksum: "1b0542016fcf7e515df321795d80dd3e4c5a4cb07790ae7feaef29f58a4569a1"
    )
  ]
)
    