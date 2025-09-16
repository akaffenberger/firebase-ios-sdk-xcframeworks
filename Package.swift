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
      name: "FirebaseAI",
      targets: ["FirebaseAITarget"]
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
      name: "FirebaseAITarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAI",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension"
      ],
      path: "Sources/FirebaseAI"
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
        "_FirebaseMLModelDownloader",
        "_GoogleDataTransport",
        "_SwiftProtobuf"
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
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_absl.xcframework.zip",
      checksum: "f8ebc68064a3ee5a3610e52a3d9c6b2385bcbafdc8738c88c163a11038753a1c"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_AppAuth.xcframework.zip",
      checksum: "4624204db32b9e0072222f702ae6bc122a11fc1c60eb51c368a246886984d88f"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_AppCheckCore.xcframework.zip",
      checksum: "0fefa0b167a42733622d6c5b4caa0536b705c9ecabdfb0738201cc35422dfc5b"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FBLPromises.xcframework.zip",
      checksum: "cc35218d65f1c3c4e6a83fe73e60b70044c1004e3568e3820e98ba7a00905fe6"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseABTesting.xcframework.zip",
      checksum: "50462c4c1980edbcc429cf2628f3d3947a6359c6b98383c3c0912df317150c3a"
    ),
    .binaryTarget(
      name: "_FirebaseAI",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseAI.xcframework.zip",
      checksum: "d8aae09856c891cb5d0a07d7e44c471de34a6e3a39810f14c2968f3180829500"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "3c3bc9460b99a4a88cde48a0f39fb4effba3e15f8b4dc68c3c542b71adc21017"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "31d6c4e61dac24990c78ba08e89da1fa3f4ae9084bb37df81ab3886b7e9d0e44"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "712ef4436687f1d155f2dda071c6e1e5ab8bb46a54b31462eea4f2c3b2db784a"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "a341f0e253835d68004202e867f66dfd75275a5c83806ae05400e5fc098547e6"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseAuth.xcframework.zip",
      checksum: "902ad4a6ad0fcd30f3d2533966a6944ac1f749576e0794b5eeb109ed8a1941b3"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "7cf4b09ef661292d3ecc2cc4a79f8ccb270a25a4eaaf9d6c50d96009644afb5f"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseCore.xcframework.zip",
      checksum: "1fc30c1d8c1b288018e69436489eeec21bb9ad671a45db58b57d8366a8fc2192"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "2f723ab834f5c6a959db3ef5f36ea5e6dc710ea88ee63db31e71995b74c53861"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "affc4dd4115b412a012f36dae5bfc490a5a8b24df230aa9c8b7c6a45b0e0a7ef"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "922f5b8d48c43c08da49170ab81f2cb6cc5fa979cabffc3384558e79e145547f"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseDatabase.xcframework.zip",
      checksum: "7f225d44380bdb17a99392a0527703f64997469dbf0d4151c33037b246e8af3a"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseFirestore.xcframework.zip",
      checksum: "494f5fab97fbac9becc8717157da5863db7b6632cf653ef22848dc95f83670bb"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "171730d51f32d2d51e135c6eeb77414e93cc203586babd72552d4588a42e0bc6"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseFunctions.xcframework.zip",
      checksum: "c9a1018b6313195a449abd15b2f1663d149fc0f8a20d7d04c71e96680fdc7869"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "1286da1b30e9b6e46f7a49dce450b9aba4247f5845173ab9109b0f445fc6921c"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseInstallations.xcframework.zip",
      checksum: "75151869f679d3ccd8834ac66d12041e88badfb8163b004bca856710fd1abec0"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseMessaging.xcframework.zip",
      checksum: "22ba694ebf0f2fbb7a524a136745e7f05fd6b8ee053ce9aa96941f1bd4940321"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "8b6e551cab53f59745ccfb470fdc6a865be043e8776de8d0ad9cfc5d45f910a8"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "35bc9d17923ea58c2211cdb2cd68c909d6ee45451ccc4bf5a66c6dc4ddad9c20"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebasePerformance.xcframework.zip",
      checksum: "71fa1599da967664a2b4bbe77e8a0d3bc9280510de37b7f9fdd2b018c4bff93e"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "7605acf05699342e2dbe77dc66bcfc2da63ea7d0c6ce9aff2fec980e4dd521d7"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "c27617c3e079e2cd605ab94d3ceec9452b77502d2dc0c2be5f7611abe3d37e17"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseSessions.xcframework.zip",
      checksum: "2a237132d912ad3f4079b315e501c6b82cf91bcb47606a4ab77eef2b30bd2935"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "163a17bb3140a671b9b8df758d32c2b8d3f10986ed08637fe928cf9d5f745be6"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_FirebaseStorage.xcframework.zip",
      checksum: "92ae38413d708ef8bb94ce78f112a9266580877832c6b67260bf8d5fe17f3ee1"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "3a3d35a48703b429c7f3f99b582c3224ca57c09c551e22372d798106cf27ba9d"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "e336a657149faee2be82bdde0f8a1846b9e0f976e671148a8701399b9c26ada8"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "d4048cd1278afa23400b1e22cf5926f0f739d97af89e5bcf943ed3370b0003f2"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_GoogleDataTransport.xcframework.zip",
      checksum: "cf67ff9ab334e0857f5a8a04ba1e36ea64dbadb2c10ae44aaceb19519d44b2a9"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_GoogleSignIn.xcframework.zip",
      checksum: "8ecad7c82b16b3223ebabbba89cab7c7d2e63c8c0eeb8a10cd2b4bebf8043b03"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_GoogleUtilities.xcframework.zip",
      checksum: "ac410d4737d0f55a74546997c7842eadbf972e3f1469c859f8a0a3804ad24837"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_grpc.xcframework.zip",
      checksum: "72eba1d8081bae1c3ced69857b8b1835225e08a62f7c2b93ec47d798359660ed"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_grpcpp.xcframework.zip",
      checksum: "fa064636705a7f2d6f97592eed53f06adf931c6845f8438cb0ab78cf01fbcbda"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_GTMAppAuth.xcframework.zip",
      checksum: "3c3af4a6fd0b05c3dc3ab02242fd214ba05b95f53196f88b76f2648d8fbbc5d6"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "f180db0cf8d4fb18f806247d5d5c6407e7b499a4cceeafc40c208a25b4cca536"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_leveldb.xcframework.zip",
      checksum: "86faec184aa78c5d81874ee7fc925ad330fb48637392a2d36812155f6819d855"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_nanopb.xcframework.zip",
      checksum: "c2740c628c70220388ce624be124ea851091534a6d73702188538138e93f93eb"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_openssl_grpc.xcframework.zip",
      checksum: "9d44418107f8b173cf59ace55f5dee53728500a0fed83d7285939e61dc47ba48"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_Promises.xcframework.zip",
      checksum: "09279cbd0871965afaaeb1ab497c1e1199c758b08e3b027ceccd78c67007906d"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_RecaptchaInterop.xcframework.zip",
      checksum: "71e1f87873fbd6fed8c2f9d89deaca7f854ab09fbb7a9cbd18dc642df55fe090"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.3.0/_SwiftProtobuf.xcframework.zip",
      checksum: "d66a96c820a47feed6b0ecb7e16681dfdd5e6de4e0a9d69d33f8c75e79661a25"
    )
  ]
)
    