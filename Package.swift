// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Firebase",
  platforms: [.iOS(.v11), .macOS(.v10_12), .tvOS(.v12), .watchOS(.v7)],
  products: [
    .library(
      name: "FirebaseABTesting-force",
      targets: ["FirebaseABTestingTarget"]
    ),
    .library(
      name: "FirebaseAnalytics",
      targets: ["FirebaseAnalyticsTarget"]
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
        "FirebaseABTesting"
      ],
      path: "Sources/FirebaseABTesting"
    ),
    .target(
      name: "FirebaseAnalyticsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalytics",
        "FirebaseCore",
        "FirebaseCoreDiagnostics",
        "FirebaseInstallations",
        "GoogleAppMeasurement",
        "GoogleAppMeasurementIdentitySupport",
        "GoogleDataTransport",
        "GoogleUtilities",
        "PromisesObjC",
        "nanopb"
      ],
      path: "Sources/FirebaseAnalytics"
    ),
    .target(
      name: "FirebaseAppCheckTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseAppCheck"
      ],
      path: "Sources/FirebaseAppCheck"
    ),
    .target(
      name: "FirebaseAppDistributionTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "FirebaseAppDistribution", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAppDistribution"
    ),
    .target(
      name: "FirebaseAuthTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseAuth",
        "GTMSessionFetcher"
      ],
      path: "Sources/FirebaseAuth"
    ),
    .target(
      name: "FirebaseCrashlyticsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseCrashlytics"
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
        "FirebaseDatabase",
        "leveldb-library"
      ],
      path: "Sources/FirebaseDatabase"
    ),
    .target(
      name: "FirebaseDynamicLinksTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "FirebaseDynamicLinks", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseDynamicLinks"
    ),
    .target(
      name: "FirebaseFirestoreTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "BoringSSL-GRPC",
        "FirebaseFirestore",
        "abseil",
        "gRPC-C++",
        "gRPC-Core",
        "leveldb-library"
      ],
      path: "Sources/FirebaseFirestore",
      resources: [
        .process("Resources/gRPCCertificates-Cpp.bundle")
      ]
    ),
    .target(
      name: "FirebaseFunctionsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseFunctions",
        "GTMSessionFetcher"
      ],
      path: "Sources/FirebaseFunctions"
    ),
    .target(
      name: "FirebaseInAppMessagingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseABTesting",
        .target(name: "FirebaseInAppMessaging", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseInAppMessaging",
      resources: [
        .process("Resources/InAppMessagingDisplayResources.bundle")
      ]
    ),
    .target(
      name: "FirebaseMLModelDownloaderTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseMLModelDownloader",
        "SwiftProtobuf"
      ],
      path: "Sources/FirebaseMLModelDownloader"
    ),
    .target(
      name: "FirebaseMessagingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseMessaging"
      ],
      path: "Sources/FirebaseMessaging"
    ),
    .target(
      name: "FirebasePerformanceTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseABTesting",
        .target(name: "FirebasePerformance", condition: .when(platforms: [.iOS, .tvOS])),
        "FirebaseRemoteConfig"
      ],
      path: "Sources/FirebasePerformance"
    ),
    .target(
      name: "FirebaseRemoteConfigTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseABTesting",
        "FirebaseRemoteConfig"
      ],
      path: "Sources/FirebaseRemoteConfig"
    ),
    .target(
      name: "FirebaseStorageTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseStorage",
        "GTMSessionFetcher"
      ],
      path: "Sources/FirebaseStorage"
    ),
    .target(
      name: "Google-Mobile-Ads-SDKTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "GoogleMobileAds", condition: .when(platforms: [.iOS])),
        .target(name: "UserMessagingPlatform", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/Google-Mobile-Ads-SDK"
    ),
    .target(
      name: "GoogleSignInTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "AppAuth", condition: .when(platforms: [.iOS])),
        .target(name: "GTMAppAuth", condition: .when(platforms: [.iOS])),
        "GTMSessionFetcher",
        .target(name: "GoogleSignIn", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/GoogleSignIn",
      resources: [
        .process("Resources/GoogleSignIn.bundle")
      ]
    ),
    .binaryTarget(
      name: "AppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/AppAuth.xcframework.zip",
      checksum: "088a17d0b66dc6e176b96cd1914b82a5db25111f9cf79122ce4615c70b6efb9e"
    ),
    .binaryTarget(
      name: "BoringSSL-GRPC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/BoringSSL-GRPC.xcframework.zip",
      checksum: "fd382e9f0978773ce36c0e9396db1fd9ec4d001162641e155e32cf02a456924c"
    ),
    .binaryTarget(
      name: "FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseABTesting.xcframework.zip",
      checksum: "3a912168825442b1c6803d1e9378ea54869c3646a329701a2a9ce00125d4e447"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseAnalytics.xcframework.zip",
      checksum: "a669996888713ec5368abb8efccc3c61902d64137cb06a3c2588f5be7991537c"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseAppCheck.xcframework.zip",
      checksum: "5b0f467e60d2fe00ea70a6b99fc64dc0436d4c4164b8ca884cd08df6078dc9fd"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseAppDistribution.xcframework.zip",
      checksum: "b7291889b36c40a9ca27e6a4346cf936a332fa7d7cee0b515233b7183cc16966"
    ),
    .binaryTarget(
      name: "FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseAuth.xcframework.zip",
      checksum: "49d0a7d0455d1ce56d6d378bbb52304c646a761650e926f58a89047cdeacedf7"
    ),
    .binaryTarget(
      name: "FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseCore.xcframework.zip",
      checksum: "36c6d509c07e66df84a3a930379cb7ebd9f98d8e200f3cfa171a28d7c1cd8e1c"
    ),
    .binaryTarget(
      name: "FirebaseCoreDiagnostics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseCoreDiagnostics.xcframework.zip",
      checksum: "00f9fb1e63dfcb16864a74cc2fccef0e1506a2281c8b781168ebabe8f15f5b92"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseCrashlytics.xcframework.zip",
      checksum: "2a47c825f5b46ba949f95cfa501839f28d7d0880fcde5019fbcc170406d698ea"
    ),
    .binaryTarget(
      name: "FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseDatabase.xcframework.zip",
      checksum: "b824c61495016d8273beecdb9a8f728fcd7c0a22e2b83e0cdcecf47c6762b07d"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseDynamicLinks.xcframework.zip",
      checksum: "ef52c1bdf86bb76b56f32d86018aa57e4bc30cfc891fad329a8cf7e06302389e"
    ),
    .binaryTarget(
      name: "FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseFirestore.xcframework.zip",
      checksum: "c679754d6752cee6a8962c2e180ca1a25a874fcb2714b14af3bb46257161bd00"
    ),
    .binaryTarget(
      name: "FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseFunctions.xcframework.zip",
      checksum: "5cadd139d2da47e6958b1d2c1043bd034426152515216afa5e7d6d3da169f13c"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseInAppMessaging.xcframework.zip",
      checksum: "69d59dba4049ec8aaa638f42458c8dcc1acb6ee9c86f2c6402c06c234bd2b7ec"
    ),
    .binaryTarget(
      name: "FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseInstallations.xcframework.zip",
      checksum: "a3f734cf48ea283580e41bc64d85eb76879430a330f2e3135f515c60afee9bad"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseMLModelDownloader.xcframework.zip",
      checksum: "99c9b71848054f803414516c36a853128eaf5547012f69c9017bdfe45ac09085"
    ),
    .binaryTarget(
      name: "FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseMessaging.xcframework.zip",
      checksum: "e81fc3528ef2f9aafccd20b37e2551cf798269b57318e4276e1fba269aa1e636"
    ),
    .binaryTarget(
      name: "FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebasePerformance.xcframework.zip",
      checksum: "bb4c4819d11503894b823344cf3e362e27b423baf42787b66c90245408278e44"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseRemoteConfig.xcframework.zip",
      checksum: "25ed2ab8b6d426735b72a76c6ebf5089b2046f461029c1505e083e6e08574862"
    ),
    .binaryTarget(
      name: "FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseStorage.xcframework.zip",
      checksum: "477b7d9665b6982906f2abbb72ac361de5ec147e40cecd78a84868bfd7407a17"
    ),
    .binaryTarget(
      name: "GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/GTMAppAuth.xcframework.zip",
      checksum: "0fc7842b0e0b1d71869153b806cb8458966294dcf6d86f0cb37457447539b6c8"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/GTMSessionFetcher.xcframework.zip",
      checksum: "446de6e420510f67cd0965ab77fb61b343b12cb8dff0fe5df3868895628b0887"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/GoogleAppMeasurement.xcframework.zip",
      checksum: "e276a1881d5ce9b02ada91b0f173d52873a9346a9ce43ebbbd91fc1780b9b88e"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "42d26c7f7c1b7af6039458214772da0b182f3ca14c4529e309da801cfd09f7d8"
    ),
    .binaryTarget(
      name: "GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/GoogleDataTransport.xcframework.zip",
      checksum: "c54968b0e2f90d9aeac04cf7fd0b9ebd6504a59573b0f17bae82f8d12aafd921"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/GoogleMobileAds.xcframework.zip",
      checksum: "1696c0ef01baa6f03e125d1863e5bbf1aa13dd8a15086038424774901e550b3d"
    ),
    .binaryTarget(
      name: "GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/GoogleSignIn.xcframework.zip",
      checksum: "2074d773c2081067196f1cd2a541f9f2fad44e0cd4ad6b6596963deac93a6700"
    ),
    .binaryTarget(
      name: "GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/GoogleUtilities.xcframework.zip",
      checksum: "82305cdbebc85f468ceb1ae28eaa7d22b4f90a8a774fa655e49531f1430e7c3d"
    ),
    .binaryTarget(
      name: "PromisesObjC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/PromisesObjC.xcframework.zip",
      checksum: "f21c3cd50f9363b7543875373139c9ffef807ba0c6604f98fc65ec6d2a2b28e7"
    ),
    .binaryTarget(
      name: "SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/SwiftProtobuf.xcframework.zip",
      checksum: "b0d9b7123a4a0d1fcf5492c835438ddc8e795052098f3b47cedc6949d386842c"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/UserMessagingPlatform.xcframework.zip",
      checksum: "187c4f42d25a4def2a73bdaef63000e9edcf3843637c2dba93be0bf58a6a0111"
    ),
    .binaryTarget(
      name: "abseil",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/abseil.xcframework.zip",
      checksum: "c1ce56d1bd215c17efd0c23ae355c358dc5d5b9a281b73456445bc91d510588c"
    ),
    .binaryTarget(
      name: "gRPC-C++",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/gRPC-C++.xcframework.zip",
      checksum: "3351a199f221cc49b180479d2855abe657e49eb83047df731a98a9832c4548bc"
    ),
    .binaryTarget(
      name: "gRPC-Core",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/gRPC-Core.xcframework.zip",
      checksum: "5541b6c8b39bfb07bba5bf1d082585a63126795da1c2ffa81019fcf215274b25"
    ),
    .binaryTarget(
      name: "leveldb-library",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/leveldb-library.xcframework.zip",
      checksum: "bf1a444855e5d603c6e93c4fa9f61a26786833b89cd58840a94a163063ae4b00"
    ),
    .binaryTarget(
      name: "nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/nanopb.xcframework.zip",
      checksum: "5685fa3462ab70f0b946f112983a647363695fcb1dd305d696cb6a0b885e7415"
    )
  ]
)
    
