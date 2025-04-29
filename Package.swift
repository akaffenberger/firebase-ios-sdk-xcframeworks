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
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_AppAuth.xcframework.zip",
      checksum: "618fbe49fb3b778e90690df693a54c59db4f0fd1824a4ddcaa38b75aae692584"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_AppCheckCore.xcframework.zip",
      checksum: "ee2cf460b5b95f96e0adb7d1d12ef242fee7c96768f2d2a650e3fbdf3755e512"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FBLPromises.xcframework.zip",
      checksum: "833bf6d72fd28a9f5db5e208cf1d1d52f6c3307f17043d666dc00d4e6415d3af"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseABTesting.xcframework.zip",
      checksum: "a7e60f93c3fc2e6982a5d70a36b1f6c07791feca8244b334dbdf16f1ca756b2b"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "7e9f57df0b69aed64e3d25f36ed388e81a36d372d652f3a8921e810f69c40cd7"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "bbce5ef40b8535d66ead3a4349beab6ef220a8d9e2976e7a2154555b9e8e63c1"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "8a0917d89fa820923f2d1cbb336ceb28ed9a66651d5991e7b598da3f3adffb17"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "07d633d0172185bddf03359dd598e4bd4775fe04f46217f2e638d9d13d2833d7"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "fc339a8b041b1d3340055be3e26bf8957788f13b12b3a6f1f3358f58eb70954f"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseAuth.xcframework.zip",
      checksum: "51c6a6a8357343801d6959fc5fe7fd57a95ee04a4c590e6cd44460b7202fbbb6"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "7eff35405a8cbb8f852642202eaa939e16e4f52d32cdfc5d9f288a9c69d9e219"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseCore.xcframework.zip",
      checksum: "3b11a926eb99c4f53fc62facf7d0e6e33c95a54ec20bb2b61069a1d054b16c2a"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "95c43ce6fc1255d03ebea4370fa6d429ec89b8e5f32e95cff286c1c64379cb7d"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "7967a48c9b2a4c51249cc02d59ea45a8c57a6ffc041c06d3ef9bff7cd1548e68"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "783bdf6c78870071a0d64e36532bf4d718209e9b81ebdf57a0bfa97d3db787a2"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseDatabase.xcframework.zip",
      checksum: "d9fcf8d7456d04597c3d0c11293df56cda46d1a90398998eeec114f1ba3e4a30"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "43e3f1ec3c35dbd478caba492b912fc5819871b7a26701d9bf0e86c925e2e0f4"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseFirestore.xcframework.zip",
      checksum: "42ab08db67bb5dc56a1901cacfd336773c0793e76d915df47708a73fc8120c4e"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "26ac0b438b36dae9d94c87f2192e0c9da07ac18baa52ce8736901a71ec2ffe40"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseFunctions.xcframework.zip",
      checksum: "37c62b3a08bb709bc569795a8c6e5b6a2409fdeda68492370bcffb14e51226e1"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "110cce7191451485f508cfb10a2703baf37494065dd4d25e3b0c27d09f873a95"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseInstallations.xcframework.zip",
      checksum: "5a0e6c8e74e2762cb249e39766e7309538eae3a8b8728724327880612b4bb78e"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "253c582cf8046a7da148399e2bcd81f33619f9e813c2e5297b4d9e5dcd676da8"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseMessaging.xcframework.zip",
      checksum: "a10751962aeceaf87056e931c68cbb5b370314aba18e32048bc31ea9b3abea84"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "6b4ffb2e580ce5b90e9ce24408522a062e9212408bb595dc9a011d9125781191"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebasePerformance.xcframework.zip",
      checksum: "424274d02cec5b7e1cd38e7bfa2bec0a84ad087945afa5cb63e8d1c5321e216e"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "ec083cc6ae834f700b254da6f003b077687e3fb33b29f753b23a591bb08655ad"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "bcbb58a749611ecb5a07cc88c04aadbd796bd0f4d011326ed823b398886c7930"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseSessions.xcframework.zip",
      checksum: "a28577f71d5bb78ad7d6862de97847d8a495006efacfc10180a4dad0b3b896c3"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "b896fb2decd662cfd88b4cc032b683717bcbd54d6e44e40862adce1a5b0f2b9c"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseStorage.xcframework.zip",
      checksum: "d87e03bf85388e2f258547d7cf5e5a041518fe8df5d868d6af96c57412b0ab0a"
    ),
    .binaryTarget(
      name: "_FirebaseVertexAI",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_FirebaseVertexAI.xcframework.zip",
      checksum: "574b61d6c8b3abb527b42caa988ef2101cdec791c5cb50b0dc8fe86f39c25738"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_GTMAppAuth.xcframework.zip",
      checksum: "ea427e5075d34d30770847667e4e9e04491258fb78c97796fd8ad04f2f71716c"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "3e906564b7b809f51f1f660e6d0a7825c61958e03e5f0a287bd866a31d02bbd1"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "6917c7c630938a7a5ff680f01e6eceb8bdd47865e1832271835d3f2bc3adf743"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "8100b775685e2f54fe2d51b30d6578b8313e4653eb7f76556bc1a419c8d5fef1"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "79a17162e701f341525ccd015b5c6546faea99e654e32473156faaef381cee4a"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_GoogleDataTransport.xcframework.zip",
      checksum: "73007ed96754d8252c7593ef3a6ea166f5eb23b7e39d7ae67f4d8b4fe276958f"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_GoogleMobileAds.xcframework.zip",
      checksum: "c1bcee2105845ee94349e5df17d3f4e1cd1fb15ce01b935594d9530230b8e56b"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_GoogleSignIn.xcframework.zip",
      checksum: "2b5799bbd4dc8038a7597a49b59df4e8dbc2ef6672fbd14ea3deea8010800b66"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_GoogleUtilities.xcframework.zip",
      checksum: "8d52baeb028854bfd919bf367f2af25796edc7dec59d65db8fba1da92a215d07"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_Promises.xcframework.zip",
      checksum: "988919896d5c6dbeb61a10036f387e4f2d183a1ac13b61ab995ad1e675a2f0fe"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_RecaptchaInterop.xcframework.zip",
      checksum: "3ffe498c04cd7d076b7c10f2dac827fbd51f21920664b484da776838824313af"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_SwiftProtobuf.xcframework.zip",
      checksum: "05008c1ba3a48943a3520868c300e53deacfd1d94cc0b3b60ac051bef0edebb6"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "93eb91ad75bdfe1440ca28c7962f45b4f4064e09930e4d4974a849148706819b"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_absl.xcframework.zip",
      checksum: "1defa3c3c5bca45e7cf6ff7337ed0e8f846f1866bbbd37d5bb876fccc36c609c"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_grpc.xcframework.zip",
      checksum: "66ffe700fc606beeae52b70c1e3cd92fdf77301981d750d139ce4dab663a5103"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_grpcpp.xcframework.zip",
      checksum: "1436cd285ec72393e6fafb3f1065b52c2777299aff0825cae34d4ed1de6a367e"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_leveldb.xcframework.zip",
      checksum: "1d50c77cd6c6f23584ea6de759497cf529d67c902e52896ceaa873c2172a163e"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_nanopb.xcframework.zip",
      checksum: "9d92bd634334476a650f6ca9da2f43c9f6d41d4d9537212ceec6796516f951fd"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.12.0/_openssl_grpc.xcframework.zip",
      checksum: "4fcc211a2e136ac1380fa498eff5583886f91c691f5858d4e752d2c6a6b15211"
    )
  ]
)
    