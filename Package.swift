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
        "FirebaseABTesting"
      ],
      path: "Sources/FirebaseABTesting"
    ),
    .target(
      name: "FirebaseAnalyticsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalytics",
        "FirebaseAnalyticsSwift",
        "FirebaseCore",
        "FirebaseCoreDiagnostics",
        "FirebaseCoreInternal",
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
      name: "FirebaseAnalyticsOnDeviceConversionTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "FirebaseAnalyticsOnDeviceConversion", condition: .when(platforms: [.iOS])),
        .target(name: "GoogleAppMeasurementOnDeviceConversion", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAnalyticsOnDeviceConversion"
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
        "FirebaseDatabaseSwift",
        "FirebaseSharedSwift",
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
        "FirebaseFirestoreSwift",
        "Libuv-gRPC",
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
        "FirebaseAppCheckInterop",
        "FirebaseAuthInterop",
        "FirebaseCoreExtension",
        "FirebaseFunctions",
        "FirebaseMessagingInterop",
        "FirebaseSharedSwift",
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
        .target(name: "FirebaseInAppMessaging", condition: .when(platforms: [.iOS])),
        .target(name: "FirebaseInAppMessagingSwift", condition: .when(platforms: [.iOS]))
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
        "FirebaseRemoteConfig",
        "FirebaseRemoteConfigSwift",
        "FirebaseSharedSwift"
      ],
      path: "Sources/FirebaseRemoteConfig"
    ),
    .target(
      name: "FirebaseStorageTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseAppCheckInterop",
        "FirebaseAuthInterop",
        "FirebaseCoreExtension",
        "FirebaseStorage",
        "FirebaseStorageInternal",
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
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/AppAuth.xcframework.zip",
      checksum: "4e94abed2707a28ccc97c411c13c3c9cabab452371ea88004c98377be8f45e3c"
    ),
    .binaryTarget(
      name: "BoringSSL-GRPC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/BoringSSL-GRPC.xcframework.zip",
      checksum: "b25dd59bbd416b8823c8219af8c7ab75038f7798557958a7d8c0c32f7140c268"
    ),
    .binaryTarget(
      name: "FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseABTesting.xcframework.zip",
      checksum: "9f0731b4bd3f1240f94fac943fda613350f18444118db5d76ab72a04ee2be697"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseAnalytics.xcframework.zip",
      checksum: "185ed7b69445f93b1647031b3e2c45f70c33f5968aa0ea5a717fdeb6e65414e3"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "f1a67dab427c0709c471a4e59d76295baa6776ec935b52e7ad7b29145428cb83"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "ac620645ff44c822821e0e4a29f820bf25ceaaa23effefd75e2cfe9dd284744d"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseAppCheck.xcframework.zip",
      checksum: "c84bb894e7f08b824906cb0f9b7b4c0acab6c84b31df633a97553fd5c5848d6e"
    ),
    .binaryTarget(
      name: "FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseAppCheckInterop.xcframework.zip",
      checksum: "a8ed7f8f395e8dd909b9f5e44a279c9b518d89ef4d1d21c7b631db198db2d57e"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseAppDistribution.xcframework.zip",
      checksum: "3ff69ffaa41576f805d3880b19eed66023c1e4ff8834baecf11d4f316b508264"
    ),
    .binaryTarget(
      name: "FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseAuth.xcframework.zip",
      checksum: "02cb42b6cee5bd34c5d83da3b777987395276e630dd1f7e93670cfde37fcedf5"
    ),
    .binaryTarget(
      name: "FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseAuthInterop.xcframework.zip",
      checksum: "5033d6e25dffb0052dd851b6596d92d6d948cf04d2d990551b8f75e8032ba3bb"
    ),
    .binaryTarget(
      name: "FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseCore.xcframework.zip",
      checksum: "f4e2791739548db131bf21f4aa5054d160794173135b1faf7b66bbb0cbf82c08"
    ),
    .binaryTarget(
      name: "FirebaseCoreDiagnostics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseCoreDiagnostics.xcframework.zip",
      checksum: "69f4399933c8c73c9dc44eef86e7f1bc439bb6c3a8a9ed04b9856f3bd68bbda6"
    ),
    .binaryTarget(
      name: "FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseCoreExtension.xcframework.zip",
      checksum: "d98667b6dad64310dcdecd8304e5a06d4b5d5bd7d6c3814465f2624062a7ac51"
    ),
    .binaryTarget(
      name: "FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseCoreInternal.xcframework.zip",
      checksum: "2391cac85ee676be000960bfa9931de22b79f5e3a2801ce500ad01ad7ba458c3"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseCrashlytics.xcframework.zip",
      checksum: "de904d8145f94dea974bd8fd65877a69017fae4e5d4500cf9b66d4be1b47564e"
    ),
    .binaryTarget(
      name: "FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseDatabase.xcframework.zip",
      checksum: "88d550706195d2a7ca1dabd26f6215789e2b2992680e99aeb1102788ac849c5b"
    ),
    .binaryTarget(
      name: "FirebaseDatabaseSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseDatabaseSwift.xcframework.zip",
      checksum: "c71488df92f37f4b317e73841da2c80198bc356d499ec11e27f669b9ef934a6e"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseDynamicLinks.xcframework.zip",
      checksum: "eace115e1ad8d82c1981d2df407bdd893742557bf69f11062687537e89c42e16"
    ),
    .binaryTarget(
      name: "FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseFirestore.xcframework.zip",
      checksum: "7fd772fd7073354dc32abbe9e5f653c2a8c7f1adbc16614080676da809b0be61"
    ),
    .binaryTarget(
      name: "FirebaseFirestoreSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseFirestoreSwift.xcframework.zip",
      checksum: "0123b32657b58eecc815826a60e144139fedefa637cb9a32570fd7eb08856db4"
    ),
    .binaryTarget(
      name: "FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseFunctions.xcframework.zip",
      checksum: "42a51ca9e9cc8c01f2d2a56ec9683d9f32142a6b08da140bd66d56a1bb8c3894"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseInAppMessaging.xcframework.zip",
      checksum: "774cb137c993960facd3c712751786067aed94a8fa7f311504ead4f1f0c2ecc2"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessagingSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "81786d364d683f8787d9c08a90bb980237189338cfaee3d1ad47e13b3e9d7846"
    ),
    .binaryTarget(
      name: "FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseInstallations.xcframework.zip",
      checksum: "10812878766d0c2aa92aab378330cb7a436aa81c9f1cc4fbb0d4dc95e645d380"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseMLModelDownloader.xcframework.zip",
      checksum: "fc1b2d7b17c00e8e1c36f28a3e1741e7eb2071b50b4e0b8605f84533afcf3b78"
    ),
    .binaryTarget(
      name: "FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseMessaging.xcframework.zip",
      checksum: "8007ebdba19fe9c80f3cefe328d012c7afcea8cbf022d6c78c62c017f3b74021"
    ),
    .binaryTarget(
      name: "FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseMessagingInterop.xcframework.zip",
      checksum: "c19d49702b5449c71183f2871b9132d43072ca9b2c43e1fe3f62734e4127901c"
    ),
    .binaryTarget(
      name: "FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebasePerformance.xcframework.zip",
      checksum: "d1b03cfb0a7a226ead0bda99f0a4a031f09f0b71ed52db5fdd9dfcfb475bb7a4"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseRemoteConfig.xcframework.zip",
      checksum: "c639ecde187ac805efadec7ace258ac050fbda4f3931fa0b05bbc32686e2bf8a"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfigSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "b487b4a9552966f42d53226ec2b112ffe0b5951b62c819ad3c34f1ede8ce997a"
    ),
    .binaryTarget(
      name: "FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseSharedSwift.xcframework.zip",
      checksum: "b851678f2dc6e4ad9973f7c69270962fc9ffece878ace460635f6e69fd5a64b8"
    ),
    .binaryTarget(
      name: "FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseStorage.xcframework.zip",
      checksum: "f38d9ca3e4d819f9e2765cd7c00d362620d1abd3688796493ac1340823a378ce"
    ),
    .binaryTarget(
      name: "FirebaseStorageInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/FirebaseStorageInternal.xcframework.zip",
      checksum: "3c7804f07971ef728e52d3f30937e831648979d682e299a2e49da6e05d0a8303"
    ),
    .binaryTarget(
      name: "GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/GTMAppAuth.xcframework.zip",
      checksum: "5629bcbf49d12ed6aeca8a6e3e86eba46455d3c1bba424088d48fcfef2e01418"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/GTMSessionFetcher.xcframework.zip",
      checksum: "cdde7f9436730a6e00fa88e2edd12cb5668468ecdf066c7ea174931b7debb8c2"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/GoogleAppMeasurement.xcframework.zip",
      checksum: "cb1d0c71de5f1cf2a39942ff0f8ec2a0f0ce9b331f976bc626315165d9b6f32a"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "d85ae72e121aa2d5cc09dfe4fd78f0298781981ce33fa789200ab90e7aa272bc"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "5642fd7eeeed7f8e9ce809dadfc5cde66f69c5fc92778f10181886abd02bc5b7"
    ),
    .binaryTarget(
      name: "GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/GoogleDataTransport.xcframework.zip",
      checksum: "c6edcb4dd7f1a7a26365025adb7251ae164806768dde6f79a494e4d89418c39c"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/GoogleMobileAds.xcframework.zip",
      checksum: "336954a4f5b0ccbf9e7c3b7ab42a47d0eef64d21ccc2d31f35d56625cef6ecf5"
    ),
    .binaryTarget(
      name: "GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/GoogleSignIn.xcframework.zip",
      checksum: "208bd4fc7664b388bb85746578f8bafafbdad39797013334e4fc479c21021c0e"
    ),
    .binaryTarget(
      name: "GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/GoogleUtilities.xcframework.zip",
      checksum: "38f4bb6b37d8efbb56dbbc305efe0e61489d7caa9af387c7d9934d551b03462a"
    ),
    .binaryTarget(
      name: "Libuv-gRPC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/Libuv-gRPC.xcframework.zip",
      checksum: "df74dab94d26aedc742ce74527e2c6c35bdf38525d01c2ea2baf82683945aff8"
    ),
    .binaryTarget(
      name: "PromisesObjC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/PromisesObjC.xcframework.zip",
      checksum: "56f02f2d8ae8f8e72f4487c2211becb7a7aaa3f24b8b40a1eb5e20992141fa47"
    ),
    .binaryTarget(
      name: "SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/SwiftProtobuf.xcframework.zip",
      checksum: "ee81b74d8193a38fbe6cef72f0e698c4a8437ad43d898afae3c3c885c5cfcc4b"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/UserMessagingPlatform.xcframework.zip",
      checksum: "4d1d02a4916430882a7b5ebbbd18526580881f94db9421d71270cf622e85b10a"
    ),
    .binaryTarget(
      name: "abseil",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/abseil.xcframework.zip",
      checksum: "31ef693666267b2e9ad5ae14d786d45d14313b49d7a3ac3d113d97ae2aefd7b6"
    ),
    .binaryTarget(
      name: "gRPC-C++",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/gRPC-C++.xcframework.zip",
      checksum: "9bf166ed40dd93db9378bb4e80212792f5f09fa092ffecfaf45a4ee832925d42"
    ),
    .binaryTarget(
      name: "gRPC-Core",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/gRPC-Core.xcframework.zip",
      checksum: "10a56a8517a90b94771aa1bc2dc153b03ff16bc387683ec0c755dadc08d8d5ef"
    ),
    .binaryTarget(
      name: "leveldb-library",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/leveldb-library.xcframework.zip",
      checksum: "5d71bd694c4f7de529fe4854572297931d0f2b86e65e9a0c27f9a61c47497f5f"
    ),
    .binaryTarget(
      name: "nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.0.0/nanopb.xcframework.zip",
      checksum: "1dcb08b0a857b254d08c40910fb51733d547fbf06fff88f21d081a40c7cf0a6c"
    )
  ]
)
    