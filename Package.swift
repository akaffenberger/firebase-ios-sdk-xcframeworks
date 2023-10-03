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
        "_FirebaseAppCheckInterop",
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
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_AppAuth.xcframework.zip",
      checksum: "a3b57e282eed01f2c39502863a40cd43f21f70d7e2c92216c447f5ffacd21a87"
    ),
    .binaryTarget(
      name: "_BoringSSL-GRPC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_BoringSSL-GRPC.xcframework.zip",
      checksum: "b480d700043ddbbedf51c139982e32b893abffdffd07fcd4a2889ba6dd0f3af4"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_FBLPromises.xcframework.zip",
      checksum: "11fa84324f2455706e21270da89f9842cc674189527f5236d97ac0fe37454bc5"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_FirebaseABTesting.xcframework.zip",
      checksum: "ffe9e08d0da61e875a8986b9345e6774700f6f0035265266c8b9f9c0f5b34f89"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "feff1c45501df820371dbc8dcd2cb583395a6d57e4d0ab72ea99aef5f59b5472"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "87ac6cc375a2e247cb0228a5e2907a233200924ea476eceb67beae6ab123d3d8"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "6f1de29554e3750a1f2211fb73535af5b80ad86dead195ebd01d698cef43ffaf"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "28cf75670d7b9e32011658bb43aaa0449fab81b9453a509bc74765402bf85369"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "13722e42575536f2a495756d4d77bb663637383d89af3d4b0c153c7ef837ea34"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "30baa314353426b8876d880037c7948af3c8bfa4fb041ee5b7ea874d7f0f270c"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_FirebaseAuth.xcframework.zip",
      checksum: "9f00cade68b106964931788a6809e819f7547345b086ae44398721c391e09ed8"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "72a97347ab97260f20167f81aedc20ce729765fdeff72f94a40f1a763041ee90"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_FirebaseCore.xcframework.zip",
      checksum: "74ffad605bb43906c8a35d100cc71853dc4ee85414fbbb75651b01e3bc5cb9bf"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "45d7fa2253c1d0c37e8fba89b9521867ff87e8198e333940fca560b3c274e1d4"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "79d41c596fbd9eef80e1668bdf32e7d26704e606dd2b00a2a9c1a10f5c405290"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "b8f8be68b79e9e37d25c490ceed90e6786cbd4e8185dc740508b484666015e10"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_FirebaseDatabase.xcframework.zip",
      checksum: "f54f3a1ced230cfc52a850b4686289a89801ce1e91ae864bfe26529c2ee5ffe7"
    ),
    .binaryTarget(
      name: "_FirebaseDatabaseSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_FirebaseDatabaseSwift.xcframework.zip",
      checksum: "c69696bcc9cf725c33a42b3d793fabbdb200d43345cfb8ecadd72963d3df34b0"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "290c1b7e4498d5a0303a9d2ddff9cc8ca1605dc3cf9c5fb5ed668f1174de450c"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_FirebaseFirestore.xcframework.zip",
      checksum: "7e3c331bbd68c00a8bae8978dd995667afc75df5fcc844ca0f321e6218f14831"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_FirebaseFirestoreSwift.xcframework.zip",
      checksum: "dc4de55cf6aaa50b5426a1a77fa6c9712ce64a9a33d2360ce64835f7faa7a846"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_FirebaseFunctions.xcframework.zip",
      checksum: "7cf39f9cd2ecd28bdcc4debdc7b176d20e8b17b58596be375113ae0ef03490e4"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "15e275c307fba60c50d04a3a280ad059d41857b1c04f380d85fc2a3b3ebe9759"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessagingSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "39fe35593e816e09ebf463d5dc21657f3c1df68eb5e75ba0f59e1c49d1798577"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_FirebaseInstallations.xcframework.zip",
      checksum: "adf53f5c02f5cf828938771b28237ed99a50e53f7f5ed0c66edbc067880f9cca"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "bcecf81b388a26d8cdf3f251ba6a173191227a119bb9a5cbe622bcb7e622a031"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_FirebaseMessaging.xcframework.zip",
      checksum: "3af52644683b92a9e141bdcc42f7d482c2d943b823e9f4ff4ba04ac69808ccda"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "c4d1181d3f376f427fbca1220399122d59976af592877d191169d0245ef05cf6"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_FirebasePerformance.xcframework.zip",
      checksum: "d4b663d9e584cf6db78ee37fbac1fa4feec6b2457268c42e2188cb1efba07cb8"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "895cdedecbdaf6343149426f0babbbb8bf1a2df7b298b7143af2206d8b1f874d"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "bee1899e20f6748eb4729136850053651938d5c1f26840be71a6211b6fe0c6ef"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_FirebaseSessions.xcframework.zip",
      checksum: "cde8d2829edca77ccf97333cb88d5732b0b2b65d20edb17a269079cb426cad5b"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "095dc2eab72fecccfd1c78a5f6adfe18bc72424dbceeae5dfb07b7cc32121740"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_FirebaseStorage.xcframework.zip",
      checksum: "1fe47b38d63bf91af3e3157dd936be0ed40297ee71710e760bd7de7a34576e28"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_GTMAppAuth.xcframework.zip",
      checksum: "2b810b50ab693516fafc19cd92025f678bf454b87fb320e1f8b9e9ae9e095b06"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "4d0e5417dc7b13d5c49a97ea124221cfc6402a196411ccc4ebc2f2d71e09f3cc"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "399043e2237eae20e90b7244c87e67a164fbb4c83f65b152588727ad8f800210"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "9e0d37cf8d6b3f30a2da8c3e59bdbcc295a534f0ea9a14aa424f34ad5c14c43b"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "4599cb2f409eb82dd4c647ca658ed7970e0d54f917654fb5ca7b51ab2447280c"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_GoogleDataTransport.xcframework.zip",
      checksum: "8ad6a8b416c5c7d1b9d946977cd9cfef316d82a79ef2c6422b81c90e566f635e"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_GoogleMobileAds.xcframework.zip",
      checksum: "21bc011202724df0468543f2c2941b99c1acceebb68f51ce0485464dee29e2f2"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_GoogleSignIn.xcframework.zip",
      checksum: "70e2c2b8bb274cf508a6aaf8eecd2718dc15bcfc17c7a6606fcacf804f03793a"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_GoogleUtilities.xcframework.zip",
      checksum: "020bb681e43865fec8559df1460fbcae7c9b5493a8997017eb74f3ecc67dc6a4"
    ),
    .binaryTarget(
      name: "_PromisesSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_PromisesSwift.xcframework.zip",
      checksum: "b1d46e40125fe37731b74649a01e29374b0b025d79057bbb42be484a9baf4278"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_RecaptchaInterop.xcframework.zip",
      checksum: "5946f0544dfdb544d51a75154fb4a99cb25c12fe888fb1c1b9191b16e71bd4e9"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_SwiftProtobuf.xcframework.zip",
      checksum: "530264549cf71f2853c3ba0c6b9af12544c6190ed0ac8df51f22c55ba6f2a5e6"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "dcf3c01abbcd7f683feb8f3569102991554a6886910f54ff5f9534f53f4c7a7c"
    ),
    .binaryTarget(
      name: "_abseil",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_abseil.xcframework.zip",
      checksum: "3b3c95c9b021ac6ba85e7dab20fd5660195243adde39974282d37e34d317891e"
    ),
    .binaryTarget(
      name: "_gRPC-C++",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_gRPC-C++.xcframework.zip",
      checksum: "a33d218841b754957387348c31ed74c35ff040c69aa632b9870f3cec14d8d5b6"
    ),
    .binaryTarget(
      name: "_gRPC-Core",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_gRPC-Core.xcframework.zip",
      checksum: "10b510f6dd90893510ddc6511b26fbe9ed39cc87dfbc6182219ebadd1023d58b"
    ),
    .binaryTarget(
      name: "_leveldb-library",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_leveldb-library.xcframework.zip",
      checksum: "6de5234c30b6a990175f205a6fd5c62ba75331c205d1539c7969efc7dd722ce7"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.16.0/_nanopb.xcframework.zip",
      checksum: "93c4defa27ab63dbc320d78efeb67f3a5d731c86cf0173596b939fab459f484b"
    )
  ]
)
    