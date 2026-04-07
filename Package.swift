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
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_absl.xcframework.zip",
      checksum: "1177543f318ac9fbc7cae13b5f8148cbc2db90342893c98cb0066465c193fdcf"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_AppAuth.xcframework.zip",
      checksum: "c9081cfb3e7fd560cb0d5e23a7e05f862362807aef1b58609b570deaabb0901a"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_AppCheckCore.xcframework.zip",
      checksum: "ea6d1911434d136a32f84b573c33ceace0773c02b24aa2edbc6af6600f73dc1e"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FBLPromises.xcframework.zip",
      checksum: "8274728dc05adc91f7f21b04b91f37062175f3413b0910bbf7a055ad457b1a8d"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseABTesting.xcframework.zip",
      checksum: "5db0cb6a3fbd78abb2636c00f13a9b1f8544a9d6c2c85a4755ee84677b64e85c"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseAILogic.xcframework.zip",
      checksum: "5988bfc4c4ab668c7b306587192ec9d80769beef8e0e61478f46679d3fc524ef"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "b22732f392f140d76ddadb458bfdca17fddd609edc65445e0f9ef8ed3b169a8e"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "aee8007a7ec59cc00f6ab6848ea6f625c2a7a831f54a2eb2f820615d5dda928c"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "8dd48e2aabdbc16dc3732e4c59a13b59bc0816e38132961ca31118d9c84187b6"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "8a6f66d68a1464846b76bb0f51ad2123aa2688cacc0702849fa9a6551b29c4bd"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseAuth.xcframework.zip",
      checksum: "0a4091a4ffa17316e58db7f5549cc72899386472d8e9ee134597ebc5b51de933"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "6036adcf6fbb91df7e2ce2346d4a1062abfd0b0d411eb7ebd3ef741b3cd491f0"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseCore.xcframework.zip",
      checksum: "6efa5328888996ed01c5f844e078240e113d8840db9132845a2085e035d9f33c"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "315a31ede5edf713aa715fb808f093d0731ff8dfb5c6dbed526d64255b461f23"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "112f3faf05ff3d62461a6fffd4192d2566f24d24e6a8dced36601a780c80597c"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "f0b069d0acdb6ccc559fd57ff0065298f87175d0bb8e33b64dd0a98d4fb898ee"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseDatabase.xcframework.zip",
      checksum: "f5d68fea900e90bbbaa4fa9f955b0a67fdaef7ddc44fc5d894f091994a99c8a7"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseFirestore.xcframework.zip",
      checksum: "93f3504c55280e0ca2a15db6107d8cdc02f72faa6fec0d6b88b777f8ae63b863"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "ca3a590f2a69ee99d1df040888d89b817722ecd9dbf1c300989698c591207473"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseFunctions.xcframework.zip",
      checksum: "f435c330ade970f2e0c057d825daafa4cf104029446dcb0fa235026c64e2828d"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "b0103cd42c3339980512d488ae459e17158533a37607c2098dfdd64ed9087bde"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseInstallations.xcframework.zip",
      checksum: "144a63bdae75f7af891e261c9dbc31ac430499b96bb275413045b1253802d9ec"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseMessaging.xcframework.zip",
      checksum: "d531d4fc4c421b3b72e30d5bbda977ed6b94e7a70db14cc2656729c14937da9e"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "d1c0d7e2e4303c44ca061753ffd399e8ea80d312d13e176cd3e77f9a53245f9a"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "a9c6bbfb625445caa80245788e77cc94d21799b7ca5f134b46296434751d4d6a"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebasePerformance.xcframework.zip",
      checksum: "aac3f0541939ab3ee1e4eda1bf59b2bc6fa878e799c34c2108ae8404ad0280df"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "e2cd38edd72c9cbd63b90d2796272fa4086702eb0a56c0e21eadeaa93d93f0c2"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "f8641ef9fe92d50e00666f8e8f044aedc31ce5432b7c6091bc6d5520dd749859"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseSessions.xcframework.zip",
      checksum: "a3ac7458bbbdf2084c6294bfd00b363cc57391dd2924b9856b023d22c9ede9c1"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "29c9b39aa2c79f352258c7964ecc0c19a56ff3bfc5947e7869376b15fe073694"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_FirebaseStorage.xcframework.zip",
      checksum: "7865f2aa3f29c126f9b04ab4ce819a0281174ef8105292244e0a628ad8a44496"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "f3dbd35df576b8622526730c54faa6f554f0c3911df12eebefac5c719977d350"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "49250bbee5492c2cdb4819f6c71c47d058fc1d32a29bf943d59d69ef67524963"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "8a55d316ddb1b025339bd846752beeb06985802b6b026925167876eaa661cf2f"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_GoogleDataTransport.xcframework.zip",
      checksum: "6d47c6c260aa2de8e450ab13006a92251a4af308e850cc3cf10248d40f34d289"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_GoogleSignIn.xcframework.zip",
      checksum: "bef7fa642497f5da603c0f9c7d54998cd7762409d34d04ef3abca12e57960b61"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_GoogleUtilities.xcframework.zip",
      checksum: "d03131a8cae47b14a72cd6163ed8b81d337c147dc36fe8c56532f8953158681c"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_grpc.xcframework.zip",
      checksum: "7b3df2b004f5b3de8e49506cf9391fe04950f21522d454a866ad1bbbfbf175ae"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_grpcpp.xcframework.zip",
      checksum: "8c87742979ffd8092f3d3673039784c2bc1f3c872578f0af715e4877fc931828"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_GTMAppAuth.xcframework.zip",
      checksum: "e2daddf91b6f4008b85043d81bac3e74da75ca6433316438f64ebe5608ac6407"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "121c5bb94e26dc499bf7b6671a764f852b5ac822b3e20936c03d7f37e5958e40"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_leveldb.xcframework.zip",
      checksum: "075791d0c410b6ca2c17da1aa1fc9f3629679be571c1fe34b601cce5374c12d5"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_nanopb.xcframework.zip",
      checksum: "3d6933802051e8f004c481dd53de46bd1c36afb16a825de58c1a7b5ef765c377"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_openssl_grpc.xcframework.zip",
      checksum: "f14cea509219fe7a53524057776e88f490a1598535c939af9dadb31582b9ae27"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_Promises.xcframework.zip",
      checksum: "40b8864d3984691752c53f2ebc1526461c62f98d6ecde08c5364301c71576b20"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.12.0/_RecaptchaInterop.xcframework.zip",
      checksum: "52a9af74bf9893bd999dea2801431c7011661873c52c63cdd21012f93bef6ca0"
    )
  ]
)
    