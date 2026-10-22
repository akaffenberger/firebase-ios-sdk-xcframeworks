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
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_absl.xcframework.zip",
      checksum: "f0ba6aa662f0ec89e6680da5021a5e235638aabd695fbba11b572b75d41259b1"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_AppCheckCore.xcframework.zip",
      checksum: "ef4a041cbe120d7821558f740b7557d97ad4585b597571e87489e61e27bf1948"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FBLPromises.xcframework.zip",
      checksum: "952a13a157222c2a50087a1942e3cf993099a0e3963dd1d22a2c939a72d08ddd"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseABTesting.xcframework.zip",
      checksum: "e4868433f47efe66af4e8239d2345129f89fa2c6faff00145cbf0a837bdf4e34"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseAILogic.xcframework.zip",
      checksum: "c81669ac9a4f1f8a5360844967810efe41fb5bd7375c37fc3c1eda764248bf9c"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "ac7e699e2af279f96ba8965ac2124f8566dad5e784f3d56e1f4ee0bed34ae4a3"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "7f58563a733c991b06569a797511968b53d68ddc2b02a9b4d6dd4a6fb1060c69"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "20944a5b47762a24e2e6102d1205e20039e83456a8d319a0c92b62467c51fcd9"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "509fa69d7f205c04e7a5505da48eb0123775757bece5916949db8515c43387ee"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseAuth.xcframework.zip",
      checksum: "82cce01a93e2dff7ce3352343be50202d724af966ea797a43a32070ce9ef7579"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "4df0e78fad06d01e3cb699232fa02e414a231bf84bca81c4737206f0385b20ce"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseCore.xcframework.zip",
      checksum: "f0c9efdde92a52fff11c764e853dc89e9f1af4c02aa4ee6bf5a16e15d1d36ce2"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "feb0819f08f851d29a317a8d379f9ffd172fb72d3e6f7bde769925dc8866217f"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "e3b3725ab45bb7459ae875a96f29fd3446c1afbe1ba5931349f50791e63dea46"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "44ab9c89b180826a13a0951aaacf6ea3a964b6763e1a9b23f327e9a9e2c6088f"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseDatabase.xcframework.zip",
      checksum: "68b31e0234040a96f16122659c4b49468a40a5b5b1f34359a817934f607750a6"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseFirestore.xcframework.zip",
      checksum: "b5920e71f83b99d68b25ad3fd4668db067223ae87170f844154d410cf72b4f72"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "e11e6cdb345e6895811e4706d9dbc9f8d80e11777f5f7331cd0cc954dfbf0c55"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseFunctions.xcframework.zip",
      checksum: "d28e5344e36aefd1e55dfb9363e43761b720e6a7deba07e42d32f12340979a86"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "35657be92ec1100bb396564176e338005224b2d80d481973707246d6af4c6313"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseInstallations.xcframework.zip",
      checksum: "c6981a0237145078bf9cab085053d356914d50c3049937f72a97df50cc8717c6"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseMessaging.xcframework.zip",
      checksum: "3bcdd2d37750955c8ff7fbec08ae2b405dec61ed8f323dffe1bd7fe09f112724"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "16c353e857925635db9aa545b203eaaa8f3ff2c0580b80059bd452ea9d3edf99"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebasePerformance.xcframework.zip",
      checksum: "d37dc64510ac3a6007e3ea383f435d75aa8e43e037cab85eeb3cb858450aa69a"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "eb648381595dd69d46d97bacbe4c7242e6a00de185b36b7e7e50444f4617e294"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "1bab62e38499bb36ffd92176dc30e321497cad1a903cd4342b2fcaa186e3aaa9"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseSessions.xcframework.zip",
      checksum: "964024ae33452476331f3e0f27f88189f605e876007d7fe1b244bd5386a7ec4b"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "f33d86b796c320241dd4b3226eeb4978980348e1b8e9f0348b1201f01b037092"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_FirebaseStorage.xcframework.zip",
      checksum: "c4e27a1fa83d4f0538d24452da7900b2324c1474b9020ddd8d6c04933a41b643"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "bff8551b24f0a0f691b14d7233113bbbf601cb9f8932d437735a063e1c14d813"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "e685dccc3ffb7ef23a49852d060492a60293254b79eba4b3fe720b8dacd4ff3e"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "7d0b74b9469f508765b505999a6f77942271d6aec39406d605c21b92407e2909"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_GoogleDataTransport.xcframework.zip",
      checksum: "5e38dee89ab7dbbb686f69b515897753051fb5a61765139754b886b0a555b9ef"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_GoogleUtilities.xcframework.zip",
      checksum: "0946cb27d50c89cf45b01d9d633145fe3a1e193be514e8d2d6b538cc9fe621f5"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_grpc.xcframework.zip",
      checksum: "62a5d9497b4099bf5a4803bc907726b03c45e70a201cf205339ca70097b22916"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_grpcpp.xcframework.zip",
      checksum: "1ca1ca492cd25b4d8180d089080321bdf32e5bec5c960d9d135de6dd4d433024"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "35df89194e0cf697e6a3317f5ca3ad8c6e07b7a030d8decdb20151fa2103e172"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_leveldb.xcframework.zip",
      checksum: "10d14e11cc24ac91a3e8fedff64dedd2bab40842d89803184774970cd369f59c"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_nanopb.xcframework.zip",
      checksum: "f0e4f8b8f8179a8c762b49fca8b452abb416d567c6668b496ba7f7ff054de723"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_openssl_grpc.xcframework.zip",
      checksum: "1f976f2dd5d06cc4443dffa4aa726a2ccb320b81427d22116ab78253f6319d20"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/13.1.0/_RecaptchaInterop.xcframework.zip",
      checksum: "8000db5360c0223b17c8cdff7e8696cc45bad49686820c3361df8ebffdde289f"
    )
  ]
)
    