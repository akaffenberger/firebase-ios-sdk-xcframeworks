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
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_AppAuth.xcframework.zip",
      checksum: "dc0ce1023336ea48ef6d5810cccd97a54d2f3a820ab3c8a6db3a37ebbc896b5e"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_AppCheckCore.xcframework.zip",
      checksum: "7681f189c686a6042ba91b18818fb9c3f237524dbc501086c6b25b056e7bf1d0"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FBLPromises.xcframework.zip",
      checksum: "3e4fe73e4448336325faa87f1c9f7aaffbcb4996fb87113b9f249738ae740384"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseABTesting.xcframework.zip",
      checksum: "46c2bd07b634317354a9666026a544e12363c3515d971175a25dd29c5632d21f"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "856008f7358414137fde14bd81d9abe5a61295de5e061fe909c90e883f85ad46"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "da19c231fa39d7765e2ca44be6f0c9e8641abc4da6ff67cea5fe6e2ff7b40662"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "43862c3ec2c370820f7e7e0e2eee10988d38ef8f2ece22c3b2b394f05fb3fad8"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "60fafbc18d5c5da8fc08f6eb7aa0ad82d0626d8a1331b576c4fb9328a424bc8c"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "d9072bfcc66936e6207085a9b9b243aba1252d728b639ee88481609f4368a137"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAuth.xcframework.zip",
      checksum: "7d70cc3c1228fec27f4f5a30bc550fd82cdfce095706dcbba52e6e6bdcc50eb5"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "4911a689a361ea322c7723980c06cefa94bc2123d949b24bf44cc7eb0a057565"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseCore.xcframework.zip",
      checksum: "ec8d3aedca4fb595ce5d9b6d8b40597ab080e48c4b5b410935f296ba5ab59a6a"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "65e8c08cc7814d0a24c12e5b2202f6f4074d28f29af178d17cc455190e13d68f"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "0d1011d95f066a7aa499b4bc45ae48e30ae405cc177192d0ca0fa72da08f4007"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "75b17f27fa5e7d7f4c43bb32ea037c182d05ae5194c7e14f2df3bdf29d7412d5"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseDatabase.xcframework.zip",
      checksum: "888e3a2e1a2955ed3b85764f4b8ab99d80e9e2fbcf6f03a484bfa769ccccaaa0"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "4bc056288617daa2f2168b89f6665c8e50d87101368605e902c6913957ff4645"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseFirestore.xcframework.zip",
      checksum: "ba2c28574e4bdbe7b77780087095c6614283fe75d740b738a83533ca7f702f6f"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "4346a82e722f6a14be690ed0bc14f12f4c6a61512a0e722478692f0a7bafbb58"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseFunctions.xcframework.zip",
      checksum: "d8f2c2a67774a8d6e76fef438dfae6ad433a14966dc5ab3c22307a125967180f"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "e8af387bf1f4b9c439b4ebb4d585b30669199fe416b4553664da0c2138c4d143"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseInstallations.xcframework.zip",
      checksum: "604bd219c7d28a749f5212e8b52a28a195a1049e957abdb6063815a733b28973"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "986c31232538609295de97b81a046f57dce28855157ca4009f4a1de114a497d4"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseMessaging.xcframework.zip",
      checksum: "2195054ac0a16a67fa2fec1ee9608acf34322b6599ec4d86eb7c1ef6531cb9b5"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "70c303dadd7e20d947bf6d6387ac778f2e937f2cc1714490048641171af001c2"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebasePerformance.xcframework.zip",
      checksum: "a5730b9e59bbe464f27a88171dee21bf7af333785fde373ce8f91313a2cd03b6"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "2fa1164881075ef4cd10ef0641c08cce70f48612303ff788ac0acd5ed8171101"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "8781a99d21877ff1ddea6fca8a4372c99398f065dbb293e9ee12924860f9ab48"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseSessions.xcframework.zip",
      checksum: "054c16f920733a03a35df959a37f4ab3c7933817c49b4fd322f72b72b39be8fb"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "81613da6d8d3d05b5a68d6486fc68bad4756af651c22c304eeb61f0ae0f8e4e4"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseStorage.xcframework.zip",
      checksum: "e7a8a3c2019c35eeedab5076b554177521d1703ab7f8021a0c0af78415399cb9"
    ),
    .binaryTarget(
      name: "_FirebaseVertexAI",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseVertexAI.xcframework.zip",
      checksum: "ad886da245615bcdb22b540934327b25a5f27f41747e419149c9e49f5c66257f"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GTMAppAuth.xcframework.zip",
      checksum: "b7576db7e3210157261a9b715b7d9387239869943cd4ad80cda8d3102b0548a3"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "c0f02e197f45609637af793d609a2da711d51aed92a1e926336a06afd774c17b"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "e5f0008569062886ff0c076a51bb1592ca0ec603f912aa03f330ce1ffcfd4103"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "29558b3a901527332dc7ceb2c829bc6d245ee748f3062120ca20f0ca6e9281a0"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "3bcb85b73d85aa94bc917f3d316e63aa0d62d7e8246a49737fe67412acd6b7ec"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleDataTransport.xcframework.zip",
      checksum: "7a03ce50bf4c8a379f115bb051b2c84afd44836f67e61ca74e08aa7fe4e316d2"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleMobileAds.xcframework.zip",
      checksum: "849262123d8e7a5621458505e63bbd03228c929b1748deb05587094a26ee5edc"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleSignIn.xcframework.zip",
      checksum: "be79bed6f3fe269d528551823064b877f4538d4e687ca8463d17e8b0db4db174"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleUtilities.xcframework.zip",
      checksum: "7c2a16b3b919f4395fe25785fde9a2336990db0c5748acb269a2723a9d84e498"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_Promises.xcframework.zip",
      checksum: "dc28ebe87bb9e59ed6fe13a4d0cbeec4ec68450af6ab87000b0e141d1037c9f7"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_RecaptchaInterop.xcframework.zip",
      checksum: "4ae8838c5c74098cd899f126b509d2b002b6d63b8be8e8c4e24b1770bc25feac"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_SwiftProtobuf.xcframework.zip",
      checksum: "96665f63ea60e6a9cf2627a6a1e261a61fe82c7d7c3458199547b4adf3b8d237"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "e384aa81250c858f260f92860245a0a0df01e18017d96e2df8528038fda6feeb"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_absl.xcframework.zip",
      checksum: "04e9018f5fee09e298645d221227ea5f6910e83f03e77ca8558741cdc0ac0e3d"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_grpc.xcframework.zip",
      checksum: "83e47433ab9fa4c821d71fe98d53370009617fea6d31a4e78e7d0671a66be0a7"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_grpcpp.xcframework.zip",
      checksum: "9471898c48c7ff1196ed0173496906594d5cde58a612f55aca5986589fad759c"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_leveldb.xcframework.zip",
      checksum: "27d3ca9ae3614c31fa3b35aed89c6d7766a0bdac2c58e719fb5118384d24a2dc"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_nanopb.xcframework.zip",
      checksum: "d886d44f37db2c31cde10d9f60d94dc2d835ff7dcc90b115c4f335fc507d38fb"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_openssl_grpc.xcframework.zip",
      checksum: "86004370f0a14c948b111b38175cb234a96db3bfc5642a14cb4a6e75ac6c45bd"
    )
  ]
)
    