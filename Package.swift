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
        "_FirebaseAppCheckInterop",
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
        "_FirebaseAppCheckInterop",
        "_FirebaseCoreExtension",
        "_FirebaseFirestore",
        "_FirebaseFirestoreInternal",
        "_FirebaseFirestoreSwift",
        "_FirebaseSharedSwift",
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
        "_FirebaseSharedSwift",
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
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_AppAuth.xcframework.zip",
      checksum: "221e2447a551789c8a55400a1723034db5c2d23ae9f8cd2c0d0627908314c9e1"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_AppCheckCore.xcframework.zip",
      checksum: "2279754933964c260be7e9abd369c61c2a2bb57f644446154c80d8619a9e9254"
    ),
    .binaryTarget(
      name: "_BoringSSL-GRPC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_BoringSSL-GRPC.xcframework.zip",
      checksum: "244401474ca556a632196b7ca6b898c7c9f1f713b5f1540d505e60f17cdc4f8e"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_FBLPromises.xcframework.zip",
      checksum: "7d610c8b248584b749818b74632466640627d84fe0505924a48d21cef98cbeb9"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_FirebaseABTesting.xcframework.zip",
      checksum: "318db7abeb80b471bd8f07fb763c61042d8346a9db36cf923e1266f3565d4560"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "9edc051f94bf1cf84b43803054a1164e4c92de89cb917803d0f32603784d2bdb"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "bf2c6a82d0c116ac21777229ba0e847283d55961ee3257e72da4f05d6a5de576"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "04adae04b94765ad2c1562c2d287071d21161c503557ac97c532865fc017d1f3"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "d56bc7af081fc287717ef5fd0194ae33cf81d3bde7fdc9a3e8672315c301a2d3"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "8f0528f351dea72437b0ecb562da73814c13917284f98cc0b32350ad9d6b23c2"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "7426f1dbbf4173a13b224e098a4db95b86a8aa73e5ffec80e257b8b2d376ba52"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_FirebaseAuth.xcframework.zip",
      checksum: "04dbf2bcf4730e583206434b1398dd12724d6beb11c6c1245bf77e670ea22d11"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "67e885cc88a3c0a5d8bc43c8c26429cc775a798ea76e880134a3416ebd11a6a9"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_FirebaseCore.xcframework.zip",
      checksum: "d89f4b0f138c52b6ec5db876ee48caef4f59b89ff812cbe78e69ca000d641668"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "fbb8394e8e3efabbcf68d41d7f1b827854e4cdcdf25454d7483a92be4be9e338"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "88a85ede177f5c67cd2aa2cf57b3dcffb5aabf34dac6ba4f74d093f438021cae"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "8a50bc4d57c61368527a558e61f27196917c6d68886bcf108d9d7354bab60de5"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_FirebaseDatabase.xcframework.zip",
      checksum: "4dec1d7c0dca1ad827c55b6089d6db5b5f709e62f21efe25590275434fb13dcc"
    ),
    .binaryTarget(
      name: "_FirebaseDatabaseSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_FirebaseDatabaseSwift.xcframework.zip",
      checksum: "bce84d7c12308f8b2d4d76b19733fab2b152c621fd3fe9bb9eb15928d72e16ce"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "6aab71ec29b547c5b02df2bd1ae8911a0f12ef219be85397b7e8d2d6b4115b9e"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_FirebaseFirestore.xcframework.zip",
      checksum: "c9dcb9b3052a7baa8cea59b03878557eb375ae90595a0bd0607492dfad3b964b"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "ce012d2d4c6e1f3928585f0fceb8e4fbf4a5f1170674e32e61bb388f9c9d29a1"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_FirebaseFirestoreSwift.xcframework.zip",
      checksum: "b81f33d19af015e1deec5d1f02fc4b9b3202f7c3cf5f9009cce9a2baf14642f7"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_FirebaseFunctions.xcframework.zip",
      checksum: "8acaa1a0c4f48481bf63b32ec99e9d2bab40cd4f372caa166025aff6c4dd61d1"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "289423ab3d74df2f0ab6338c1c020b8ffd824b9dc4003fdc3bf877cc67629b96"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessagingSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "8b5ca82c47be660013182c08102eaf2500ab08b759163afa44c0c9592d368778"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_FirebaseInstallations.xcframework.zip",
      checksum: "7ca954d5ad9fbd34b028e2ba0760cd00ea196376fa3f1e9967377c364aae96a6"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "1d1b99afd8107794424c1f59565c3aea8dee745b62304050ee01ad3b4b74f654"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_FirebaseMessaging.xcframework.zip",
      checksum: "496d6cad3576e98cd8e3139dd5fe500eec5288c597688abbcb9642814d62d344"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "103f1d95ef727d20a7d772038fce136669708d8cbf921a34813d4be02437947c"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_FirebasePerformance.xcframework.zip",
      checksum: "1f33e12f4ea3c1550b4f188988a23bcd41114b19c4571d860a6e489fce0bf032"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "6799756fd8e2dcd4feb6cb755b268159111899a204683561a0c4a827b91fffb7"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "5506ca76b4ef13d2cf6cffa72df9fc7a7a92accde15a3377b2e4268e47cc1c4f"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_FirebaseSessions.xcframework.zip",
      checksum: "e376f068b8bc91e108c79264d5ab3aedc345e3d3866063941581e7c12d8baea2"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "4cc7fedc97b3b54391bce07e84a148ba82320ed92355e2b42744344f9fda0781"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_FirebaseStorage.xcframework.zip",
      checksum: "5bf97670f926efb7f40a07b185ba8e424b89319e4d4863f6c318f118b77c43b0"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_GTMAppAuth.xcframework.zip",
      checksum: "45daac634bbb1b952cbc297bd2f39997e7187cecdff5b6020646f21cb7fdff4f"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "cd36d9bd13157da7ac75ecb660134bc73f7a8debd555f163077bba8b2cce6c28"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "1f9204f7f68890bc167cdf1cbd84d69860b2318b2803c12ae51bcc624bb48d2b"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "a04a0fbc850bd85e7c94d8540f754e56d9d7e855f530356a3d9b3a5221873cb6"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "1577e3d83d84b64c2faf92843d3971d53e9af704e2e18077ca1f9fc67fd66351"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_GoogleDataTransport.xcframework.zip",
      checksum: "9937dfe0eabe9ef2fbe6052bdac1d8a4a6a53ec05b7f1ee92d0b8475206e619f"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_GoogleMobileAds.xcframework.zip",
      checksum: "d2473dbe13c4107eab0f2d5f9e9d2b7f222e7823d897e343ebd7129272f19dfb"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_GoogleSignIn.xcframework.zip",
      checksum: "f9ce1c526248df85598705d70d35be286f023687f3e2b2f3fb7256ed42ad4382"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_GoogleUtilities.xcframework.zip",
      checksum: "4a694842e6d2286f0f68c6fd89bcd200d20d5d43f6c8d1ed99f5ec9034406931"
    ),
    .binaryTarget(
      name: "_PromisesSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_PromisesSwift.xcframework.zip",
      checksum: "9c6f83613e9022de068dbc2e4e140896fee63ea749bf3c4ef4a7f44d19d19e37"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_RecaptchaInterop.xcframework.zip",
      checksum: "f6c18f83b436909111f49342568223fbf18fec7ba853e3310060310be01f1174"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_SwiftProtobuf.xcframework.zip",
      checksum: "3f7fc62d7c83ddb069d62f728983ad71218c75aba7b52f532d974d73deb6978c"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "f3905f3a84c6f9321d78cb62273a4436e96ad71d2bc4e871c1e65b4e01098054"
    ),
    .binaryTarget(
      name: "_abseil",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_abseil.xcframework.zip",
      checksum: "04747bfdc87c49c7374d3910e809dde88233d2914c5b28eea8de1981318646f1"
    ),
    .binaryTarget(
      name: "_gRPC-C++",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_gRPC-C++.xcframework.zip",
      checksum: "50d62b4a53b4ea909dc673e77a7d6f41ad34ea59789f454471bac9df38d88db2"
    ),
    .binaryTarget(
      name: "_gRPC-Core",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_gRPC-Core.xcframework.zip",
      checksum: "b967c31e8bbb91caf7ebd2e3c35aa41bec53838429885eeadf7842e37facca49"
    ),
    .binaryTarget(
      name: "_leveldb-library",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_leveldb-library.xcframework.zip",
      checksum: "b2c142e7d2b2a5b0e7cc1dad8fa32295c5930abb5419e43a1cd7d057d5eb04f5"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.18.0/_nanopb.xcframework.zip",
      checksum: "fff33e5965a36016cdf9c1239ba427720516476487fec48ff01fdcd6d926762e"
    )
  ]
)
    