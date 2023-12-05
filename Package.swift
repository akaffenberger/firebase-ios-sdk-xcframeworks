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
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_AppAuth.xcframework.zip",
      checksum: "002963ecb4acf2b41cf731fedc7774357f3d14d1ba9913390017c4d017d17ceb"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_AppCheckCore.xcframework.zip",
      checksum: "0cdd3263556a74398705c70d68eb029fc654d338bf5e28050a1f4756abb9a1f6"
    ),
    .binaryTarget(
      name: "_BoringSSL-GRPC",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_BoringSSL-GRPC.xcframework.zip",
      checksum: "691d8208177a0fd3f7eaa0866b699ed95b6bd6618b63be5f5e22fb73253588cb"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_FBLPromises.xcframework.zip",
      checksum: "0e44aea1861c65019bac547f6b360162d2212d4cfa08faef3e2c513fed567faa"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_FirebaseABTesting.xcframework.zip",
      checksum: "7b25f3b08dcfbe4e66407bf92d102bf05780fe8fdf0190310747e713027a1933"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "914a3347699bc5ef255968e743c3d8d1f183e52f0f2c48063afbffc503fddcaa"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "d33354440413f6db97cebbbd4d0fc67bfa49e9b498aef61efb0e3d3b2e492bd9"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "2dd06b5e4258d37777db4bbdcd6a749f98e253dc46ed24990c057e1b3c61d81d"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "857b6f61a846097b1a4c4c7ba6efdcd816e91531fc86c0dd85207a8efcd00f1c"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "94b4aa7e9395290e3733f9956d7a54cad7b86af9d11947893d180e9f32114dee"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_FirebaseAuth.xcframework.zip",
      checksum: "a5a227e82b1475fe5d34174526ab436b2aa46d9ba7dcf35e8ee0807deadd6f4e"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "cb80aba1e515ffc697a109d2e4c48c1d868b4ffcd993ad53610797eb23c19383"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_FirebaseCore.xcframework.zip",
      checksum: "90ebc0221b4b9a998704fd46461cb4470a6cf0c69c0f60e9be3e6b15784f5799"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "69b6665c068c915256b66c997872c3cfd08b65b3b2fc25f70d6b87b56dc0cb0b"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "7cbbbee91d63dedef348de9978e857d526d0d17e869177de8c4b89dae7f671ee"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "0698278e704ff3ae44869d836582e4d7be59bd60190325cc3792c83f49ee924b"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_FirebaseDatabase.xcframework.zip",
      checksum: "fda05bbce94770078c3479bfedf4455ab726bfa97ea8bcba9ec6fea85e21005b"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "b43ad0094153a1c4613299ecf9552cb48fc168687313f82c9334334b098ad9c7"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_FirebaseFirestore.xcframework.zip",
      checksum: "fd8e06614558cfe35598d9f5f1428e378af5e467904d23224b0aad4ffc59ac21"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "f6df2273cc9b2d071527a582bce9806e7496b1446a6cc2ac71bd0e530faf29be"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_FirebaseFunctions.xcframework.zip",
      checksum: "a9d3bb01acf9550914cd0e06e5e0ab6a452cc6e86e3bf639c9c9d6fafb18c9f3"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "9c929f3acf7f36cc677495ce6af7cc081c2599d7433e8120b4a6b5281200e157"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_FirebaseInstallations.xcframework.zip",
      checksum: "f49f2660749958e98e1be66a1facedd49e06530555b09d9c83e734b0b85abc93"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "fe01bee6c0932c509455e34c0812321440feca0fdc4e4fe290a640be44bfb1b0"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_FirebaseMessaging.xcframework.zip",
      checksum: "c2750c8fd268cec4f2100de1a42fa3d63359fe14a8ab573b200d0e11e6d561b6"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "7d220d68432eca37921f52f0c56b7d9ab01257464131bbb8f2c1965b570c639b"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_FirebasePerformance.xcframework.zip",
      checksum: "2bd7fe7533e71e53e483e9e3a00251dbe2f76cdcb82a5b6da1bd76b66510f064"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "35c4f3dd67579fa7f456a7512f9b5a117b27f825778d61992b8367a94441eb1e"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_FirebaseSessions.xcframework.zip",
      checksum: "732f1f900efa24f38814d9c215d49b972fc016ccacfe3e77a49b62ca92f0b54f"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "af929e7a238112ce99bc116b2b663ec3f4d3d39aa479a815d7dbb76b75f013f7"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_FirebaseStorage.xcframework.zip",
      checksum: "430c652904618c15ece799307acf1646e14f2422222b4e310c3b061109c613a5"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_GTMAppAuth.xcframework.zip",
      checksum: "dbe837604ad945637f4326daa0168425c0dc1f326e9a539c2c7368bf8ecd256c"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "9cc3440669a635fc627ffb17eafe737807214128ff4b07acef242c1bb5f27158"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "83e456b48ff1ca2d6379ea4b3d3dbc648e9ea49066da304dd30817c1235b8c5a"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "c417213a6944ead112af536dae9709ad4d96aeb9a08b71aa9e4b91dd8124fda1"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "341957c23f0ac482dd8271eefb454952af38804bd034dd0abd0bfa2b38bb2f86"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_GoogleDataTransport.xcframework.zip",
      checksum: "c97a3cfc3cae9cf003f9c83ea86bc8dfae9bd35e7efd26983759ebf57d486ed1"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_GoogleMobileAds.xcframework.zip",
      checksum: "7d63038d8985b4c3f8ccea1fca5040ac34975133b601c326052afe82483835d9"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_GoogleSignIn.xcframework.zip",
      checksum: "81d8f53c479fbf6dd38105f66992a87bf77bed59721c0e1efdbca1b046004bfb"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_GoogleUtilities.xcframework.zip",
      checksum: "f115592de3a7784bf6e1bf948303714a1427f9499ae177d000d9518cc30274b9"
    ),
    .binaryTarget(
      name: "_PromisesSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_PromisesSwift.xcframework.zip",
      checksum: "89f6b20e61ccbe157b1741eeb89c5eefe301b25cad351feadce750c7619eeaf3"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_RecaptchaInterop.xcframework.zip",
      checksum: "fc521caf2c74f6ce4b3f160adaaa90d557e266c87d72d6f850b61ab39663fc08"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_SwiftProtobuf.xcframework.zip",
      checksum: "9736e2adbeb0c63ee00ca36c86b8b6c524d2f9238fa83c5470801f4a904b3ebc"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "758dc73aaa23d88890ef7132e2b67ae4893c303201fad15bb059521d0933c942"
    ),
    .binaryTarget(
      name: "_abseil",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_abseil.xcframework.zip",
      checksum: "2f3be6408f95a270790fcd56631066c774c61b81de6a31fd859ba65f722d37ca"
    ),
    .binaryTarget(
      name: "_gRPC-C++",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_gRPC-C++.xcframework.zip",
      checksum: "986bfb96aa825816d002e07b7b6040259c9013489442795a88ced884e10d97d0"
    ),
    .binaryTarget(
      name: "_gRPC-Core",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_gRPC-Core.xcframework.zip",
      checksum: "d4d94f736bc8fc10af6bad60cef8a888b85de564f966f82f5f77cefc6c848ad4"
    ),
    .binaryTarget(
      name: "_leveldb-library",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_leveldb-library.xcframework.zip",
      checksum: "ab4338963c0fd1c05b964ab223711820e837eeb5ff1c170650109c59bcaec651"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.19.0/_nanopb.xcframework.zip",
      checksum: "cebcfa89662a9ef3d36289f77a1087af13e731de700111789dcb5d1a2a66509d"
    )
  ]
)
    