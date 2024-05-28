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
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_AppAuth.xcframework.zip",
      checksum: "34867176c8de43c2df1ed01a64cc6b332becf9454986d1d255fc94d4a4986ed8"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_AppCheckCore.xcframework.zip",
      checksum: "0785486234b3131fde2426e415b49701d655b7b76419ca0b142811e1eba6bedc"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_FBLPromises.xcframework.zip",
      checksum: "9fcb22e630823273cdd0de7f96248f9a4e865c4fa7684bde307ace0e14b58e08"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_FirebaseABTesting.xcframework.zip",
      checksum: "9b6f361ff1e41bb3a738693d5f3975d66ea972ae30a77bfeafc936546004a3d5"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "c5e2da0a300226eae38a79493756570ffae4f5e83ffd6fefd303581ac34f5dea"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "4743673f22ebc81b288357c8b5c17e9fa49363a6c9e9b2a8faec6cbb1a181f82"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "9c8f37572eecc9f6360e6705b138a30372768250c25adc0a0a4e654f81bd0f88"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "3aa5064bf0224c83d516ce6650d95cc5d1dfa022e366f4d81b6816befbf1fcc0"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "506f0f0ac03351799033e1904c2c9608bc8ed54a93e0daaac0abfc4929e5781e"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_FirebaseAuth.xcframework.zip",
      checksum: "ed13cd6dfa152bf152479a8669fe8f1462ecc9573a3987e5b9287bc2d4dc5210"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "d2fc262cf96b9f46377ebad312c5014f08dc45f154eee2689d348aef6560f816"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_FirebaseCore.xcframework.zip",
      checksum: "47e72eeaa51ba592ff60682e553bdfb5d792438f18233a6bcb5431770d8a6981"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "24f323d666171a034be59a1f4332ea4bd0d9cd8dc194879ca4e83093bc5444e0"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "1469b149b75ae17033dcd14c556ff65eff6de4430818596109dd8030db5470fc"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "89281d0f6b7da85303fb3cbd221bf28ef34741b1c1d1023af285cc9ac3ee7094"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_FirebaseDatabase.xcframework.zip",
      checksum: "bca927bcc50c98ee58ec55c9f5d4ff62066692fd93bf25e12945fabacd36bdc9"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "ec73ad00e636c88cd280e65e3784da1c48ea315d53c828f3a8713207dd19c4b7"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_FirebaseFirestore.xcframework.zip",
      checksum: "76379b29659d9b5b8d4941d178d149397dde7d72c14cb8dd2cee1559a0aea5ed"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "7bb8e8c63eae05361291f6c902510a11ce262ee73ca28cd7456f49264a97323b"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_FirebaseFunctions.xcframework.zip",
      checksum: "e1ffd292bdac5188fdb6d8cf51f9d8956fe8beb02536a5df30af77affd1f8aa1"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "053c022d272203724f0b69d643b33f4181c58f68556b104c49db1474f7712099"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_FirebaseInstallations.xcframework.zip",
      checksum: "1c434c6f1069cc4a1bf3a4d7df7caed507ada37f2d3b76bf4d0edcda576a2815"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "f13c79d4b7be41e19c15e9c7dff18a628ed18b220e7eada0065007971f75882d"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_FirebaseMessaging.xcframework.zip",
      checksum: "241be5c29aaccd298357cb795f0d3f3e51704e6159f688c8a744b25f13da04fe"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "8240615c40bb79833eaf203de18af77f18fe153361f53f904a6942efa2179711"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_FirebasePerformance.xcframework.zip",
      checksum: "f626869873bfe6c7aa5bcfcb10ffbc1e5af5594318bfdb251488d665664151e7"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "5ee298bd7ebf5b18945a7d1c3bd85decc45b2b40a53b27ee059fbb6745e6ff88"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "4392658eada71c0f66b244eef3c94a7f3f18eb8939c26800ac1a8c2e10c285ee"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_FirebaseSessions.xcframework.zip",
      checksum: "da882fe3d50b61939d3a5b49d94287463c2d9a5fc3773a418f2ef53ffb6a624c"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "89af692c53d56352dc2efd2041e4047567c64b83f3d6e11b4817905e426bc58e"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_FirebaseStorage.xcframework.zip",
      checksum: "e456a6dca78f446c5dc13aa9fe94ea7a44ff3afd783ed9e2c1d156e4bcbdd51e"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_GTMAppAuth.xcframework.zip",
      checksum: "7701fc146f25d5e0168f477cddde03a73781ffb1bbe240ba7034b5e9587552c5"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "2831089958667370e65a51f083ce00bf2652a0c389d797036c0d72762f29cf51"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "97d37f62f17632b87fbf051be7f59d568867ec27ac10b39b70faa1fff3e6d804"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "531dec38425b397779cbc0d878b8e76c6c486693dd1b284f5d1e22021502621c"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "d5d6b1f4aa51ed1fab823db048b197600259b4747958a713ab11ae86a1dc7c50"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_GoogleDataTransport.xcframework.zip",
      checksum: "171c1fb1e8f66fbc0acd19fb22e1cc20f99e967bdb743824e4b9e5d81b90291b"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_GoogleMobileAds.xcframework.zip",
      checksum: "cfc21e0364f98805d11df700507e7b1a2ea3411c2d8afb28bd9733454c620844"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_GoogleSignIn.xcframework.zip",
      checksum: "54974f3f07cc746debf41d64b1ce266aaa9ee27679cad64e3a35b2a09d7eb6e4"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_GoogleUtilities.xcframework.zip",
      checksum: "13a1204b4062c0b91b6f87a3a386a98261ae9629633487ec2e8248deacf1af57"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_Promises.xcframework.zip",
      checksum: "6340d81b598b435e26847dd2ff2e024443ed97aee75b8826e7e532126f2d8f31"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_RecaptchaInterop.xcframework.zip",
      checksum: "9ee2ba6028be5741588e45ac3851a1cb2f3b89440f50b321c0147966a91183d4"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_SwiftProtobuf.xcframework.zip",
      checksum: "94259e9cde1aa3f2c3de9451a5de2e92e4961d1da6a1d3c5259c10b99c5375ce"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "32945950368d33f540ba06f94f9df67b59acfbd4045df6e80adce3bd09e214a9"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_absl.xcframework.zip",
      checksum: "c17eb20713ca56adf8a6e37484db5323120b56672e9b43e6b1c07f159f8dd468"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_grpc.xcframework.zip",
      checksum: "a069bc9ffd81cd7c42aecc0f16f0637a0d420d7a3f7724b70c658b31cfcaca6a"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_grpcpp.xcframework.zip",
      checksum: "a293b630baf9ee54f73ee41f24285e44bf332a246a02d0f8abaae0fd509bcd32"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_leveldb.xcframework.zip",
      checksum: "743ac4160ddeb5c137c1ca14acd4d258ce8c7b2f3e1d2df928fe61944d10a2da"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_nanopb.xcframework.zip",
      checksum: "4bebe1bc18380323d9e02532adb7e9e82bb929c4921dc948eb6933e4cb2789c3"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.25.0/_openssl_grpc.xcframework.zip",
      checksum: "1b9b84f95a5bfcaf6a6a24477309f3a37511c23dd7120ec73b67b0f14d15ea37"
    )
  ]
)
    