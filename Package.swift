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
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_AppAuth.xcframework.zip",
      checksum: "06a01849bd16bf6fc939621d98d708917ba73cb7db1e257f3c0cb040837cf057"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_AppCheckCore.xcframework.zip",
      checksum: "9968fcf031402ed51e69bd8ec4656e534711a762caea80d9a972d8ca78532bc3"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FBLPromises.xcframework.zip",
      checksum: "b3febd306e0ea2d8d4f6f39aff8967ee0d4bf5008ec3b07b31a895df5d278fbb"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseABTesting.xcframework.zip",
      checksum: "59792289e05fb80d1e528c3405a42d0fa93c80ccd1c5c892168d52a9d0c5bde2"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "2bb6930568fa420c4c05afa836094ef2ca65eaf7e0b5db48dc3eb4247b53ff54"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "1ce69a691c17c665790d7d27ea1c3e5565eb46bb6eafbe16c3c3eaa8b07e25de"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "fd5b76f66a45027a9669ffaef3c2d1c508ca8d09e35fa0fbb6eeb5c57e52e4bc"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "875257001370553b020772cf578d7e42bad41a2b2c94312a9ac46011dc844d82"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "08b6838252d042643fc139d3ec488cb1d052c832a35030959ab844352d1f9ad2"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseAuth.xcframework.zip",
      checksum: "652d3d463cd2fa2b2c860ec328b397dbe18b607652e462e7fe80c1ddd6ec0a6d"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "1ce53da65096524d7c272ff1b82b0e23d890467d89d1d091a016848e500c0c5a"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseCore.xcframework.zip",
      checksum: "cd5268c4b3735761c0bb615f7ea9d6d470a786d6cdee9409dec085807fb82600"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "a8455e9d925c11f9f89dec5b368e61b156f5bdb93b614797c9fddd79e3700d7a"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "5ee21fecfc066a45217338cd82ed7d5b454bcb8ee51569ec3edc77bee04ccae3"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "4074b656cfa1783c20970101d651792d9c733cb640bd5e0510536cc98a045b68"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseDatabase.xcframework.zip",
      checksum: "985fd378c0437a25fa69f331ea04e542ed45f90c5b63239bb3db46b1994eb5ad"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "4dc1945be27830540991ca675d14864fbbd92a09fd407f5459d5e4f0c7eab7f0"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseFirestore.xcframework.zip",
      checksum: "8fe92ef87107582ca21e6fc07fd9515b7f68df04b17f61b4b1b30e033f1ebcc7"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "62ce5ab70c272d22fde2f165f5b6093deb10d89fe27e2bb4362f9e71513fff9f"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseFunctions.xcframework.zip",
      checksum: "9255869379cbb277b015605f1af327bb294704b32edc685e4ca1742db7352971"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "22024555d38df21ab2267e5cb16b12996f5ed3b0d9e55f795ed84fad4dc62aec"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseInstallations.xcframework.zip",
      checksum: "a1c0a81c8b5a0131116e1940613510c3b4eaefc5cdeffe5c3eacdd3fdff9da5a"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "a694aab53b363c41369a61fb29bd08538ef929edb2f1b1d9208f0b5769ff6a2d"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseMessaging.xcframework.zip",
      checksum: "94b17f694b7fb7775f85a2ec68a22e526c062b6df3051e2439097956799b0824"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "daad71df02e62bae5125e0e8a7a633739d15a68033d0845ae579272235ec1ed2"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebasePerformance.xcframework.zip",
      checksum: "050ffc3303cf403fce79d3f5f573c8392a859ddf243c154ac7743dd2a9171ba0"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "f8e896d78f234604283d649f154d9f5ad3ddb8d2ddec5663f02ce3d8d34229e5"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "a88bc3357ac1e802e0b1e6d7fe83d9ceba83a0897b11e367ea325a80d980a707"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseSessions.xcframework.zip",
      checksum: "dc209a8dd134033683e7c9cf27fc7c42a334408205bfb0abf35ae3768d7c56d4"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "d6c69ca896716e187394847aa724ac9fe7ff6e688d7f79d09aa57434f19d5ab0"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_FirebaseStorage.xcframework.zip",
      checksum: "4d17f0fc2ded9764a5a45f339c92c62bacbfa12afa5e1e45e8af88ee8bb4ab39"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_GTMAppAuth.xcframework.zip",
      checksum: "d534db672be28bd0a5a319926c323c557f01cb69d3ee38b478e7276fb0101b9c"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "c193e929d6bc53d272ea1a5d5a9721cf1ff1a7d5e1cde1e95426f713825b6284"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "7bc9a78005a2aa8042a7cf62d3ed109f5b9f2afab61a65c1e5bdabf76af31d40"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "be5d94e101939952aea64422a18c36010d177b91556f240c85fb0f3ba999f391"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "b5962fbc171b72f0c8842c6fc4cae3588604cf7aa841baafe6a169da16e6187f"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_GoogleDataTransport.xcframework.zip",
      checksum: "508245f6213647148d45f5d002a2f9b8f3227bb0d8e960de202f51fabbf35efc"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_GoogleMobileAds.xcframework.zip",
      checksum: "56672cb4505b6f7513856011da59fb8a21b73efd055aab728b23a182bf3c60a6"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_GoogleSignIn.xcframework.zip",
      checksum: "6212df28c6637008696f6b4d44bd4f1bfb810ea16275db3096705a842e59a201"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_GoogleUtilities.xcframework.zip",
      checksum: "abee9bcb1cedfac366974e5d247d21c20cd4167b99ce1ec7686bd8923251222b"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_Promises.xcframework.zip",
      checksum: "eaa9f4ea6fcc19abccd8c639600ac14892bd4990a06359c647b6bc443d3a358d"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_RecaptchaInterop.xcframework.zip",
      checksum: "5c40e9009d3d1eb44fcb707c38dee02885a68ab7e4e3451b0ce4063e3cd7879d"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_SwiftProtobuf.xcframework.zip",
      checksum: "34c5146b0e96f556573e363b1b2625a902c7f2d4d12704fc30b4bfe30a1bab24"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "dfadf883cb2ca68b41116e82ca3dc4ce1c40107090bdf48a6bf54a1873741501"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_absl.xcframework.zip",
      checksum: "e98d6bc751ae5064b49552a939875277b02a9b38f19c2367d15b1abccd9180ce"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_grpc.xcframework.zip",
      checksum: "55a757fcd85fdfc51abe92f945ac4088bc459310ef7ee1a16552a43ec8f1b324"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_grpcpp.xcframework.zip",
      checksum: "7604daf2d299ea2bf38935b6202c2c642ec8c2098871ee5fc768532987205b98"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_leveldb.xcframework.zip",
      checksum: "e5ab591b0be2a9cc55f5db14f72895eb42bb582da1b5a9e81b09acd3d6024732"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_nanopb.xcframework.zip",
      checksum: "ce20900cdc8548874945c3321d7fb44a5fad283cb62a92dca1f1b0baa8c4a29f"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.0.0/_openssl_grpc.xcframework.zip",
      checksum: "bbed1f793549c0d363f73ef15d8037df208d453f753ee93c3e33ae7fc8529cdd"
    )
  ]
)
    