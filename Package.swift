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
        "_FirebaseCoreExtension",
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
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_AppAuth.xcframework.zip",
      checksum: "f5579a5adaeface757538c186929fc189438471b7d16d4dc88b658b2c33ef1a6"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_AppCheckCore.xcframework.zip",
      checksum: "2e0c2c9023e8c3d2e7f1921c3cbd3f48365b26059faa0f60262b6d8e4d2163b0"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FBLPromises.xcframework.zip",
      checksum: "e439bcfc96658b00dc829d59e40ef150ef1beeeccd126b9916d81e9f3fad66d2"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseABTesting.xcframework.zip",
      checksum: "105b92206e60e85adfe28af4e6cebae9c1916c983127d6445b371f9f0d834c3d"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "7e69e2811d143bc76c3b944b1b3fa6297335ad8246c49b3b82920b3e47bbeb18"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "6050950c571b28f56bca8e612e2da4718be12d9ae6ba6c274dd08d3d670d96d8"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "cae0e9df02cf259d39225a8c75e78c0d33cbd3727040a757f1043dab3b2f375c"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "56d75eb4b704c4abafe95a3158c74484484a90295a30269846855fe0e1328cea"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "92cf634320a880c725d9a1904f170b675706df696329d471c0f6a95daadbf5f7"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseAuth.xcframework.zip",
      checksum: "4a8708b7a726edd7e24f384e07232e2ec3f9f1bda1f0d9b5650618181e1a4f7a"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "04ac413198cb85c018d51e8dc9cb567762bdd52a593783df8be7a19c84bb46bc"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseCore.xcframework.zip",
      checksum: "8bd5c0fe364cfd898ef8eff0161d766929259668ea4b82189b0d87bc93c93f3b"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "80849af3745e711028e6d2fc0afed7e925d2d4b761c720c5f8fe074c56f0a337"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "fed11d82a72f1fbb6d7045674799f2e8c3c1240520489a883dd2e02a1c6a6c11"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "8abcc6335c2c966cc78fbb48654244acc6179503fc05cbc3aad831ffac7648b1"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseDatabase.xcframework.zip",
      checksum: "c5e5fec5f54cf6e7f6679c130a5fc39ddcff1428d5ecb1300625ddfc2671e921"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "d48008d4f17e655c771c615005762fdc632dd8995ee8082c6c09d2ff206be0de"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseFirestore.xcframework.zip",
      checksum: "e9ef4717403dbd635eb78ab3e7181f3d0a067f9067291016091aabb9712a48f5"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "5ec1782923178c2c415bb4dcff82e4e3ccf222c7473038786250aab4f892904d"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseFunctions.xcframework.zip",
      checksum: "0f70cadae4cd6480c21b8da6c96f9ed978489c8341d76da16f781fe20a077c19"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "3d3bb879220a4c51383921fc2018c6ed182a196451e74ce38b6db2d84036e432"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseInstallations.xcframework.zip",
      checksum: "13f16abbc0936ffd3bcc4fd36a851dd07590729e649e11982edbb6869614eba0"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "6953a3e0bb1ba8b6b1bb81f79d8a24a0e093064398e3dc7be34352f3e5d0b1d2"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseMessaging.xcframework.zip",
      checksum: "756b8888c479b8575327c595e7ba4179ba91b29962c3f7c656119f0e76566e0a"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "7b144d58ec6a956f454fc09a0fb3723b7025851ac8d45b16a21105815c9a5c54"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebasePerformance.xcframework.zip",
      checksum: "978e0f088196c514c1cbdf86d21a2b599f6d62ea4d16ef92b4d1fb5c16d32bf8"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "2ca16906f10859a6a7d50f4a0dc350056086b8443b490ee142135dfec088287e"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "1cb91f5dab570df292fbc458c15953f7784d5cb460a26f9cbc2484e3840db8de"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseSessions.xcframework.zip",
      checksum: "6176b787c86fd750fbe67d3b7b555ee0f4aa994d846c0e08aaa5f2beb0aea8ab"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "450bb8a96c20ecca1c042aafa7df5aa18c1dad0a606326579a7ec153d355298e"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseStorage.xcframework.zip",
      checksum: "a2e552841308a3a2abeaf6ce7cbfd0fa050b97fae5a6de7295ad01b6aeb16869"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_GTMAppAuth.xcframework.zip",
      checksum: "56ba35b87f736727d671d01ffeacc37023c62dcc13bfb6084e1f5ad488911e6a"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "164534ae9a5f29ef14cc254729f51d8aae3810a9c971999183c305aa19ced6ad"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "2d00cb1f36aa1eccdb783529993699517c6c1cbcdfee469e41043122b495666c"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "94cb0ea25ecbe700f31c7b2f12b969525490aa8e8750fb4cc686240fed359abe"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "b9bddb77b834f4cf2583199ca170153378d4c7d469ee47f4f36a80713863489b"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_GoogleDataTransport.xcframework.zip",
      checksum: "158c4d4681c70778c4518d929a75388f9849d9d3c52c1d91dc6c47010a7b57f3"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_GoogleMobileAds.xcframework.zip",
      checksum: "4207160c677ac2cdf191aa12923247b2b6a93b6e3d4e50c804c36526d434e24a"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_GoogleSignIn.xcframework.zip",
      checksum: "d234824a10e932184ecc20c7d7ae893851e5b22da6c56878ca219cb009dca347"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_GoogleUtilities.xcframework.zip",
      checksum: "043b27cdd66fb765eabe7e23b00e987b3b55c1c5c0a4cd097b6d1c2157869eca"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_Promises.xcframework.zip",
      checksum: "c5b6baa453c315f5a72512c6068b8f23339bf139687f01f3d19332137d5a6e27"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_RecaptchaInterop.xcframework.zip",
      checksum: "1efb7cab87c50689e0d181e6071951a49db3080c53acd672f67942b1bfe85154"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_SwiftProtobuf.xcframework.zip",
      checksum: "01820b6b6fb66449a966ddf25faf6f380cedc6d7ae4ac8917e7f4cc3e9449da9"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "06fa9ef321bce6ae7a0fa5e852fd92246c8bd0612cae5ce39fd1d4f9ae79ca33"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_absl.xcframework.zip",
      checksum: "e6eb4f8c79a062a413c8d5161ca5079ae6f9bb95dc12911784bab6fe6a50ad81"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_grpc.xcframework.zip",
      checksum: "7ae32c5ab6e212f0fc5bddac06ef3b2b5c7775ca8a1b66d8e4fc3a097a0c10bc"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_grpcpp.xcframework.zip",
      checksum: "e045b4dda017ddc01f2eac8a252e2277d8f30fc411c8f4749476df6941cdd5bf"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_leveldb.xcframework.zip",
      checksum: "09141643e803faa72f5ee6fd35fae962ef995dc858ea2e331c7f5d9d3fbe2bca"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_nanopb.xcframework.zip",
      checksum: "d30e2d4d7c7ce495e8ef951cb0470baf942462c98fb7351d95380509d60f6f43"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_openssl_grpc.xcframework.zip",
      checksum: "0b83a5262a7429f22cb4a6ebbdcea423053784ad23929a6dc409e6cb63dc04cb"
    )
  ]
)
    