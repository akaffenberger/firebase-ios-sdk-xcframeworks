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
      name: "FirebaseAILogic",
      targets: ["FirebaseAILogicTarget"]
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
      name: "FirebaseAILogicTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAILogic",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension"
      ],
      path: "Sources/FirebaseAILogic"
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
        "_FirebaseMLModelDownloader"
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
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_absl.xcframework.zip",
      checksum: "f203895843d106cc074248895f892207b01022a3ea3fa4e6e10138d233a8c923"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_AppAuth.xcframework.zip",
      checksum: "bcb1fefade9c38576bbec41788d092a137584da4004134cbd44dad92949292c7"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_AppCheckCore.xcframework.zip",
      checksum: "76a3f18ab5566e0ea7dd942170b75109b73fdc66564077d3a8575833797ca64f"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FBLPromises.xcframework.zip",
      checksum: "dc887d9c5d6c57d1a54c0ec9ab9cbb56e2bde2e0d7bcfb9f216232336cbbf604"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseABTesting.xcframework.zip",
      checksum: "ab1fa84341e6b5e588ce6455bad19b17c717314f32f35d5935795ee659cd93ff"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseAILogic.xcframework.zip",
      checksum: "0de9b88a4752a9bd94f794ee6de12029f41059bf4424351ed787ad8a643a06f1"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "821ebf2b924aefd8dab78dd5260ce7d4b9258c7fa8ca2d182aafaeca65caf1db"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "fad44823e59856dbb6992c32db86a6359a46dd651ca783538b06948f83f4c32d"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "555f1cebff87f0dee930d604e678ffd4cf6b61c745da5706a86d92d65054eae9"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "cbb069ca83d2307e9a8b6684da4caf3b240b306cad2202058c6f27a7e6e61660"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseAuth.xcframework.zip",
      checksum: "15b3febb4c958a5e5ec8203d78fbf9c70b49136f03cb238ccf29a5c8ee8b963d"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "50735f11f4cb25273d0574b45202c22bb8ea4fccc6071141d39d4e8a1be07f63"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseCore.xcframework.zip",
      checksum: "33880f43a216a908c5644029686a1909854f17be5368eaf6dbd0bf36dcc04d1a"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "1d37b67ae02edd3679ef74b8dc6246bc24e636f0d4a362cd3b28c5485ece9a9f"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "3d2ca01fc4aad5a8f4dc6164e082ade8566fbc4b36f2a94a63af5ecb8dc50552"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "6df02f4e551bbe72399e6069b0baa6b061fc613df4a6066116b8a2c508c933e1"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseDatabase.xcframework.zip",
      checksum: "e50b1f628a473f4d104ef0623d6952157ebd1d2cbb6f72597ad0371f9dc8911e"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseFirestore.xcframework.zip",
      checksum: "d14d5f5e13f1a9c68e9eff928c687db811ea96da97e3d722a7e3980011aa23ff"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "56df05c574712c9457c9b60fcee9bc7dd96116d512b0ca81004fcefcc3d110c2"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseFunctions.xcframework.zip",
      checksum: "308ba162adac35ca1376b1aa8876853859f111d34ff8c745c0c980a77189c803"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "084e7e47c37e71d9d06fff649804fb5094f815572e6124428b1e38bf1db10170"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseInstallations.xcframework.zip",
      checksum: "0ec362812d21ee54c3351f4cfab481ecbac4b61e5baea2d0ba11e34f7f809773"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseMessaging.xcframework.zip",
      checksum: "9ea8a06fa18dc7d2686561d4b1c5dfdc37de42bf82437860c0fece67d942471b"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "011f4a28e9d5dc2c5a374f14ffa91a739928d2efb5d83dd33b3d2d963b80e1a2"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "c9232803432dac28e5b4fbe2c87dfae483325e20c994f53c49010ed0018b304f"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebasePerformance.xcframework.zip",
      checksum: "578f77594b152d6da5467efbf1ff5a52d2c0805a5a913b8761fd08bd0d2164d3"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "d9853fc58d5e25054f8e6924467f8dadda2da4b83e7184b64ff6d667b4b4393f"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "f566695d862e3f1ed94f84d11aaffa2a5f93c6f2d4f867122de604c737430e85"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseSessions.xcframework.zip",
      checksum: "30b2a83b844e278d55c30ebba91c8d0e4503405353ee5aa31df033c81ee1b14c"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "dbcf62512707566856b6ea8607fde2f43a6570adf1eb6c1cf3176a2904874841"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_FirebaseStorage.xcframework.zip",
      checksum: "5c01348ff7d513b4d44a2792a939aa82856be613612c2800d28ea8b6f70c9e2e"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "33275af8a3e201a4dc11e5414191d0fb09c451cbe9a0e287a1e2abec4a84ae55"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "7621b973c7a966ca99d7b7ae40ae0ad3f53e7dc6377eff10d7478f69d09fc313"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "5ff28be00c91555b8b396d8edebb90711dfd37cc128295099f2a48eb59b23404"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_GoogleDataTransport.xcframework.zip",
      checksum: "c2b375096a1c9677344bc80f2fa5e408c5b588738c285591afde4c80fdd9fa37"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_GoogleSignIn.xcframework.zip",
      checksum: "707037f9dbc78f41ec3d4919aa8cf8697db598f1d6579529d3603e5b54bdf816"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_GoogleUtilities.xcframework.zip",
      checksum: "9ca21d144990f24a37140666b247831f9171fc46fc198b1f9271a6004aa06ebf"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_grpc.xcframework.zip",
      checksum: "8cbd339b1502e6f6413b03134d40082b2ed6000ed2568e29b7d01c1b312cdb57"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_grpcpp.xcframework.zip",
      checksum: "a417a499cffbf1e9642faf2bb373ebda699ffb2a3a734182caa7ac6582f786d6"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_GTMAppAuth.xcframework.zip",
      checksum: "380014a2b9e999021746f4a886db3c8fc8ec40c3aeb1376cca2b37b342c38772"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "237766cd35034e20e44952ef55e3f9300f1b462ade4d817f1e17c3413283402d"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_leveldb.xcframework.zip",
      checksum: "d3256cf40dd6c0a30ca9e41a4643c54fc88bacfd78a7ba3990123de4b1a81094"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_nanopb.xcframework.zip",
      checksum: "5f646024cb960fa57b11ac928b351f92e1735fc0531a2fc8df18cb3a3934aefc"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_openssl_grpc.xcframework.zip",
      checksum: "dc68bb2ba03493313db86b8ede7d0932177eef309327b6c90630cc680790dcc0"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_Promises.xcframework.zip",
      checksum: "9dec2c47b00a0abbb6f81343813655f16ca98b062e180b15fec511cfeec27c39"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.11.0/_RecaptchaInterop.xcframework.zip",
      checksum: "49fa78afe37ed52377b8c654e6859011e34547374c692a60721f8a1693e0f20b"
    )
  ]
)
    