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
        .target(name: "_FirebaseInAppMessaging", condition: .when(platforms: [.iOS]))
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
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_AppAuth.xcframework.zip",
      checksum: "0c488dadb879e8bdb4dab026de794a45fcf608e83a3579c8c803aaf434d076eb"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_AppCheckCore.xcframework.zip",
      checksum: "b845b2365930ce76b3313a90bcc5fd9f8720b3ada2f1d0fbda10f7db8ff60d40"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_FBLPromises.xcframework.zip",
      checksum: "89a72681c090a7011740d28fdadd821c02a54676968a1a254f65277b9edb61ff"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_FirebaseABTesting.xcframework.zip",
      checksum: "e268754b7edb7d3c05bdb3c5ac7f4785377e09dc032dfb8a37619eedd91c8276"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "d7f2796bcb91afe6a83a27aab84283c731e8520d04b250828dc39f3453b5c443"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "92e5e31bfd4e051abc7e8a74c80f022097263362d0926bb688292481a474927d"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "93704f83d9f1a632477b509567df49e40b3f14711694b3031d32cea00851ab3a"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "faa43e7a6a9e4f88a765cd92ff589b8bffed0761dc07b5156faa0b558b93ec4f"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "851bc4e9df9f66516c8e24f800fb6239cb0519fcffe0bdc97c6c7c98f0f1e012"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_FirebaseAuth.xcframework.zip",
      checksum: "45a67ba590d2b6f2791988f3097e9880dc80739815b4274f639c631c61052bec"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "411b1df2da73737ee48600ccf8a3ab74b729acf0ea508cf91e624daec5f83943"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_FirebaseCore.xcframework.zip",
      checksum: "ebdef593e95b0e4811a11b2f097cc8390aa273d9d4d52cc6ef86ce3d8adbd5aa"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "e716c5ddab34777fa3d327b87f73fffed0b1f5b54ad1e31cecd77a23cf8c8294"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "3b938bc6658f1288551458f3f018ea601f0b7ee1c26bb9b96a3d04a79a8bccd6"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "ac24f9adbe00b44d1f91eeb386293995713086fc240604c0f30dac90dc5ebe4e"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_FirebaseDatabase.xcframework.zip",
      checksum: "a20551aac8a6e18e9aa8c0308ba9ea0a1d11e3dd84039883f4b4c48e7581e80a"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "4c04f7fa35e2222f8fcce402d7edf02c28b23890608bb954dc3596df9e634e19"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_FirebaseFirestore.xcframework.zip",
      checksum: "8debae205f1b87294603c0aa75e2740d2014f4eb3e6f47f98457b6b8bcea6058"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "4d08992ced793e83093328b7008fdd1605790ee4b3538b0fa77d739697226e44"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_FirebaseFunctions.xcframework.zip",
      checksum: "af33dc259cb171b7b79d110300838b62dd2f28f018aa3c8b003cf5681caccf14"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "cd4d16e6fdd91086677cc2aee85b12e4c1519de9123d295b22d41f14f2e712cf"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_FirebaseInstallations.xcframework.zip",
      checksum: "8a7f7ae54508dff5c669d45f7d9449547c35c2c7248e5dd75c5e2918d9ddc682"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "5b3757b72d8922fcd4b76d8dba5963cecf090a4b6001f6c85110ef9a33ca16ce"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_FirebaseMessaging.xcframework.zip",
      checksum: "d815e1d60d2d97aab7c985c45d8612fae9e3716927a3bbd6d22f42006f8364fa"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "c408ea18650193aa87e8abb372aacf3df6e9b55795d18db9f05156ec8d14248f"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_FirebasePerformance.xcframework.zip",
      checksum: "f78b37448d8850ccf663921cccb517e3a04adddb509f3a3a5174092183919f1d"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "03aa2e644e535c8c698120f8f548d32ec713c817721846fee47275b06e46f52a"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_FirebaseSessions.xcframework.zip",
      checksum: "4a975597436feca7adf6b50c0019b267235dea5647114fdfb3b08d40dc61cbda"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "f1119b4b671f305855a5ed5d049ec6befd7f213a56650b42ecb548a05c7d1611"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_FirebaseStorage.xcframework.zip",
      checksum: "04cb2979b1a984da90e764b332bb8041fac8657dd2a992342ad4ce55500184eb"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_GTMAppAuth.xcframework.zip",
      checksum: "7bc6b5923bdbbdc81fe7fdb9c8614943e17e900ea4f4600c41e5e8c9e9c32ad9"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "8b3b875d57f4b895d115ab1c778d707f0811f3fd97bc4f769258ecaac32065c7"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "d5a8e51f1b120216aadf6ddc99e971519bf70f105aadbadc137fe317fd43c56b"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "34b56f95bb610e5edd3ef4b9451f8440a8bd0a0ccf731e26fdb65a64f7b35435"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "067b073bcb6ce159960d510ad456f8580d6af22cd4d46ee84987eaff5b20d5a4"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_GoogleDataTransport.xcframework.zip",
      checksum: "41b00ac87e37dbaec52a5ffd79b974349828a742e8e9b178c84f1d2866737011"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_GoogleMobileAds.xcframework.zip",
      checksum: "dcba0d487df136c83694d00ef8a9cda5b539cfc5ceecd0057345517a73b267a3"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_GoogleSignIn.xcframework.zip",
      checksum: "dba5c393394492f0d6f2ec7d538ebf3ea92d4680c52ec4352cbaf66ae1dbc0c3"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_GoogleUtilities.xcframework.zip",
      checksum: "aa90083cf20fca45fd077a901ff478106530e4b2bbe7db461c6e46a6f073fe3d"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_Promises.xcframework.zip",
      checksum: "1623c68a1b2c006a8d3d6e2e9e676612e0122b7d3ffbf3c21e0fee984b8b6e7b"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_RecaptchaInterop.xcframework.zip",
      checksum: "8bb746e39c29b98f5f42b6b6e79a0933d09d1603e66e6f97fd120465e533e92a"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_SwiftProtobuf.xcframework.zip",
      checksum: "ec89967af7760a3690e3e6f0dc763efeb452af430ff6f8c7dcc3648221e11dd2"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "034c23089adfd1eb5e6dcd18f5ad4ee296b4dfae03b87e9c74146904880df683"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_absl.xcframework.zip",
      checksum: "bc2d0a31a32a149a388c0e2cbefab03a39bfd43f8b54d468b21889b03d3ede7c"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_grpc.xcframework.zip",
      checksum: "991345768b02629a8d65a6587de12467df32918b0a6946d4a47cce9c2b6a3c1b"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_grpcpp.xcframework.zip",
      checksum: "25c1e68924e9697ad1c1f56e30884227fe6725f1dac7ff445030627e90b10eaf"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_leveldb.xcframework.zip",
      checksum: "dc7fd98b2d9734bc7290ca188a0a82ae944d8a076a61a9a95c79705b51d97dbe"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_nanopb.xcframework.zip",
      checksum: "323be94289d253bbcab7a4a55482301b4d086f8c3551282ea2e0e21db2cdac52"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.22.0/_openssl_grpc.xcframework.zip",
      checksum: "ee1c1bcca6aa7cc422486078b4bb27476bf545101766bcabfef87fdbe8fca8b4"
    )
  ]
)
    