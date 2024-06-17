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
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_AppAuth.xcframework.zip",
      checksum: "31d8a0e7946a36e5876d0d504062a74c5bf25e0996f80b8aad3042122350f73e"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_AppCheckCore.xcframework.zip",
      checksum: "fa859449756c7a3b921620ee04df9bd12e2409fd7577781d295e976ffdc8bc8d"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FBLPromises.xcframework.zip",
      checksum: "4a955dd2d400cbfdd887afce761ec55090efa712a6420dc2f0bc1bab29b5a232"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseABTesting.xcframework.zip",
      checksum: "5f18521c0bdd0558fdeb4eafd7b6d2a19f73b4859f64edc32a812c7dd60f571a"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "2666ba8da0b71d22dc75696ee6b41fcb6b1f6e0c7950cfbc73039ea5aa48bce3"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "3bbceea3ee2a2b4cb3ea07ac4610e2076aef69a35431ebdcea6ef3f1876d1e2d"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "64afe060c0846c65d6e61b6fe10c406796a7b292c6f60adc5d557d509e98a577"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "ee44767379b3957761acca7e118e90a26767f831832b4d4a40d07dbd578b206a"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "76cb1e689f741fd61ef0cafb4ecc59e3e8d1954dbdb0eb610a369a25ae498243"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseAuth.xcframework.zip",
      checksum: "43eec49ef500536b1a3f4c81effc2b3cdc441f10c7b264488e8b4342425651c8"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "cb871d38142dad4bc41929f4332e595b748dca5f13ab5c12fc4bba6db3f600f1"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseCore.xcframework.zip",
      checksum: "e19080a1b700a0e50f167430cf08fa74e1aaec8f06b7e38c9cae525c5cfe43c7"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "ae4ac973013ede457375bdbfe3d8cb5e4a93ae9349a728f77fab2ba38e53d4f2"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "816e570132729ef6f5cb1264fe14937517a53661c5228da71d4b347e016df1ef"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "81d07ba7caf7ca4b2ea0c5d9050801d5717b62e60156502a8a51765788957b6e"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseDatabase.xcframework.zip",
      checksum: "95857456b019ca9b337aafb440bf8610580122f0b9e9e948daf82ce515a9a0e3"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "962f5e95f75ba57a3359173a567ce604c72c1a9faaf1cf47bf72681ba1f9431d"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseFirestore.xcframework.zip",
      checksum: "2c4048c18f2ba73555594df4ca6f8a69c3003ef613c2409211c7ebbdb054f39f"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "22fb7037a22849237c3eaf72270e0025ce11d5a420dffa49d7591600edee4c73"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseFunctions.xcframework.zip",
      checksum: "9a949f60bf1e1e9dc9eca93be190d0e086ba9b015eceb8c9d2d90d28f793a9d6"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "fa07dfa115fe6b5d4585e9d86396bbbe10ec4fc93938a2add43df56e47962541"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseInstallations.xcframework.zip",
      checksum: "c2286d3a08f13dd1a5bf08668f7351bb2679b206bb37d294e27fc0aaaadfef41"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "dfaea05f92694543aa8663b7f450cbbf9a5adad35e85efb970f4d2207e80216f"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseMessaging.xcframework.zip",
      checksum: "023cbe003629533f21e54f4220af01069a102b62933b342ee46720a29b7d3acf"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "b541a232e9ae23f120d666a31e44508780e65a6848a5d98ba6cee5ce2e30efc2"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebasePerformance.xcframework.zip",
      checksum: "4e370a5339949701d150fa351de62d14b8d97310d0ab1fc480c553ffba304772"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "c8bfc3f6a0e4cf2d90b8cdd2546f8f354603fba53e73f91100914f30f73a53e0"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "213441379a620af82eb9ac14779336052268e627589cb8128b39afa7c2107cee"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseSessions.xcframework.zip",
      checksum: "f65f8860fec8c4946ae2641d5a874da5f238236a9a8f3a6bab9ad1c586f3287f"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "38275dbe2ea5bfabf6e4b2bc9ea4b8515c6493784a6addcbb64a0141fdbb2e37"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_FirebaseStorage.xcframework.zip",
      checksum: "2ca58c94d7c3f53278e0f425baa7de50fd944c0daf4e0349df660b008b176d75"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_GTMAppAuth.xcframework.zip",
      checksum: "08b45a3701e665e17fb112e92ac9a2c97da7a44668577ac0ba2f6d8efd6f9a40"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "6ba54ccc4f96f6e00a73636e1b580e882166b4f97f5242df31ffe5b9d67ac46e"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "cfb0d9c53c98949bf6047e7c4251c701eba489dacc9bbf3f59d86a70af2594a9"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "2c2aaf49c80eb927b49b79c033f599476fbdc0d8dd814b956c02dbfff90da8be"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "191955a9f542acdc0b1b3dde8f211653a4ebe80dbe9e17fffca5febdfbd76f26"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_GoogleDataTransport.xcframework.zip",
      checksum: "e71f52a895009f61e93939d4015a2f70b000363e012e77695199ff0d68a448c4"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_GoogleMobileAds.xcframework.zip",
      checksum: "325fcbaeb3a484dc18a0cbb35e4cdc8a51dd1c7793ff6bd5e40d16f3aebca005"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_GoogleSignIn.xcframework.zip",
      checksum: "9e4c755eed83f5876a25230f4d1512a179990cd1f5ebe9ac0c97a2ff01dacb6e"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_GoogleUtilities.xcframework.zip",
      checksum: "5c13da62c9c1909e0c40cd979fa2c39927cfa429a93a47f00b13856296bfc9c7"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_Promises.xcframework.zip",
      checksum: "d11a42d9a2211d0e6a4c54e218045bd5f9bd7a2f18a6dda8abfe0a8439dea4fd"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_RecaptchaInterop.xcframework.zip",
      checksum: "ae016fb1da221d2ce08ab983c09a12a0823e3947b07f64d82a9c1de6a4eeca56"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_SwiftProtobuf.xcframework.zip",
      checksum: "f06f16f74638ac51c056ddfadfa30df7f05eea6fba07d3d2dfc606562dc4bb7a"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "204c4c15f0150848fac880734784321ca72ba3a934932213a2dd1df82c4f2bdc"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_absl.xcframework.zip",
      checksum: "a10d5abae5328b035cd111e85af6f66757fec42af70f38a278f6c74fd7a444fe"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_grpc.xcframework.zip",
      checksum: "eeb0c45fc4a8be43fd53e4d94359c3873f17c390fdb235011c8e7ec4e7a2300c"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_grpcpp.xcframework.zip",
      checksum: "3ca7e04650a99143b4a9d69fcf38564c843b19fe09e5ed0af75ffcc7ff54ea7b"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_leveldb.xcframework.zip",
      checksum: "d52a659291865f2ec0969607c571934de063ef716b1d0fc3784a99770d18e144"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_nanopb.xcframework.zip",
      checksum: "ddb6c14d7a38390c06aacf75d424c7f1ef0c7d05338fdd00dd4a2edf4c770fb3"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.28.0/_openssl_grpc.xcframework.zip",
      checksum: "c3c733a5dd35ef848eea7fcad050fe1b3931e00c58fd9eba83c9c51de5d375f8"
    )
  ]
)
    