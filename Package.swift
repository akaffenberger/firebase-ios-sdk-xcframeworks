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
      checksum: "5d111b5fbdcc9f6e67ebc94fe4402fa0bea7195d49f5b0e8f3d6d59f6952e51c"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_AppCheckCore.xcframework.zip",
      checksum: "706674c40fb2c16652fc15175681b9ae10ab1cc4a815840fae69e075ab2307b1"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FBLPromises.xcframework.zip",
      checksum: "8441417cc7ed1212ba60958a20973e68f0fa95d9553e3dd0463cc44825ef4921"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseABTesting.xcframework.zip",
      checksum: "a2a0b5c9f7816f580cd4bf760797933d0e33200b89ca192ff23cf4357bdfba8d"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "a6a83728911f10083fa95cbd5fbbf46a2b0d60682d3ad79b37fb46d72d9a02fc"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "6aa936f657025acc6f91089c17f9f6fa0df57a393d566d8b3bea42c96adeaeeb"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "659d660c20c19bc1b8850eaa7dfd9e5801fee53b056220627b0d4897f8a29a9e"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "b5738b29f1dc67efe12341d7f6bf3dbb0f442720a1c9db85685d96cb44fba5b3"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "5653337b2385294544e7490df8d7f36b045578d2c193b85a0eec5d7cc373e0d4"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAuth.xcframework.zip",
      checksum: "d2abb7f79b8eab8f2fb989bf028fc1a4a49e7f1f3664c7ee737c2fa1870e1056"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "bc8aa15428def2bac0dd8439cd735c551cac8df278d45f7b6ea0dc8025e9f6c0"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseCore.xcframework.zip",
      checksum: "5811a8dfb30e8aa70abe3a5993e8da8c971c61af9c6bcd9b125055b8ec4d5347"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "2356853f1414b1bae68a148c9bbad45ddd5cdae8822049672704ee998aa3cbbd"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "c5657ff244ecc9c205233756250b873107d829f8941610d4114ce5b1b6712a72"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "c98435333be30f1d2529fb062328b9de3145b0bbc51298a3d03ee77aa9ee7bf2"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseDatabase.xcframework.zip",
      checksum: "a0dbae2eaa64fa173ed3688cff9aada21335a21e0613ffaf33f8da6b09217a46"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "45db0dd220509f3e83950ba5cc3519ccd9aa8108e55452f751f066041c46fae2"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseFirestore.xcframework.zip",
      checksum: "02a5f15a2f9d7472becdafdd291a078390c83af627196660e7472485ecaa8275"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "89fabb5ff8d93d6c461186aae9eb5be5c2eff40849d8650b70888326207b3e39"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseFunctions.xcframework.zip",
      checksum: "0a6278e4a647df046c9b8808e6642fc8502649e438eb3635e31ac01193270f77"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "88ce5c0b03de61b7aba5fe14db9ad445c77763a87dc22856b258fd263c539e96"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseInstallations.xcframework.zip",
      checksum: "00d6ed336369255cd8e7d41ac9fd44df962b926a36f1c1b8943b32cf167c387d"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "71c925358950b280c2a5e2fb897d6534a02f90669eb53c08bac3d9e6e73e5184"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseMessaging.xcframework.zip",
      checksum: "0918098944d2f22bcd3008ab4be2d1d7b4a6f3d7ff016c638140b962d9ff9ba6"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "c7ad055b0a6e49256fae1b37b702ebc682e8454e4126dec98e704d5e1befbd58"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebasePerformance.xcframework.zip",
      checksum: "b935e2b3894a98c0fdc37e5b395fc497d46defb9eb62f900c4ec5947cd05fcd8"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "9554a711c4c18bae838b1e903513e714f50591d2f1f84fdfb20fdd8114c984a8"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "5123f796097cfe05b2f6ba2692ad47fb04c6efcff8e35914a6619f44c4a9f223"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseSessions.xcframework.zip",
      checksum: "62fced892eb3c0fa16339015e7b5bdb31bc60ddad43a05104e4b9b6a66ac430b"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "ed778339f5ffa8099e0854e8fd45d2d6e134364a94202f1477dbcb6fee8cfba7"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseStorage.xcframework.zip",
      checksum: "a1fe1f275a7387578048a7a1883ad938a205c97076ec3a16e20a0408b7ae39a3"
    ),
    .binaryTarget(
      name: "_FirebaseVertexAI",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_FirebaseVertexAI.xcframework.zip",
      checksum: "31b3988eda47063affa8e5b38da2acf1e293c6bd945aa80792f342593b1e49ea"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GTMAppAuth.xcframework.zip",
      checksum: "d458106fc82e21c5d1f752eec42d6adf1851a994722b062a5de8bb65b12c6259"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "ff2a10fec69ed3373ef0b34a605022386043f91c29fa21ea73f5e570ee533b63"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "e0afdccef70fc5b7fa2cee56f09bf8ece6b92e640a9757c4e4b9bcb7b395f831"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "3d8ea976957cd019775af9ba2d95a0b34f560bc0edb2f843b01741834ac21b82"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "3bcb85b73d85aa94bc917f3d316e63aa0d62d7e8246a49737fe67412acd6b7ec"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleDataTransport.xcframework.zip",
      checksum: "ce066cbd2aa8008cbe2fae78ac26b8c56165605ec3d8c2a11d4d45558a1cc771"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleMobileAds.xcframework.zip",
      checksum: "0df39ffd1240d497e7649517542111389f29af66d1d2f14c9b0b8b95bbb154a7"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleSignIn.xcframework.zip",
      checksum: "163362d110aee2f4dcd9e6587fa4234ba13bb6f898861b06eb09221c1f0ec6f9"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_GoogleUtilities.xcframework.zip",
      checksum: "01e8fae18d041b43209361919edb0f5d8c41256a89e603a5ec6a0c70e9fa740b"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_Promises.xcframework.zip",
      checksum: "6264a6b479fe8d2935c05a99b92a82483f8178940204b5d9e1580b3d362003c2"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_RecaptchaInterop.xcframework.zip",
      checksum: "0565b9286b4607aa72318d4d5556ded332d20be52a162adb34e3471ca06ae77d"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_SwiftProtobuf.xcframework.zip",
      checksum: "968bbde939cdb5ffb1007f4868fe7be297ce2e35c60d837a987f5d21e4e32149"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "78dc82963083e2ea4393681a8a3ffbd2a93718d545333afb1aa720d1412b0f3f"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_absl.xcframework.zip",
      checksum: "170c49091b289d3a3aac5b9992ca7f9f9ed5725f7a7da516722858d15df35836"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_grpc.xcframework.zip",
      checksum: "06c8604200a188f17a778e7be7b6bac3178cbc763cb30d8947fbfa90d2fa356c"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_grpcpp.xcframework.zip",
      checksum: "1e9144ba463e040ac5b949123ed09bdf36eabd4b189efe0d13060be8b3865667"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_leveldb.xcframework.zip",
      checksum: "69aa70f0b879798d86bad9898608a70a6ba202a1b8aa546d628f144be95c30dd"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_nanopb.xcframework.zip",
      checksum: "7f09ceccd615a44ca724be9a37cf708988a3f9f1e2b7a3c8d6d6acbad363dede"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/cricut/firebase-ios-sdk-xcframeworks/releases/download/11.6.0/_openssl_grpc.xcframework.zip",
      checksum: "db42ef76cce4f2599a8ea5f8237ff485806846db58ccb89759d57445337144cc"
    )
  ]
)
    