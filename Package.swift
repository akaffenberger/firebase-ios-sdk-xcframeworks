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
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_AppAuth.xcframework.zip",
      checksum: "f7bebd78b67506271e9a86b6a63bee9559d3a4e4a6d4ce83e8716d2f7ffc2552"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_AppCheckCore.xcframework.zip",
      checksum: "c194b5ee31aa743482a89cc829efce233562d6ae1bef8df29e7224cd5b1122f2"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FBLPromises.xcframework.zip",
      checksum: "c0623b9c55f0be6426cda8e3bd7e88c0d4001b6902d1fa149bc261153d4f5ba3"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseABTesting.xcframework.zip",
      checksum: "781748824b4dd5e9a3884e688bed56162731273e69db2e0ffdacf6f0b46975ea"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "7bb80ab165023cb9e8465960d46ae27312b61494b99b470b61b3c211c72191db"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "4f984d13f76a112f14eadf8584ea449f067822ad26ea52388fa89192e0f7f66a"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "ea1e94e5a9a0de3504a006aa6117862fc5544d8722e65e1101a8de7e1f60780d"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "689a1350bf8aae1f5403c1a3236257b078d0cdb9bd5ecc19e712f480caf9b067"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "cfb368710e62b613b6ed04f4968f905cd21826800b06539998aa8cbbf9c01bcc"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseAuth.xcframework.zip",
      checksum: "2a5eadbbe1b15c19c982e7cb3dfacfcc98534024bbc3fc307200087fa675b034"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "a84068be232c7c46c6cea25d3c8c40d81a21c185615b4118eb68323f2b877d9d"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseCore.xcframework.zip",
      checksum: "b4e33be581a2f2763fb4c4836eda0a26b1528112963153fdde37eb151c966c5d"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "d4d291c8c265732a03f652be099b648257b575f60c414d415a87d54d86bb5b97"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "74fcd928cc77dcf6852ec4e9fe3314ab2f87f8e224bbf182c69b7442f17a4942"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "6384d0b3c9102dda784acbc64a47ddcf074c9bac1f8787b59e64425d45697aca"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseDatabase.xcframework.zip",
      checksum: "a0ce4eea4745185afeedb73a7e2590a4954f2391e7ab08e6a43f548aa0f981fa"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "300aca330cfe3406ba1dc1db196695f89de1f8735597e4894a0ee508c5d12bf0"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseFirestore.xcframework.zip",
      checksum: "883745ee0acea31abd833c893e098ece981d3d263581cb09cd085f78414392df"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "24aec72fb71c0e1dee64dbfbe4ed0a594587fef6c72fab45fcb01f34419c715e"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseFunctions.xcframework.zip",
      checksum: "d3ee5251aeda49700763f15a9b4f56d62e4a61c183c4e4482c62309db6ac81dc"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "6d30ddfa15dd75d4d3655d59b42ddb3fc6da4f9deaba0262e4fa5272260776ea"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseInstallations.xcframework.zip",
      checksum: "0ee580ce936bba1b2867b468718abd64852fa14ee01ed21637ff7ed8ba4b1f28"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "0f371fd18783f83fc5eebd2fa7099ea5d7f9df3b7f281675fad547b257890bca"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseMessaging.xcframework.zip",
      checksum: "7936b84d08d445a9b02d7604ee32cc6ddf4b09d31adde3bc9bfa13f8a8919b20"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "2788ade47faf8d8c1ba18098d816aaef16ab6e49170d69b0f1e4317b32d84269"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebasePerformance.xcframework.zip",
      checksum: "8f892e1d1b6e946febabff23d549aa85c65f6972ef23c971aa85f0d4b656d095"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "982a0673765e20805b26099a0a96f550021550ea91612e7d4f81ee54f4fffd70"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "bed53b020d7375e9f78020788b8791084ce7b460321fd6b4bcd5a06f68bdff0d"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseSessions.xcframework.zip",
      checksum: "56453ef3cff83ea26cce044545621c56dea2e5966199a5fadf0317db8d1f860f"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "3e39281d35732e934cb8724f4b43a2020cf3d05d90f00da874ada3ec8d2a3977"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_FirebaseStorage.xcframework.zip",
      checksum: "578e955ac5e4d65d7e8573531cf7d19c037f239bdf0f1f4104ef59e970d6f3b1"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_GTMAppAuth.xcframework.zip",
      checksum: "aa6fd4d89dec2db56ddba5b95c32a8d9e24c8d8133af952d30acb0a2a165838d"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "15fbeb926f3f1b9a8e6f1e98c32e2e8442151cf49a3b6eb962bc0d9e6e5f7400"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "00ca49efc8f7eaf7173d4a30df056d758c0b9e4dec62a91d0f83bce892658020"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "669abadbc5c6c66c1edb5330337a58d24a2d0ac1408de67ead43c7679b3d4fa8"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "0657ec053fbc70e83bb017f39dd87c8452426f2405fc59ad722e25c013b509e4"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_GoogleDataTransport.xcframework.zip",
      checksum: "f0aa977057f35905ddec64ddbf9d35f0e44888884351f90f9ac20da4448dd9ef"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_GoogleMobileAds.xcframework.zip",
      checksum: "a90a75ce6df926fca1bb4cbe4457bc6a6ec09695a89e9716006829e69c6a4124"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_GoogleSignIn.xcframework.zip",
      checksum: "a8491877975157a35b5b46e8d26674904c3a4d89b85e35e6093d692de4f9e461"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_GoogleUtilities.xcframework.zip",
      checksum: "25d4e62dc019607a7d0312f6f8891353309b3eaf19ad9490a52344f81b47ed96"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_Promises.xcframework.zip",
      checksum: "a7c8341d08ba661de57ddd63759aa1d3f6e2ec9c5eac08efaaefd9d18c9730a9"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_RecaptchaInterop.xcframework.zip",
      checksum: "867df2506740ede756178ed6814854755a6a7ac757e8e559db636fb04f9637e8"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_SwiftProtobuf.xcframework.zip",
      checksum: "7dea26c1b13de040e45e315940e1d7d14cbd3f25c9152cdfd6e492304d0e55f2"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "47f06041bdb8c4de25ca98da7f42c5f10898e5a2a61e6f19788838c71d9c1ec4"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_absl.xcframework.zip",
      checksum: "4f427550ee05759ff7f5547c802110d5c81db48cf23f8e938312872befe9973a"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_grpc.xcframework.zip",
      checksum: "c75faa34bac54d31885e7845c73865b3610b3e5ecb88dae20ddb3c5a01feb11f"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_grpcpp.xcframework.zip",
      checksum: "4f663a605a7aa50eed69d3282ec52adf31ef13ca7b08e9b6ae72bdc7c4d74660"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_leveldb.xcframework.zip",
      checksum: "e9944615f95ccb5700229ba5759df5fa64f266d5ffd426b1c7309546efd52b4d"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_nanopb.xcframework.zip",
      checksum: "639c6c1dccf00311a9662fa17aba299c398481fb1d577b69a621769a0ca8d15a"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.2.0/_openssl_grpc.xcframework.zip",
      checksum: "7466826b53eee00576dcaf4c5c8606faee3398293262515e0a2554ecd2360340"
    )
  ]
)
    