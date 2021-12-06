
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
        "FirebaseAnalyticsTarget",
        "FirebaseABTesting"
      ]
    ),
    .target(
      name: "FirebaseAnalyticsTarget",
      dependencies: [
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
      ]
    ),
    .target(
      name: "FirebaseAppCheckTarget",
      dependencies: [
        "FirebaseAnalyticsTarget",
        "FirebaseAppCheck"
      ]
    ),
    .target(
      name: "FirebaseAppDistributionTarget",
      dependencies: [
        "FirebaseAnalyticsTarget",
        "FirebaseAppDistribution"
      ]
    ),
    .target(
      name: "FirebaseAuthTarget",
      dependencies: [
        "FirebaseAnalyticsTarget",
        "FirebaseAuth",
        "GTMSessionFetcher"
      ]
    ),
    .target(
      name: "FirebaseCrashlyticsTarget",
      dependencies: [
        "FirebaseAnalyticsTarget",
        "FirebaseCrashlytics"
      ]
    ),
    .target(
      name: "FirebaseDatabaseTarget",
      dependencies: [
        "FirebaseAnalyticsTarget",
        "FirebaseDatabase",
        "leveldb-library"
      ]
    ),
    .target(
      name: "FirebaseDynamicLinksTarget",
      dependencies: [
        "FirebaseAnalyticsTarget",
        "FirebaseDynamicLinks"
      ]
    ),
    .target(
      name: "FirebaseFirestoreTarget",
      dependencies: [
        "FirebaseAnalyticsTarget",
        "BoringSSL-GRPC",
        "FirebaseFirestore",
        "abseil",
        "gRPC-C++",
        "gRPC-Core",
        "leveldb-library"
      ],
      resources: [
        .process("Resources/gRPCCertificates-Cpp.bundle")
      ]
    ),
    .target(
      name: "FirebaseFunctionsTarget",
      dependencies: [
        "FirebaseAnalyticsTarget",
        "FirebaseFunctions",
        "GTMSessionFetcher"
      ]
    ),
    .target(
      name: "FirebaseInAppMessagingTarget",
      dependencies: [
        "FirebaseAnalyticsTarget",
        "FirebaseABTesting",
        "FirebaseInAppMessaging"
      ],
      resources: [
        .process("Resources/InAppMessagingDisplayResources.bundle")
      ]
    ),
    .target(
      name: "FirebaseMLModelDownloaderTarget",
      dependencies: [
        "FirebaseAnalyticsTarget",
        "FirebaseMLModelDownloader",
        "SwiftProtobuf"
      ]
    ),
    .target(
      name: "FirebaseMessagingTarget",
      dependencies: [
        "FirebaseAnalyticsTarget",
        "FirebaseMessaging"
      ]
    ),
    .target(
      name: "FirebasePerformanceTarget",
      dependencies: [
        "FirebaseAnalyticsTarget",
        "FirebaseABTesting",
        "FirebasePerformance",
        "FirebaseRemoteConfig"
      ]
    ),
    .target(
      name: "FirebaseRemoteConfigTarget",
      dependencies: [
        "FirebaseAnalyticsTarget",
        "FirebaseABTesting",
        "FirebaseRemoteConfig"
      ]
    ),
    .target(
      name: "FirebaseStorageTarget",
      dependencies: [
        "FirebaseAnalyticsTarget",
        "FirebaseStorage",
        "GTMSessionFetcher"
      ]
    ),
    .target(
      name: "Google-Mobile-Ads-SDKTarget",
      dependencies: [
        "FirebaseAnalyticsTarget",
        "GoogleMobileAds",
        "UserMessagingPlatform"
      ]
    ),
    .target(
      name: "GoogleSignInTarget",
      dependencies: [
        "FirebaseAnalyticsTarget",
        "AppAuth",
        "GTMAppAuth",
        "GTMSessionFetcher",
        "GoogleSignIn"
      ],
      resources: [
        .process("Resources/GoogleSignIn.bundle")
      ]
    ),
    .binaryTarget(
      name: "AppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/AppAuth.xcframework.zip",
      checksum: "74db211eaaabbe1b0073a04522d510b2c3ca48c8d75533eb0783cebbcb32e30c"
    ),
    .binaryTarget(
      name: "BoringSSL-GRPC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/BoringSSL-GRPC.xcframework.zip",
      checksum: "7497c8d9b01c0a788fa00f5bc7cd17af7e378339fc786d9f38cc9655e6156b14"
    ),
    .binaryTarget(
      name: "FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseABTesting.xcframework.zip",
      checksum: "f35b94ed1a4bdb8fba8f7836745fe66e05344532fc0c485efe4d6991d8a2a227"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseAnalytics.xcframework.zip",
      checksum: "a6addc62f4008dc9233b3406d44a96d90bc97756f4e9b046c8004a93ff186b0d"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseAppCheck.xcframework.zip",
      checksum: "7d6a5ab501a351c6d61fe5987e2767723d7249c2c1d94a0425a9a4d59bc2b340"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseAppDistribution.xcframework.zip",
      checksum: "507b239f96efb8462cb98de43a389cb6526b11dff6012de6a7a08b0f20210708"
    ),
    .binaryTarget(
      name: "FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseAuth.xcframework.zip",
      checksum: "7c3d1fdbe8213d2848678a97e6f4663b2adb65cb5585e81fbbf6dd435c1d3492"
    ),
    .binaryTarget(
      name: "FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseCore.xcframework.zip",
      checksum: "c7194243fea6acb188636a3b0e4f9f6662c95fe31672a33a3d96abb5dc47d289"
    ),
    .binaryTarget(
      name: "FirebaseCoreDiagnostics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseCoreDiagnostics.xcframework.zip",
      checksum: "e166772c2ded320defc1d296cba57ff5af105f0327470af77604533fb43e2449"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseCrashlytics.xcframework.zip",
      checksum: "ee1d3367732685c79da6049da11266b5f56e6a07e975e8bc82fc393828c2363a"
    ),
    .binaryTarget(
      name: "FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseDatabase.xcframework.zip",
      checksum: "d20e4928598d4f684ce505ffb10ac4b595e148771c22d783cb7078d9601b731c"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseDynamicLinks.xcframework.zip",
      checksum: "aa17b2fbcd200b5307cb50883ecda5c1d625db1949293a8b1755d5353b51918f"
    ),
    .binaryTarget(
      name: "FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseFirestore.xcframework.zip",
      checksum: "2078e7f141e459750a6914135419179801d3cda6b57713c7607d14c6d4eb40ee"
    ),
    .binaryTarget(
      name: "FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseFunctions.xcframework.zip",
      checksum: "7951850abe370626ab4307599a698dbb8572fc0cf325177e979288225a5b1d5f"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseInAppMessaging.xcframework.zip",
      checksum: "f392b89cf9c1bc7e1070c7436f93571b9ab59d060a0a3e75e541eeb4ec994565"
    ),
    .binaryTarget(
      name: "FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseInstallations.xcframework.zip",
      checksum: "542310a284d6dc39dabf3f63729d079ab262d134d5c4239482eb08ace4fdc9b9"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseMLModelDownloader.xcframework.zip",
      checksum: "0e887a488aae49a43cdeda4ef669c3394b5a62f2cfa683dcb8f8b7dc628b197a"
    ),
    .binaryTarget(
      name: "FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseMessaging.xcframework.zip",
      checksum: "3273827a8089a3e3bf3e6f0839333823866d77bd8286d38bbc8b81411b8bc1fe"
    ),
    .binaryTarget(
      name: "FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebasePerformance.xcframework.zip",
      checksum: "d8cfa42c2ce02533999486b289ba81aed4fb2deedc16280633bbdf230a85e5cd"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseRemoteConfig.xcframework.zip",
      checksum: "0c6264edd6a6957f544c77434eb0e172d263d2c868285fd942c4d61860bba59b"
    ),
    .binaryTarget(
      name: "FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseStorage.xcframework.zip",
      checksum: "b5877ab60440bf68577b4764342a9ce930f2e2aaf16be41ed68dc88021d95b7b"
    ),
    .binaryTarget(
      name: "GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/GTMAppAuth.xcframework.zip",
      checksum: "dbd4648cc2aad9261dc34a045ef0134ef9d6fc854344e1ed785b6d2b79b85f56"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/GTMSessionFetcher.xcframework.zip",
      checksum: "23d93c430386c0b6dd9a522ae95b2a71daf44ee476e11a11a66e0bf68c346c6e"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/GoogleAppMeasurement.xcframework.zip",
      checksum: "fa44e4610e8a1d7dba091a263f4265f73771cd85a429f6dbb5b53f659e3a3288"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "6f2c563307f42eea01d76c1b0bd963f0b53ce191b554cf726c96857d5d97ed55"
    ),
    .binaryTarget(
      name: "GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/GoogleDataTransport.xcframework.zip",
      checksum: "987ae9026470bb3c025446bc556d9a5fa347eed8439a8ed9b1a8dd19a745ee04"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/GoogleMobileAds.xcframework.zip",
      checksum: "26bcb4a27922512e8e3b145e67db0936a9426abc4f1eb8ee6327414ac696405e"
    ),
    .binaryTarget(
      name: "GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/GoogleSignIn.xcframework.zip",
      checksum: "c2fac01cff07a1e7a157b060377e8207c562c296278208da92037845860ce1f2"
    ),
    .binaryTarget(
      name: "GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/GoogleUtilities.xcframework.zip",
      checksum: "f46a3faf513b6b6a008e77077130820aa83da3a62ed6cbe5a634c3fa9f5066ab"
    ),
    .binaryTarget(
      name: "PromisesObjC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/PromisesObjC.xcframework.zip",
      checksum: "d5b7d408c2ca11611aa9ed2b0f6a08f67c84f1ead260cccc4fd5ab50a319e192"
    ),
    .binaryTarget(
      name: "SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/SwiftProtobuf.xcframework.zip",
      checksum: "e07e4757563bae489d7dce753ce6702c90d88ed829c4e55f30e6ee9f72842ebc"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/UserMessagingPlatform.xcframework.zip",
      checksum: "2836ccb9d1f7b338f60450030238915110d0d93d1db2387d4d8bb6dda60aab5f"
    ),
    .binaryTarget(
      name: "abseil",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/abseil.xcframework.zip",
      checksum: "f7b9eb4c4ef2b835ac982650c3983b705705306d59666f7bf8debc86427614b4"
    ),
    .binaryTarget(
      name: "gRPC-C++",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/gRPC-C++.xcframework.zip",
      checksum: "8d4993208f757a2d43f712961d0866d73fc0cc92538b348a0741b8e6e90ac1ed"
    ),
    .binaryTarget(
      name: "gRPC-Core",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/gRPC-Core.xcframework.zip",
      checksum: "3ee6f48835aa0350099737704df151727c28e0b36d23018233a6d5555fc415d8"
    ),
    .binaryTarget(
      name: "leveldb-library",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/leveldb-library.xcframework.zip",
      checksum: "5f90e95ba2e09b2f2c50e4de729865e98c87bddacd3c8906cee77a092265b0ff"
    ),
    .binaryTarget(
      name: "nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/nanopb.xcframework.zip",
      checksum: "531d7275115f4fa2651ded8d5f5ff3807ab2758463616eb441f6b7d548c97286"
    )
  ]
)
