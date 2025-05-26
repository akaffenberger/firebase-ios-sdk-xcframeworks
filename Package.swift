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
      name: "FirebaseVertexAI",
      targets: ["FirebaseVertexAITarget"]
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
      name: "FirebaseVertexAITarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAI",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        "_FirebaseVertexAI"
      ],
      path: "Sources/FirebaseVertexAI"
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
        "_AppCheckCore",
        .target(name: "_GTMAppAuth", condition: .when(platforms: [.iOS])),
        "_GTMSessionFetcher",
        .target(name: "_GoogleSignIn", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_AppAuth.xcframework.zip",
      checksum: "1fd135f2edc738ea4bf5f875943731e0ae910b5ae2dd382d8e42b9d64152a45d"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_AppCheckCore.xcframework.zip",
      checksum: "da85a8a1d717003e959f14a45b0ef08543b7ad63f3572cb4f8d08a1fd482c54f"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FBLPromises.xcframework.zip",
      checksum: "1653504fefe95362fbb92dcba06c8a0168e3d952300bcf25812f7c5cfca265cd"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseABTesting.xcframework.zip",
      checksum: "b2526fdf55c01cd47a8b265bec623b48ba697062fe254252509fa72fa9e6a5d0"
    ),
    .binaryTarget(
      name: "_FirebaseAI",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseAI.xcframework.zip",
      checksum: "a3f1f1d0391938dabeea777388e9abaf7e7380c888a3cac3aa8fcc16682763b5"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "6b24037501e4d26d7b3dd4c706f5a115361847e4990ebfe3674ddb157308894c"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "bfbe474de859b9702feeab86a3feb7f4bc1b352e747c525993946e1fddcd3594"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "014f4010735377fd02e3ad6a8a703ab0a1f5611b441b963786be95ea044700cc"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "2328bfe078c4c48fcd68bbbdc86b63d3c61268cbd6d140ade9f9bee52b13652d"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "f5ca893b531ffe8b3f6e69b9bdf205655d9132ce0530b6d03d9f7b3bed65d6c1"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseAuth.xcframework.zip",
      checksum: "ed3bf93a192da97e412c874cd927db487c5bb517377c8f9601fce73d423de648"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "e55b9b3d22a8b0f7e1bc336b2918456cad9f3f333d11ceb208848c976d1f91ef"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseCore.xcframework.zip",
      checksum: "133ab07621f1ca55ef3c02e348ec4db394906acf37918e01069782d212f2c5ea"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "e2c0950c53344a51e20fdf97810c0f0537f540e97396c9a108ad3ad7b9276c2b"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "b3955c28842f89e469c17204151366ca1fbc606c6cf10fb0cfc84485f7e18821"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "300bf088a9101d212e02b2f16d398b1910c725781bfe8b7a7003006e6fa3b141"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseDatabase.xcframework.zip",
      checksum: "a901407f951d92c724ee46c2150d0007cfa09b3e91d88fc2af78939375ccdb80"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "d3a1818adad9340b08e0a1dde84e1fd16f876fe7a2c46efd0cbbc587dad965fa"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseFirestore.xcframework.zip",
      checksum: "b93301f881fa342f26762e6c254f3f865b8f156ed6f8a89fdcffb89ae73b6cf9"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "880ba744e38a98e5bdfd3e78d76481646824e7f7f34ce70f0b3049fca353bf79"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseFunctions.xcframework.zip",
      checksum: "ed4036c3f59beaa34d450aae6ad051eb9fc9277ca3ad525368cfc45ace5841a9"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "7e64caca643187520575895a7096afeb75104a8917a061b8d298b35f6bea6f3c"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseInstallations.xcframework.zip",
      checksum: "c82b85c57f9d7c2237027430ffd72360f4bab2d12b5672af35208a00c300de49"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "b8db9097904ce9bc49639fcd04e2151a252a17f2acae2567958d1a51e1c0884f"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseMessaging.xcframework.zip",
      checksum: "1fa5df780c2fad5135ea409afb585a8ca8075e3c6607d05e7146f311e913eaa2"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "b75a03ebff0ab902ee7cd6c8e379831367af5545c7896946729c1f3a8894a00a"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebasePerformance.xcframework.zip",
      checksum: "32bc4046c2c6d90d095eb2f6a8b69944670f7f66241b00f53e0bb286ece8245b"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "cf8ebdfbb42171dd3dd441229c2738ea86b8da53fbf89943c5e1090a566e773d"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "2c78374e3df33a26287c0142115c6d8d9612520e62a49c2cc3847165490ee94e"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseSessions.xcframework.zip",
      checksum: "e09ad1059f4a7d03c6fb9a5ae8bc983ea1f23bdfce32b033dd56cbe0ac6c3214"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "3bcb9c5626aebb258b28c518d8c4151f66002918a406f7773247402c7f6793e9"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseStorage.xcframework.zip",
      checksum: "ef44cec175ef8ce151f4bd432137fa3f9c715735c6f5ba3ecd78ebec46a7d7bf"
    ),
    .binaryTarget(
      name: "_FirebaseVertexAI",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_FirebaseVertexAI.xcframework.zip",
      checksum: "8f0cb925ffbdac7664b7f4470648ebdcd743e53a0ff37962815f3cb10fdd6ce2"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_GTMAppAuth.xcframework.zip",
      checksum: "df2be3dd0b620a89f7816b8dc458ec46ee7db46850e19b331a79549d5cb67d8b"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "3b8617baf8ad047628e6848061b9daa0759432c1b863bffc5ce171fbe72ad0b6"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "ef1279d8a42024d259e3e5d3bb2238bae7a00a4ab804cfeef5b3d0387a7b4c7a"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "57aa0db319b285c2845a82f812e8f2975bfc6eb6b32528dd5974f706113c0eb2"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "9cb76dc213da6f5884a26a4ec53d420d43a944530d7d350e65fefd99f00fc406"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_GoogleDataTransport.xcframework.zip",
      checksum: "9f42e972ef9855c1b4cccddf7a370d497c036fa48e374173bfa8446bb11d4365"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_GoogleMobileAds.xcframework.zip",
      checksum: "1c640ea464c293255c1c164ead253b02e16a69c3a40d8bc3b3593643e077b902"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_GoogleSignIn.xcframework.zip",
      checksum: "04fe8b58d5c8a3b094f7ad4c66c6d1ca7708fe2418a4082ed027697929c7cc3f"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_GoogleUtilities.xcframework.zip",
      checksum: "ae6c2b087eb60a47aa6a79d5cf4fa1aaee01a373392ffa689e85e30cd36af828"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_Promises.xcframework.zip",
      checksum: "b224883d381e1e0121d41d0b0ea0845799bb55068a24bcd95fa26bcd687c13fe"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_RecaptchaInterop.xcframework.zip",
      checksum: "0cc18f8511a4a9606c0810f0c4b55fd7e3d2bca71c302a0bf658bb0002d28476"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_SwiftProtobuf.xcframework.zip",
      checksum: "9df1186079333d96b959487212b7b040e5a017679ad07346171d881423d09fe1"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "f615d9a31bea487d552addd99e991766c5aa11d634dc7dec82faf0a9fde7719a"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_absl.xcframework.zip",
      checksum: "871f0798431f7de9fcc43c52427c417186c5b570cdc88a33cea91afccd7f997d"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_grpc.xcframework.zip",
      checksum: "8a53fb4a663d66f7874e17e03cdd5ef6ec4c4cb59c9dc2f7fb46ec3f0547c5a3"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_grpcpp.xcframework.zip",
      checksum: "74a87e6c74c57e0642c339aa8dd65a6464bc94a70aa9535e4d474a439a2b6f25"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_leveldb.xcframework.zip",
      checksum: "38447c40fd0b10f2bd91bb5f1500761e9aad44b1108dd2f544c38383f27f52ad"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_nanopb.xcframework.zip",
      checksum: "d13523b5b334117dd05d6f137d2d4e9cb223b9dbcda1204a92e6d26a10c67557"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.13.0/_openssl_grpc.xcframework.zip",
      checksum: "aee92119713ab106327226c0b63b50050e35183361d0f3b64beeac5a394801c3"
    )
  ]
)
    