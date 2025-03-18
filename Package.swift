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
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_AppAuth.xcframework.zip",
      checksum: "b256558ee2d52a6bfe604723b489441e28aae8b4db4d4df6126fef76c032dc13"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_AppCheckCore.xcframework.zip",
      checksum: "b9f0fb82a5023e68a0c219e9336dee2baf3bd1f9668beea79529f48c7951872a"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FBLPromises.xcframework.zip",
      checksum: "80fab2ffcabcecb067167edd4992811db2a3f1b9c6ef6a98d7ecaa6194055f6b"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseABTesting.xcframework.zip",
      checksum: "5fa5311eaec945504f3be423f64157d4e3da11d99f22ffe581713514372bd0d5"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "e1068a1a0a6242f8da377908eec8d5d3dd519d93492e5ae19d11771f7caf8187"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "57eff41129219a7b4240bb46a0c9f62bed537b0dc88433862d5342704a64793f"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "e053f5aa32585fcd29f1c25876938fd8222f7b71751ba6240293cd40bfae5131"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "e3bfe96989a900197811f211ca9145e15bb2433e6d5ca81aa2efd2d8cef4c16a"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "e6ce57ed6cc462c656ae3d6da3f9d6c7b20506ba6957c7b4c446a3511c178ef7"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseAuth.xcframework.zip",
      checksum: "d0068ecda3c2d95f060885807e9705d62d1ac336bfe7732a6be2d6f7d3540515"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "5c404ac474034592704d117d7b90105ebed789c582daac5230b1ba33ae585fd7"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseCore.xcframework.zip",
      checksum: "558d854552c03d374e94b98c044aded169da339e7a0df3eff37ede21d8f21285"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "00f1a6a33226acea2db2cb1abd854930e942f528a4023e07b7aa416827123876"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "538b80db228430cd888127c644eb704cfe46bfe1f71c828e18b3e0536d06f1ec"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "eac034e2c102469f9b321e5e01831399cd4cdd2644cd7e5c18311bd8e35a8128"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseDatabase.xcframework.zip",
      checksum: "96c298806dd4b457c1ba78ccd5bb9eb6acee7059016d7e3ba9e048352ae28995"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "50154196bce545c7501c8ae8b9d208ba415565a3005b08c87224039c86ca7b4c"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseFirestore.xcframework.zip",
      checksum: "da56276a8ad07e9c5595a3f63723bd062d24905353697b9945a01f022b1eab97"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "a46fd2ff6d3c01340ce6477396f58666b169a0a8103b8b5c2388dc4dd9891ccb"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseFunctions.xcframework.zip",
      checksum: "5710578cfa8f6265fde227a7d9f777ca768a6d30eb32237ab2c4fdb43bdda6d8"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "8847d7c1fa91e329c58c76a591c009c834aae7a446e7df9e3dbbcc1fd6e3ca75"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseInstallations.xcframework.zip",
      checksum: "24699385c9abc95353496a12304aeac340e8efb36f680998f713050b4cd11c8f"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "3e89e4b6bfefcc7c4dee670599ea9b168b8c4473c039bc3762e776187bf2be55"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseMessaging.xcframework.zip",
      checksum: "2d2d3e91abfcdf3bcf8f97c4a11ebe91a715cdfa8869122f2ddd1b720b0dcb5f"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "1381ef1aa111f7ff7f9fcb02f63119359537bb85038ff426e55837cd12910258"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebasePerformance.xcframework.zip",
      checksum: "d7d8176e33b8ad21c9418b3e894f22624aba4612c2ee3e215c3e1a3982484738"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "46f984a9252c952c900836dca6fd3d3e0860990f90ec0e5eaa4952cf63527a9b"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "00819eaecf432fcdd80ce2d17efd59fa1f63b91fbc308cf4643e85e0d6ff54b8"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseSessions.xcframework.zip",
      checksum: "91f789d63e9942943da1ecdbf9485c952230116319e6e579352c12485578d78b"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "43691fbe5819ad39bcbf191c0ff33c74a7c4fca75edcdb16b3b8e3781285a068"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseStorage.xcframework.zip",
      checksum: "9418ef1d44e0ac3ab07f3ec6350cdd8776e4b50a95484ae96ca380c799680796"
    ),
    .binaryTarget(
      name: "_FirebaseVertexAI",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_FirebaseVertexAI.xcframework.zip",
      checksum: "3502550ce0c4d32ad8f075f9aab6019c4848a83c09a594ac6a0df57642bb3af1"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_GTMAppAuth.xcframework.zip",
      checksum: "d00f28a88201f8a706c4014479a081530558cc1f91372bf3197dce499870d199"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "37b55a6df92363cb03a2e76f2ae2632675667075b1e51516ff92c45bbff70024"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "5b60e9c471fd3ca2653ff76bdc11ccd11d12d26be9ed70ce1f56a7b2eb110742"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "2f6085bf1acf8394156bc5b816e917f717dff45cadc794fd3f88c0a0ec91a5b0"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "b91fc5963d1f90bf9ead2fa31e0875394124cc62e50ca0ed858c2909163a8189"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_GoogleDataTransport.xcframework.zip",
      checksum: "fef75d54fe06bbe30fee124ff4599a5d5d6fbd2f3dac312da685be1efaa1cc98"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_GoogleMobileAds.xcframework.zip",
      checksum: "4a73a56c7b318dfec5f2585a14dd58bf53855c71c05ae74f583efa289a807934"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_GoogleSignIn.xcframework.zip",
      checksum: "be12d20f0f9b3df020de0522e0bc392c718aa2647ae1a9f57078bda5a1e7155e"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_GoogleUtilities.xcframework.zip",
      checksum: "415978f2db28a2ae7b6ab3d11601bca04333932eec0448190dd455b94b55bb44"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_Promises.xcframework.zip",
      checksum: "e605d6ce44a1904dd3ad4d71ea5e42f32029601a1ea76970927b255c1846d5c6"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_RecaptchaInterop.xcframework.zip",
      checksum: "d68b61d14d1244a3384e89315d3a2b566804fb9c69e0055e1efad2de527846fd"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_SwiftProtobuf.xcframework.zip",
      checksum: "f15020b98aa98f472f18f6c3493202b857fdfa5dab8077313d8bfd0ead3cd592"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "8860712fd8800ff7de27bdae8179b78078431624ee5494f05102979bfbc70d96"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_absl.xcframework.zip",
      checksum: "7881c94e9cc88bc924c2fa16b42523a0fa517423fc70a2fba2e4159bdbd84462"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_grpc.xcframework.zip",
      checksum: "09efd62b455ec13eb2803fb10fe944aa923f25e9bf0a1b931c290b7e3750b52d"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_grpcpp.xcframework.zip",
      checksum: "52df8b1bfb66eff81672b3b16c677a174c6070b99157c5067c5208f523bbacc9"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_leveldb.xcframework.zip",
      checksum: "1ab2ef9193da799bd0fa8d4efd40b28fc70f95d8d6f4dfb5ffb771d6f766b23a"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_nanopb.xcframework.zip",
      checksum: "93a1c90a43b39d8f28e00e87e49feefe16995e5a9b9a997dec497e1f7360947b"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.10.0/_openssl_grpc.xcframework.zip",
      checksum: "58dce1e5e63b1cb2adc2ca7c029f5cad5cd2f7d2c15f015cff7d646b5d0634cb"
    )
  ]
)
    