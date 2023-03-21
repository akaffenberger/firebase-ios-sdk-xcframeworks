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
        "_FirebaseAnalyticsSwift",
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
        "_FirebaseCoreExtension",
        "_FirebaseCrashlytics",
        "_FirebaseSessions",
        "_GoogleDataTransport",
        "_PromisesSwift"
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
        "_FirebaseCoreExtension",
        "_FirebaseFirestore",
        "_FirebaseFirestoreSwift",
        "_FirebaseSharedSwift",
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
        "_GoogleDataTransport",
        "_PromisesSwift"
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
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_AppAuth.xcframework.zip",
      checksum: "677122600227b80b567e3078f341e9d7640e7963810ffd000a610653952fa503"
    ),
    .binaryTarget(
      name: "_BoringSSL-GRPC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_BoringSSL-GRPC.xcframework.zip",
      checksum: "195f9ff5c97470448da308731bd7c73e75c91c9e3946234c774b04358f7b6e18"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_FBLPromises.xcframework.zip",
      checksum: "8be888a95261311a4e18ecf1ca28cf356e1506515735fbbe0d31646fb505b3c3"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_FirebaseABTesting.xcframework.zip",
      checksum: "78240d1522651baeb7c295c68d0f815a3093aa07ab8124e054eb9ce2e11b96cd"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "7e7eed722cd113de71497e15f9b8d77abc2f7595528784fcff3a5472ea85d913"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "ed0e9845469063ff4f4edb4ec2720af6220c893cf6776564004c7ec4d032d17b"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "4247bbb36451c7b75955bcdb9e1501b42bb1c6fe94698ec919177ca8d6c40e04"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "f7a989d6a5f5ed3d44312cc2e6b227bf995317a14c8d3639cf4433db1525a053"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "1ad790b4407a3f9aff7faddd8a0e3e06a27368c59573983aa067a59fd80ddc67"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "ffce3b561fff2a22a3cbe05fe6507dffbf1ce27da26f868b0a57a0251da1d43a"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_FirebaseAuth.xcframework.zip",
      checksum: "2da80dbd4e29cd62dda5225cda3a9b9c27cfc7554f7b71660ec559f658939bb8"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "a90e8e35a724e2772a3b48c7087ffbde6c4e2ecb9136346ce8447748eccc61b8"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_FirebaseCore.xcframework.zip",
      checksum: "69efaa11399649136f3babffed26d5077332e6e16b6ca325b0ceca4cbf6df82a"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "fd568ef9b294129add6afda347bfa3dcfbfcb0f26766ffb9de0b73f23a2645a2"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "2f5b8ea2b3a345df8e0ae191dfab4c91474924045cb1b62173feff8f0ba7a4e6"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "a8ef4472cc255e8639b0ee90ce68aedf569b0a57a4f934874408b0f0249b37f8"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_FirebaseDatabase.xcframework.zip",
      checksum: "012e90ebff841f2f7ed4b1a2a23f3ad4bc8f9d5e5f4f1704dc84dca03b8464ad"
    ),
    .binaryTarget(
      name: "_FirebaseDatabaseSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_FirebaseDatabaseSwift.xcframework.zip",
      checksum: "0147842418a6baafd1b1da90e29d836363f136e1aed636588380b755a262a8c2"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "50449cdf5ca27acf8f0df27a10c576e0d21b389637fabe72d2f469fc5e5298f3"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_FirebaseFirestore.xcframework.zip",
      checksum: "8d1a0e60747ecf33bcffcd7022a2a701688154b1514b3b011a401b476e547d08"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_FirebaseFirestoreSwift.xcframework.zip",
      checksum: "edb383ed7309868faeb380546141b6303a72d803a6c1ddc75a7f0e261eeebb08"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_FirebaseFunctions.xcframework.zip",
      checksum: "a503aa55127ffe306d5be7e1c82c8cf312dde8be0fab3e556f01fbaec72a6099"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "795f7548278189ace1b3d0583bb9bbf49495cf37933d846b039e8223a0e6306b"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessagingSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "e90ec836561c0ef8e1ddab86f3b88ec77b333b5be57b6876cc7bd348a4e3a3fc"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_FirebaseInstallations.xcframework.zip",
      checksum: "24b874000d19fc4eb6d3881beb7802470de38f179fa99af5e637a91aff0b4fff"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "d043f5067b0c66727de7985c364324aff1753526c10608d23db0e806204586d4"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_FirebaseMessaging.xcframework.zip",
      checksum: "072ea13d1183718f04d57c147d37e18b7fdf7c178c6a7697c9f7362b6b508214"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "e706dd484f9c76c8149f555e448718695d4c70b1466364e55a0affd71ac74c22"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_FirebasePerformance.xcframework.zip",
      checksum: "af7f5518e9d4170c8ebb303138a1808f7aecd2032c1baa033eb0285cf57dfb2a"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "07b627a3d2d001e71d58a7e0bfa8564cf9e586702bd8c3518198c958bb31249c"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "a3dae2b02dfdc335c529601e9097c4fc8341112538fb05098e01b3bef95331a1"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_FirebaseSessions.xcframework.zip",
      checksum: "b3c2ffd60569d65b8ff1a1ddcf60d9f90ecf59b2a20e3444a56b7d29ae76e18f"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "474cc3636cee90e1c207c9bbd69614a124f2ddf65380919c12823772d9a24d20"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_FirebaseStorage.xcframework.zip",
      checksum: "f2bc77f9fe3781ad000591df02e4b9fb2db7929608305e9a6a2053b1fc61603f"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_GTMAppAuth.xcframework.zip",
      checksum: "35c4232c4446774059ea51ff7f98d157956d0bf26497f1906445ad0ee24a1ef1"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "e4a9e91741fcdd875b7382d82fb1681a5e0714c3cd2f3ae9efef708b56d0c109"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "10d67102b5bf321bcd0a2629ced8921b04b8f60fd4e8cfb58cc9ac1eec94e108"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "cfe56492c803bc07f6a4fc0a7ddf6fbb3e55792166a8f2edfeff564134131389"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "4830e4d366e1563212b70624f7d2f05dfc0bb94b7f0a38a2f5c1d21090c24ffe"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_GoogleDataTransport.xcframework.zip",
      checksum: "0371a8e011437987f184244a34fc74b55a6ad0bc69da05ebfb40708b2baf883b"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_GoogleMobileAds.xcframework.zip",
      checksum: "f3679b7c7f1137d1a522bb895036fa7ac5ff7eb8095e061d048d697ff814d1c6"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_GoogleSignIn.xcframework.zip",
      checksum: "795bef791018e37762a0368b24003391894d847f52e8ec56d8c9484a84e1ec9c"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_GoogleUtilities.xcframework.zip",
      checksum: "fb825ff58c37ffd132aa8f30f4aa61b8caaa9a7cb77d25d2eb30f15637738f91"
    ),
    .binaryTarget(
      name: "_Libuv-gRPC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_Libuv-gRPC.xcframework.zip",
      checksum: "f46b75188e37bde2f973429a95d1a4c1457231af245aa3c87463a6bc3ffa47be"
    ),
    .binaryTarget(
      name: "_PromisesSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_PromisesSwift.xcframework.zip",
      checksum: "1eaec1f0cb8f09efa43cda7e20b46b9823e979297306c6016678f50c35921393"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_SwiftProtobuf.xcframework.zip",
      checksum: "75c0e818cfc46347b10a5c28b698c09417c0b70977ec5cb6bbc2dc977acc23d1"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "817923f0dc3be391c7121e981323fcd36c194e60b1b5bc37dbec748a8c4b456c"
    ),
    .binaryTarget(
      name: "_abseil",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_abseil.xcframework.zip",
      checksum: "dfd35eb3084ff8eeaf029cb56a84e1ecb767383426e88fdf38d9f2fb9ebdc6b5"
    ),
    .binaryTarget(
      name: "_gRPC-C++",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_gRPC-C++.xcframework.zip",
      checksum: "5e095fa9aa60d34c1b1c996efd1a76d6ce76eed125ff573d73b75ec684ebcf52"
    ),
    .binaryTarget(
      name: "_gRPC-Core",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_gRPC-Core.xcframework.zip",
      checksum: "e40bb98773798ca0b54667dc825a3b435029b826c55731d1da2d5b8e8b5bc747"
    ),
    .binaryTarget(
      name: "_leveldb-library",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_leveldb-library.xcframework.zip",
      checksum: "cbbcbf3ae8935a6bd32a4a2a34cec0a6f4169045407fb86d3780f559e108c286"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.7.0/_nanopb.xcframework.zip",
      checksum: "9fe9cf70c47daf6fa932ceacd20a6758f61d6766f6ca2b2169c88fa046a80e0a"
    )
  ]
)
    