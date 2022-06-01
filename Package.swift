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
        "_FirebaseAnalytics",
        "_FirebaseAnalyticsSwift",
        "_FirebaseCore",
        "_FirebaseCoreDiagnostics",
        "_FirebaseCoreInternal",
        "_FirebaseInstallations",
        "_GoogleAppMeasurement",
        "_GoogleAppMeasurementIdentitySupport",
        "_GoogleDataTransport",
        "_GoogleUtilities",
        "_PromisesObjC",
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
        "_FirebaseCrashlytics"
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
        "_FirebaseFirestore",
        "_FirebaseFirestoreSwift",
        "_Libuv-gRPC",
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
        "_SwiftProtobuf"
      ],
      path: "Sources/FirebaseMLModelDownloader"
    ),
    .target(
      name: "FirebaseMessagingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseMessaging"
      ],
      path: "Sources/FirebaseMessaging"
    ),
    .target(
      name: "FirebasePerformanceTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseABTesting",
        .target(name: "_FirebasePerformance", condition: .when(platforms: [.iOS, .tvOS])),
        "_FirebaseRemoteConfig"
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
        "_FirebaseStorageInternal",
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
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_AppAuth.xcframework.zip",
      checksum: "e58a08a160f1c94064ff4131d0041976d4fe9c286e8712cd0836c36507ca3e1c"
    ),
    .binaryTarget(
      name: "_BoringSSL-GRPC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_BoringSSL-GRPC.xcframework.zip",
      checksum: "558c9f77e64eae91ab23eb137dc813da276c786c79d35a7db08f469b59f9a24c"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_FirebaseABTesting.xcframework.zip",
      checksum: "b779cee413e7f7d82238bb525eabc74c5e9e96d660ac4c054587d0bab4cc2e1f"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "4ec39f736092d4fe559c4f37d3709a38e94b702bc6fa5ad89cba66372f625e90"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "15551285d04256720a3e6c854e9e368b8b776628c1564c04ae7c85c076013018"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "b2efa51ad75386d43e6a09a57bdc1aa054330e20d093feab0ebb4930ba5a43ff"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "687ba45bf4cb561ff126ca2e0b2d1d47ca3a99b9e7941d5022640f15d4fcf3a3"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "81ae24c69a4a3ed43f02a5f71ea0fecd42e941e71b6daafb96c9b0c135345cf6"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "5355e4feb40c00125e0cbdde6fe750e018f293d2c72a1c0ee78bc39686c4086a"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_FirebaseAuth.xcframework.zip",
      checksum: "5eab020aad0795e2d0bba8033981159c0eceed472a26a7bf125cf14b3b3c8e19"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "cf08aa4ee4e83b1c629ac0889e4c2c639cde9b05c3e813e067ebd1c898126455"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_FirebaseCore.xcframework.zip",
      checksum: "66fbf5c60d9483695443f93ee227384ebe0f5b8af3ea07465a832ed56bbfaf2e"
    ),
    .binaryTarget(
      name: "_FirebaseCoreDiagnostics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_FirebaseCoreDiagnostics.xcframework.zip",
      checksum: "30ec1d15b811b55cfefd333988569cd7fde9c8e33cb49d3bf6e28379ba6fc07b"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "3858ccbbf6efd61ea8fe01222659ef63ce7fa0d1c82de90dd74a299368210572"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "d85f2ad644d0b5b07e5c04de352f381ae5e089a8cc84933eba04f12e178a9fb8"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "b8f811b1584ab820930264e63fe900fda1b4ec5926928cae4d8e55c19b008ddd"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_FirebaseDatabase.xcframework.zip",
      checksum: "2f5d2fa58509fa5ba37e810f9c92f5843ca5f6937a6d41cbefac1135a708772b"
    ),
    .binaryTarget(
      name: "_FirebaseDatabaseSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_FirebaseDatabaseSwift.xcframework.zip",
      checksum: "566c9e2be2a2b644477e0656ef743c303ac9c3c2da0ad9308ed330ff4bcc2b1c"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "b87abd4d27840f2c8d46fcf88d46edb8d78f74df6f9db300365e249177f41f28"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_FirebaseFirestore.xcframework.zip",
      checksum: "d241df24d4413d54e0cb7def8ed74d1ccfe879857092fe7eefb96b83cf01f127"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_FirebaseFirestoreSwift.xcframework.zip",
      checksum: "ea6b0556aa31998a89c9edc59a1df2ba613b2bdc5f6daf90221162e00859241f"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_FirebaseFunctions.xcframework.zip",
      checksum: "0088b01a4b89921909dfb2244c60b899a3b0ed08dce9da398b85076e5a51458d"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "c7e40573c04224be0d8f2b1a6538305b1db8babc3dca1cea0e17a79926ae5ca9"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessagingSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "01056f5c15f96dd4f51feabadf938210726fd5cb1018071de9c1f55f6f0c827c"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_FirebaseInstallations.xcframework.zip",
      checksum: "56ca9426f883ee64ac4bc1fb5330aeecf5e138bd4d26fe2131c415cabdf9749c"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "6960d4336f32233a2d22bdaeec1d0f19556b9920cd28a45ce27cdec63ea05178"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_FirebaseMessaging.xcframework.zip",
      checksum: "4b59a26004c55b913acd70b6c270edd48c9530e3e14fd103c0e116558fe4c988"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "7295406654922a463de10fbc68d3a501f4fa1043c5be6d3caf2e117a4ddd21cb"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_FirebasePerformance.xcframework.zip",
      checksum: "5f93a6bdc7cd52807b645039d8b9f0248f70477acf2b3d0b1222a45f9b5fc54f"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "72847d34a18ce9b1d642346e42c2c1f0bec2cc5b9eae68fe912a492722a1ef8c"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "1b29d3df243c858adac2a8162397109617bc44a0d821284c5c8db41aa6a227fb"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "b4d833b2243b3ad50bd18afb1029d1168d8f6c8801b2b0b1ed4c94acc8e49ffc"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_FirebaseStorage.xcframework.zip",
      checksum: "22df3d87c71cbe9dc3ccc7210f5d9e945f93a48d71a2fbec2b09f84c033725c7"
    ),
    .binaryTarget(
      name: "_FirebaseStorageInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_FirebaseStorageInternal.xcframework.zip",
      checksum: "09443fd47689a87cb91009c218674b893b7523d61f0bce81a765ab7198a9ad0e"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_GTMAppAuth.xcframework.zip",
      checksum: "21785b50d7f4b180e5f233f554da0c845e7b8cf6951254612e98c6ab98d207bb"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "63d7b353a8c3c1d4cb4f12aa53b9c10a875e3948e22890c0f283cbe14678aa20"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "460e93bdd7a14d06885a01f19963a826744a70cb79df2e236ebb4cdb65fd98e0"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "5d8e385d193b58a75da2117cbd02f0d7e8af0dabc477c3da2961cd5285a77966"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "a7266c53459b93f2ce3f06a554e8603ab21f47d53c6210925a388daf585751c8"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_GoogleDataTransport.xcframework.zip",
      checksum: "53800d499950088ef705381264cd0e9f9406ae8ecc3838540235e39a280a4ddf"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_GoogleMobileAds.xcframework.zip",
      checksum: "f4379c37dfaa27827ba217a325b9fead87ad419147c0fab0d0e13e52cbfd33bd"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_GoogleSignIn.xcframework.zip",
      checksum: "88140e3a890a6166efbd916dcb9527cf3124bce31599ebe2c5e6b343872f2c8f"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_GoogleUtilities.xcframework.zip",
      checksum: "d45d7bce0cfa0842213dea23b44f6153fa43949d5d5c5de150ef3017db04648f"
    ),
    .binaryTarget(
      name: "_Libuv-gRPC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_Libuv-gRPC.xcframework.zip",
      checksum: "63f8b79015730ed20fe6ebbc2b64324a12f91c7aaab10fc7c6fd1f765aa2687c"
    ),
    .binaryTarget(
      name: "_PromisesObjC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_PromisesObjC.xcframework.zip",
      checksum: "64614f07de443a5ce08051c22db45ee6a62902e99cb53b67c11c15b693fcc79e"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_SwiftProtobuf.xcframework.zip",
      checksum: "14a9236272a696dad1a989141db79f8e131002561eba74ae4ca488343bc2a338"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "cd025e2090e48c47466502ec133ac1908a4323af263195a18204b749534d93be"
    ),
    .binaryTarget(
      name: "_abseil",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_abseil.xcframework.zip",
      checksum: "6fb6c03a7fa36d205b4594b4e817fb1933380e8ef354136ca58de3e8de893ebc"
    ),
    .binaryTarget(
      name: "_gRPC-C++",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_gRPC-C++.xcframework.zip",
      checksum: "8de477c529c42c38e064e6902fdbd27fbeecdd6fac93f65d1c32d368856901cd"
    ),
    .binaryTarget(
      name: "_gRPC-Core",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_gRPC-Core.xcframework.zip",
      checksum: "39b8827399008ceac9d45242574b826d64f55ce597a1508796ce50f8d0376cb1"
    ),
    .binaryTarget(
      name: "_leveldb-library",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_leveldb-library.xcframework.zip",
      checksum: "62cfb7432d8d33be0092c885a8044530d7abead5ef1d4969f16b3988e645dd1f"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/_nanopb.xcframework.zip",
      checksum: "ce7fa8f81181154bacb975e2be35a0770f496faa79b9fac01ecddc63ba5741e9"
    )
  ]
)
    