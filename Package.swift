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
      path: "Sources/GoogleSignIn",
      exclude: [
        "Resources"
      ]
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_AppAuth.xcframework.zip",
      checksum: "56bafec7ac2940b441285d54489eb92a8cc4e88a24f916f96935d8a9f85e0c94"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_AppCheckCore.xcframework.zip",
      checksum: "ae985c5c5cfd9debf8f5b26c0f897a82f5103cca50183dca9280fb079cf7a9d9"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_FBLPromises.xcframework.zip",
      checksum: "5b8cf4ca6aace1d8bdabea8efda47b183789b1a9937d053caf3d93a1e7255a70"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_FirebaseABTesting.xcframework.zip",
      checksum: "65f9716eb57a0c46c811228adcdc25a7a1a9f1f71b9b621ba68727db94346f2f"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "016cbb19e44e5e13355be958dcf04d1145a93412e2c3d1f84a9749c4fdeda7c4"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "c0eb8a63c2e638516e49fd6bf9e45d13ade7f89760942b6a43966483625432cb"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "62dd3716d2fa459d138b118b812d23b3672ad70a07dfa6fb6c57127f587629b2"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "7e8ac063e1019878f0f16cb8c039a4b877fa6f16ec0169a1d1ac4631d1f16567"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "2092d4bcef7cf21816649d411c087d91c0312075b67b7006ad19e90d894ff665"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_FirebaseAuth.xcframework.zip",
      checksum: "121573f50e0397a18326f2408765a6826491b44af21a74d482cab2256a85f1a4"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "8eb1cef8c58f00707e0ad48124e3918459e8fdaef1de38a318668a40cd3b931b"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_FirebaseCore.xcframework.zip",
      checksum: "752508f4a3af1136f40352c2c0da52d0e9444398badd2ee77ff960e38772b7e1"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "2a04291c97e9b3f7318f0d32c2121ade083b4ff789047722a2b2ff4361233bcb"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "b26c516630d95797e71e85a81172d7d9459b3992e484274f218b249a325dd4c3"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "77d4b54a5a31f382a9da97b6b7af1978fef20de72195a10590c113a18780fcf3"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_FirebaseDatabase.xcframework.zip",
      checksum: "65e87e989e42939c7afda698d4b0e485bbd88503af9d1de87af561dae752c0ae"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "c6d8e8bbbbac3d8d6b249a3a3e34933d4a64484080280d8671bf2adb7c143dd9"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_FirebaseFirestore.xcframework.zip",
      checksum: "10ab7686cd544bdb536de17d3efcede625450d481a65635869f8f012fbdbdd31"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "dc82280c77b5b850cfad16693a78f8f388ae35441cb53dd847e0eafdc96c018b"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_FirebaseFunctions.xcframework.zip",
      checksum: "bc42e07d4ff415211ff094ebeb93a3ecaf068adb504c090150c9af976872a755"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "16cde628de3b4408b7d2c5d80e87338b7fbd6b492181a2062b84b41e2e04da21"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_FirebaseInstallations.xcframework.zip",
      checksum: "816e0d474bc6a976a1ee522fbb46977601bf2157f68135fe3073e5cdfa0757e9"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "00ea99c47b4d410cfd2043121cf1c373bb1dadc5434a3897af7d4c6c5fb906fa"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_FirebaseMessaging.xcframework.zip",
      checksum: "3a3385198e37121f9ffdb35a442a5f2b85673e16c6015d2e3c2aa7ea8e2deae4"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "49765c9ab85268727167a702707fee3d7c55649be1ad4b469cb4fa3ab6a369ad"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_FirebasePerformance.xcframework.zip",
      checksum: "2f2b5b8fa37bcedb457ab43337c1c38afe5c25aac73ca58f1bda937e9e5abe6f"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "fe3cb105461325a8b1026fae2cb570ef164d50e8381b0928e160a07da4f8a618"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "4c46955476d333cf4f2e3ffa1103174bbe621458808d0e66b936d5b52bb1ce14"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_FirebaseSessions.xcframework.zip",
      checksum: "380587a2b8d2da791a90a3dfa13049a4c2c4022eb4fbb1498c78b7ce47ec6e02"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "d0e21d59abf5b4e45857c42c5e987feba975277f9b62f160e926e5f95d096739"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_FirebaseStorage.xcframework.zip",
      checksum: "c547e181d7115a4f2d5a74aaaca162b883b1ce5d1f2864267650494b41971a89"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_GTMAppAuth.xcframework.zip",
      checksum: "2d1d0c519f005f82113272373254188325b40643b8e788e8a3148fde3c00c42c"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "968cc1c2323628b1a6acbf8bcee97d20177af25667f7096d8ad9accf0b8c6d92"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "8dc1dc148f1179e524d61e0634bec26e9506ed1cf6a286c19d187a6121317f88"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "74b50df8e442625c02a58dde16f59685423e250d5ebeaafff3f3c4a829457a15"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "4e74fd40058e2e5dbd53ff9ee3d9f7c9bd097234b070fb3d2483735f4ca4336a"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_GoogleDataTransport.xcframework.zip",
      checksum: "9b120946d1eab42b88622fc25fc4db5b980fadeec6ce6c0ff0272f9d0bdadc55"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_GoogleMobileAds.xcframework.zip",
      checksum: "94c98860d3d50308c3e7cbbfbcaf5e65fb311d6518d4cf265b1e0a6a3b56a60d"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_GoogleSignIn.xcframework.zip",
      checksum: "8b22971c08c0c7130af1d45bce52e9bdfb5bea2b819e2b67588b536054a953fe"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_GoogleUtilities.xcframework.zip",
      checksum: "98d8c027ce58f4a61c2ebe71655ac49c5d5fe8a3267f9330b2c25e3a93d8467d"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_Promises.xcframework.zip",
      checksum: "7fbf5515dec4533877494698d667dc1ed007f31fc386f2f07a3f189a86d20b4c"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_RecaptchaInterop.xcframework.zip",
      checksum: "43be200bf4e1f809f6cf88143141b67bf487e0a8c7b6be21cd40590f36e333b6"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_SwiftProtobuf.xcframework.zip",
      checksum: "fb3e49e21f1ca105ce0ba3bdead9c33f5ff13c1c50fff9edc89108a73b3666ef"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "bdaa0f94e3d0769c365d6ed40ccf4bd6eada87c284b0315d70d218754ffd2f39"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_absl.xcframework.zip",
      checksum: "342701d97f6ee823ebd7525cdcde34b2ae4456994a28bf8616ee4ffd9c0dbf97"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_grpc.xcframework.zip",
      checksum: "1b0f9072d9561dcc8ff1729cde7ab550a03499b629c0540aa4dde71cb43dc00d"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_grpcpp.xcframework.zip",
      checksum: "a65581c7422a916b4649ed29c891e3c00571acb6842dc484bdac68525b1490dc"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_leveldb.xcframework.zip",
      checksum: "87e96cadaac1eb095ac183971022f6649b024953459532fcefc3ad6e3c6d6bd2"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_nanopb.xcframework.zip",
      checksum: "6069fb27ba227ef916256310eb117def2648e1ae434ba7eec2ffee7678c45efa"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.23.0/_openssl_grpc.xcframework.zip",
      checksum: "888b1320360931eb14d270f9c9d54e7af59854db6d443db993347a5f66910caa"
    )
  ]
)
    