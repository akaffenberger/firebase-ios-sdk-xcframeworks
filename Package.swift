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
      name: "FirebaseAI",
      targets: ["FirebaseAITarget"]
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
      name: "FirebaseMessaging",
      targets: ["FirebaseMessagingTarget"]
    ),
    .library(
      name: "FirebaseMLModelDownloader",
      targets: ["FirebaseMLModelDownloaderTarget"]
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
      name: "FirebaseAITarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAI",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension"
      ],
      path: "Sources/FirebaseAI"
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
        .target(name: "_GoogleAdsOnDeviceConversion", condition: .when(platforms: [.iOS])),
        "_GoogleAppMeasurement",
        "_GoogleAppMeasurementIdentitySupport",
        "_GoogleUtilities",
        "_nanopb"
      ],
      path: "Sources/FirebaseAnalytics"
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
      name: "FirebaseFirestoreTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_absl",
        "_FirebaseAppCheckInterop",
        "_FirebaseCoreExtension",
        "_FirebaseFirestore",
        "_FirebaseFirestoreInternal",
        "_FirebaseSharedSwift",
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
      name: "GoogleSignInTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_AppAuth", condition: .when(platforms: [.iOS])),
        "_AppCheckCore",
        .target(name: "_GoogleSignIn", condition: .when(platforms: [.iOS])),
        .target(name: "_GTMAppAuth", condition: .when(platforms: [.iOS])),
        "_GTMSessionFetcher"
      ],
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_absl.xcframework.zip",
      checksum: "6aaf2eacf78f9b3cdbfae82890eb12ee657dc7b0d572e1f91abe548f1b257e38"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_AppAuth.xcframework.zip",
      checksum: "1896f63c1a8c8aae3f503f33a312dd9bd1a230456fcf4bf8a58f737d2bba1b3d"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_AppCheckCore.xcframework.zip",
      checksum: "aaf26794f7d3c1116b340b594c323073b57f5e1cf86230616003aa26c0b76627"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FBLPromises.xcframework.zip",
      checksum: "5aa1eaf48fa49f6e1cccb99d6e6f516cc36f769f6fcf2b3d00a23ab50abe375c"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseABTesting.xcframework.zip",
      checksum: "c9777a7bdfd20808e8ab5e910b6bb8b535f4c4b4f926a079dd28ead6ab16b13e"
    ),
    .binaryTarget(
      name: "_FirebaseAI",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseAI.xcframework.zip",
      checksum: "63eac790bd7f0bb1d3ed8e3ef0b831a734d4d01177b7d308f29cc603f7b3ceb0"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "fe2a2a9e56c95c39af217266719c56ae6ef7fd57ca6ce2feb9b281eec67d9e39"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "9412837842dddc989589978e698486e1c7c51f672149517efc94563cc9066672"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "6483ed855e091c05d448ef37a7827204caf4d87a6798da941414dc27b5762f21"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "f3cbb8701c744b8e5a5ceaca6d2d73b36f1f06260f97b09a367bb5469054944f"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseAuth.xcframework.zip",
      checksum: "09d4689e3b0910e405120168dbfd8ea28885769f434b739bfb8a022026537eae"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "154a1cbd996023ae9fcd4ab1e4b53e30c27b5d50547cbcab1006107984997ab7"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseCore.xcframework.zip",
      checksum: "cf0acbaf22b073c73816e9538e7cd7e1c7e8ce24e34d336b40ccd9d7fa9a0ef5"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "16de93206806d50cb1805423f873d315dd70463a98066213014f9bc0962cf2a4"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "fc46423111f89e9cf736d7797ad884fa6c3f2bdc2aa4d28ca6c79a351225a7ab"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "7b80a46aeca0ce2aa9b16f595c5fc979f3c35fc85b5d9a3494d359f99eaefcb6"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseDatabase.xcframework.zip",
      checksum: "8eeffd82c4948f5fa63a946a127ee1dff7ada0265064436514d5157f3dbbdd4e"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseFirestore.xcframework.zip",
      checksum: "6633d087290a52c934d1dafb46b512767d72eab83ad0c1d88c51d623faf37bb6"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "d2b45176cf9b76c5bcdedac85f0836fdcda7381ff98baa5c24d4438090bc80b6"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseFunctions.xcframework.zip",
      checksum: "b843d2adc9e326154633304a18dcd1df5d4dcef2adab5cea4317292fa9a8ba73"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "55923d66946f2a38b3d62f1dacba56aeedc1a38a80f38aad0e04bc50b627be51"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseInstallations.xcframework.zip",
      checksum: "2336eb8b84e9221aa503886ffaf91c8a3c80ecfe8da3df553b3485bf3dbf966e"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseMessaging.xcframework.zip",
      checksum: "0995cde86a0de4be97cc63efa11cda7bd921117dd167f9228571c1ff13304386"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "74b8bb594602d931c010a46d67e0c5638c472cd364da57df72402bf62a07c13f"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "3be2cc7aea5d78cb6f2194625aeb48601ac3ad97ea1ca95957c296e2d21123fb"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebasePerformance.xcframework.zip",
      checksum: "d1b44a85a04d4c61d200f67f4c70e74534a55a3b7dda4347c6859590a0f08059"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "8f0ef65724052a8ddb31ab7ac139baf035ed7638118a999377e54c6047df7029"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "bf270ff9876d19dac99e910d35fcaef11881bd996172717e5dae736efc83e148"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseSessions.xcframework.zip",
      checksum: "5a16e75652b2f3d9af39c4fac4877e8619e00d37251b55641bdf64a7a1f513d6"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "fe7fc3acf1f806988b0220431af2a53ea4748d6228972c73de899cc99f97a919"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_FirebaseStorage.xcframework.zip",
      checksum: "cd4d88a9235532659737174aa491f8afd0e353408999a9f894805cbeef4f5d2f"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "72b03072eb5d14827be810ed7473804921126da4b0aab76670c7496c04ec5264"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "a52f189cd5d8d25ee6b6f1cb1be93afc7bca04800ad9dc121c33a9275ca23e3d"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "1076572b1994cad0a311da7f753329158548544c8c81e16935cb52ea9b351c4a"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_GoogleDataTransport.xcframework.zip",
      checksum: "94fb92f7ef175332c06b414f70e18ad5302159d860de9093eb098e5eaa519dd4"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_GoogleSignIn.xcframework.zip",
      checksum: "09419e9a6cdc536cabf8b85a37c5ab07d8f4a1aee62ffc1b10f8eee7ad87f768"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_GoogleUtilities.xcframework.zip",
      checksum: "e55873944b8ed6a0970282b9882a16cc31cf38ef781193a7cb90640ae57b7648"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_grpc.xcframework.zip",
      checksum: "950fe17147e86f9a4dfdae8a8cda0843833314ed9099c175c9b551d16d3e0da6"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_grpcpp.xcframework.zip",
      checksum: "ebb2bdd89fe9c4e21819bf858ac3003df8cbc6eb6c79b8d1bf28379ff7adca6f"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_GTMAppAuth.xcframework.zip",
      checksum: "5953247de14ec2d6bb6e84b7847dc918ecf763efea6927c29dbb561519b4f296"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "8ea4eae916f42daf59bf0dc57b0e75fd1a316578e17abe4a3f748673df7d8b47"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_leveldb.xcframework.zip",
      checksum: "b0cd6ba33bf0bd9a398c51b95c1312d80a8d27a5db63481ed311ea7dab908a44"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_nanopb.xcframework.zip",
      checksum: "7df9e5f62eb530f1d7564c51663186be341bfbb5bb0455eaf57d0ebd8ca569a0"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_openssl_grpc.xcframework.zip",
      checksum: "e5844d509f45efc8b98fb22ee8d96cecabc06eecdfd5483a65e0d281d14116f4"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_Promises.xcframework.zip",
      checksum: "caf4645c9c4b506abf1c6d39c9c65c6a4a3c6798393c663bba43c3497a968e9c"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_RecaptchaInterop.xcframework.zip",
      checksum: "ffa82cd956518280c2ee942129a843f9430b64d8274c599b1e9b5e2de002abe5"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.4.0/_SwiftProtobuf.xcframework.zip",
      checksum: "3d6cc64cd53e7951461db436a38925dbd5ab32456db54e65409abb3fc31c38a1"
    )
  ]
)
    