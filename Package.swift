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
        "_AppCheckCore",
        "_FirebaseAILogic",
        "_FirebaseAppCheck",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        .target(name: "_RecaptchaInterop", condition: .when(platforms: [.iOS]))
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
        "_FirebaseAppCheckInterop",
        .target(name: "_RecaptchaInterop", condition: .when(platforms: [.iOS]))
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
        "_GoogleDataTransport"
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
        "_GoogleDataTransport"
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
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_absl.xcframework.zip",
      checksum: "e0f2ed5ef6f306690863bf240920228f31b3253cd1211eae8d4d99d4ef21f215"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_AppCheckCore.xcframework.zip",
      checksum: "a19b10d9bbdcf529373a39f66366e4c594e909225631739a496c5de4593c23e2"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FBLPromises.xcframework.zip",
      checksum: "9920df3c39a5e74bb7295dcab79ebfcfb7165409c8df789461e77d5d97634b81"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseABTesting.xcframework.zip",
      checksum: "9fa816a3c9625445aa1725ac4a900587c7c0e9f4cf0405e7097e1f97998e6021"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseAILogic.xcframework.zip",
      checksum: "c589ff09e07854fc5d5a05dd67118896926842f40c968d7944482771b062210a"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseAnalytics.xcframework.zip",
      checksum: "e6144f96d425f7b9c2a91c3492bf03e03559b365f56bc24117448ffc925e5a5a"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseAppCheck.xcframework.zip",
      checksum: "e4ac5780773d0960391c04d2cedee9421316c671daa322e6da7ee84cc1aa9ca2"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "53ef8acab963e8326333ad9c63c47a4d0d459553bb781791c9c782f291310f25"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseAppDistribution.xcframework.zip",
      checksum: "6e30bd767d8cdccf43625ea8a279db199921fc3c3de09e41c3caa770f39e8ad4"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseAuth.xcframework.zip",
      checksum: "946e3a5bf529ab2f73b31fa4a458dd8a1a3b6db9aa6c93807ee820ea2467311f"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseAuthInterop.xcframework.zip",
      checksum: "70377eb298b6cf9115b0ee06263330af411999797394230052818b328ffdf914"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseCore.xcframework.zip",
      checksum: "349154076d48776ba3c25e4f099fe84cdaadf7f9f4cf5d45f10aaaf29fdc0ffc"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseCoreExtension.xcframework.zip",
      checksum: "c2ca4aca67fe375a18b1c05cd5d8aaa14b560f02d78effd226ac74f689f2c1f7"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseCoreInternal.xcframework.zip",
      checksum: "fd148bb3b5ac94742d8a64ee58044e7392c6db34219c7fab8674ff2b6468000b"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseCrashlytics.xcframework.zip",
      checksum: "13264251056ecd9d233bebbfb57ffb7dc97e64eaa0d317c94eae1b6261be614a"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseDatabase.xcframework.zip",
      checksum: "9058c5048b2f48764b8419aae5463d8e40bee403cb4caf5f5666b68f52b9b1e4"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseFirestore.xcframework.zip",
      checksum: "1b30346842fb8975c27acf369138eb14ac280fe91c70357e9ec9ac576f9c3dd2"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "15d3baadbffe832a7ce7e0fc1f91e9d5f57825d95be21e830f5651f4636a607e"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseFunctions.xcframework.zip",
      checksum: "1b8abb417cb5941bf7f07bb4a00a3e1a25b667181377ff0dcbe4d289f0b83704"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "2f6aefcb1d7bf2243e21b198b960d201b1cf673f4e42063c4274f3f91dec81dd"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseInstallations.xcframework.zip",
      checksum: "ef3013676bdf0f853b9c32b7f3d5b15ca5d85a3a5b4eea40ff9b611176876a86"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseMessaging.xcframework.zip",
      checksum: "3f6eaa9681f612ef4e102add9f0c24d6a7306a53f8f65fdc11ef6217079deaa8"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "f08ecf25a4687ce45fc26b06b152b944718aa7b264e051822f4f3c4efa92ca0a"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebasePerformance.xcframework.zip",
      checksum: "8dfac463993d9aebaaa0c092104b7d29f2f24c8645f5cac21ba771cfa4770e1d"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "d22254d4e2a3faad46e70db6b30f9b2132060bc5db1a78c1a200d229fe7cdce9"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "f6b4eff68c014765b8d6c32120cf03fe331276f54c9cf18a6adad9e14ce0f554"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseSessions.xcframework.zip",
      checksum: "0f1a8b602dc66831f560ff2a8c3bf56afdd6008a429361607bbd00ae21c1a5d9"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseSharedSwift.xcframework.zip",
      checksum: "ad71774fd6412541ce0f459d5d181f31d43a6b8b1acf085a776a72b35e4fc140"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_FirebaseStorage.xcframework.zip",
      checksum: "cfc43dc711ee0b573e37e5f2046ef40d11c11e5482f5f8653d3e47ccfe6cf99b"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "942034a316495d767694bffe60fbbe745169165c3f33ee30d40b13de8906ed97"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_GoogleAppMeasurement.xcframework.zip",
      checksum: "9a249d52bd3327ab3fa4ff95e57521bb8d153d07c84dbdebff4c25179430eb21"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "5159e935bda1196be51fba74d3e02133ab0e25e845626ec1f7291f77e47b4673"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_GoogleDataTransport.xcframework.zip",
      checksum: "b93625c7b69bdd51a137541c7ebaa2c37e8f9ca70bf7b81b918796effaea386b"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_GoogleUtilities.xcframework.zip",
      checksum: "6e163fd801ed7386df37803a2f3a56b74700d54edb9dc5bc013f20d7e1b2dfd4"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_grpc.xcframework.zip",
      checksum: "5238e8c0607383b18291bb73fe0d7e95fa4b1760029d72c1d69470fb42720ca9"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_grpcpp.xcframework.zip",
      checksum: "bf310f39f7b8264aab664b866451204a21d54bdbaed69ac5eb8c9aa97e4de02d"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_GTMSessionFetcher.xcframework.zip",
      checksum: "9745c37464db0542bb4ca627be83d3fac58a968f37da7e450c465714aeb02e80"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_leveldb.xcframework.zip",
      checksum: "57d674627e74750391689da99e02c4ccf4f6bd36daf1a157f229011b896086e5"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_nanopb.xcframework.zip",
      checksum: "3573a3ecce04c40f4afb4b3e1b3a1e248527621d562a63eea41f12a874adbe7d"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_openssl_grpc.xcframework.zip",
      checksum: "ae01fb97ba5952f1adb66df55a84d5d487ad9462cfd87805bbbe0adfe0318a19"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.3/_RecaptchaInterop.xcframework.zip",
      checksum: "bcb64c52317c7a2005be4538c965d1a90c888b04ee2a78f6d882b3135ebfaf80"
    )
  ]
)
    