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
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_AppAuth.xcframework.zip",
      checksum: "803e6dca01b797ea8ab3ddbd295bbddd5c62678296c89f87279ffdc079f36b34"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_AppCheckCore.xcframework.zip",
      checksum: "b367e011fd9d582a49b57ff960d0d75b4e15cf5e3760ee16ba54973130fb67cf"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FBLPromises.xcframework.zip",
      checksum: "6c531ea9544cb93a0ff824d57b0968d0d5021010047376ccc30646303b16c0d8"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseABTesting.xcframework.zip",
      checksum: "67e56812366ed5d1be6f6f0588848d8d45c918eaa3838c14c94b604dc4d908f3"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "80030e072f950c5afe49b840820b0fa85a4c06a8dffcaa11fd22c739367b65d7"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "dff788b7255e149a3a69b9174a65caee4114e3b466b56836097d9584d2a8c39f"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "4e4e7045fc177adb8abb6ed36c3587a1e2a381fd5a1d9134fb2eaf7d9a1a7ab2"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "63bfe1070d628aa261b7a805957f98b301925f36a12bec99bdbb47c3a850dfe0"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "59b5d92a7a0a5ea2743443e047167cda0571477f22b3da0bb3f434c1b4458c1d"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseAuth.xcframework.zip",
      checksum: "fa50c2bc2440cc33844190341fc8b6dff59ee68f56b7f2b035b71c6078c25dd0"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "8a0fee984c7a8d367f3a6abd30aa0a24af8d5242c8fd1eb508b35bf40f8760da"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseCore.xcframework.zip",
      checksum: "e243589e70a3b68b09b1c4f6fee09dec6bc10dbda650a094e71cf48672841e3e"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "6e3cf5a02bdca66b38e434836c0dfc09e89be61d443230fa4c3eaabcdc954053"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "eafca7f255822df927dc7ee6fc4d41818036af007621508a98962cb1406a1a7b"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "1d1ae616e3742c06855cbf6d936468729027809344fa84dbf6083870d78a3ff5"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseDatabase.xcframework.zip",
      checksum: "601cc51d4783413c8bb84b7082117b96321a1a2cb959f61197e71607e7ff4a45"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "d04aefef3106b3eb96ac51f719ccabcfed915c1a202b25275c134092c64743e2"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseFirestore.xcframework.zip",
      checksum: "5e9b6698c251db780f998156ed88c5e8bec8f55e9a1782598f2fe7c1d4314f83"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "ea384edd080dc584eb0d76790dd4265807080ced779be0bf3a206058f35c80cb"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseFunctions.xcframework.zip",
      checksum: "2f4ddb460b85a64e72697690e6de609775c42fd678ff7f76068f9fd7e1960f96"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "db312bbaf4b695c582549596d5250c540b6cb9037686dd4f6bb81f540b43cfdc"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseInstallations.xcframework.zip",
      checksum: "8be6f0c3828e81b7b526166fba582ece49963e1ce88cf79357816c4d7d57fe06"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "64016eacd9a306285d3c9d89cdde044ffc8a39710047a01107a9f5a9bba02151"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseMessaging.xcframework.zip",
      checksum: "991d4210bc358d38a6afdf38ee02d94b12d6f8b2ae10ac1d6acc48d969ce7237"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "2655070b5c1b4a47f51807360ef94d984f25bab5394dc642e50156e06db407df"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebasePerformance.xcframework.zip",
      checksum: "a1109bdb56b28018217f88a649883796ec07a81d88117fa299dc3df1ef29477b"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "0ff581e96d506a3cd8f9245a4ecb22ae8ced3d3e85f3370561580d58c2d4bbf1"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "cb5dfc7d6693307095cfbec42e4c3c99e90e6b9d8d8a00e0d304f94757d4b4aa"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseSessions.xcframework.zip",
      checksum: "dd82ed9994cd027674cc8db8888b4fb9d2541a4d8f1bf306823583df52b0b1b0"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "4b7e5909c71f7954a09cc38e48e2269ce748adfc507a6ba41c2e1bcbda23b0fb"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseStorage.xcframework.zip",
      checksum: "0ff9fbc87efd4b6f23de980b013e1c3e762009d95e555d07a1d138a13af6ed8b"
    ),
    .binaryTarget(
      name: "_FirebaseVertexAI",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_FirebaseVertexAI.xcframework.zip",
      checksum: "5af223f8a2d94f652e7304fcebd3eebace2a45f1919733cd65045310d6fd773f"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_GTMAppAuth.xcframework.zip",
      checksum: "fab615873f29beb01c04ca3b6d2962d9540022324679bea05d0ea31a0bfdc400"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "ac7e5efb97097d3fea80528d012c0f2876f0b3ed831dd4a4c73dbacb86ca55e3"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "2264e8b2c5f639513e48c1e83c2982408f8087c416ef46e4a0dbe8700f678a48"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "178b3c2980c4ca3f3902a7661d38570a0b55ab26b5fbd49d88a04117ff42eddf"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "602a4945e33da1d4093e09ed15be22b840e206e467663c23b922784d678b917f"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_GoogleDataTransport.xcframework.zip",
      checksum: "b3c0b8bcf6c7285bb4cd109fe0910274f53e7f66b2eb693800705c4bfdb34dea"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_GoogleMobileAds.xcframework.zip",
      checksum: "ecdc6f5e2025322586016a249ed2401dc45fb5d0b158829d49cdfe95bfafe2e1"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_GoogleSignIn.xcframework.zip",
      checksum: "f346119bcc6f432675e5f25c6e046bc6ff0af0fa7bd7874b7bfbd6081827476d"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_GoogleUtilities.xcframework.zip",
      checksum: "eccdbd1c4b45f27550b7bc56a5e90885fa122f29e8de1f52683d49c6196f3637"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_Promises.xcframework.zip",
      checksum: "6c99caf7c725b3d9d32680d7e345a15cdb4aca8d31a29c0401abc10442760ba4"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_RecaptchaInterop.xcframework.zip",
      checksum: "fd8957ba1870b50645963b01bcea9b9d50ed5b01a036c98d55f13815c9fd5144"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_SwiftProtobuf.xcframework.zip",
      checksum: "9cd069330c773e70579916a590975833dace197dbc2eb2fef9b623d106651acc"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "b4a50fa7d3300b038a1be301c6cd7cc5a4fb8b8c08e717015b2c5bd22b7ef726"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_absl.xcframework.zip",
      checksum: "73f8219dc7cc3867e4da5fc7a07a36e378ea06deef1e4f4fb225a940da6eae41"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_grpc.xcframework.zip",
      checksum: "acb65270f0469625e7c37d5ddf5d60b51b78feca285d73d3b017566ad01d71f9"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_grpcpp.xcframework.zip",
      checksum: "abdb38e89c4b1b720d4993581d65962c6f0e9efedafdc4c25f4e5b6a88c5aadf"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_leveldb.xcframework.zip",
      checksum: "a59819e07e38a2886d33a184032041b16f9842f57b2680d9cf2c516aa33bcec1"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_nanopb.xcframework.zip",
      checksum: "56e04aa33d3e15c262ce05bfe2289b50399554d6c83060cf01ba457e13a30e9a"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.7.0/_openssl_grpc.xcframework.zip",
      checksum: "ca90420957d860d7f188ffa15f46e34c21034d2df292f1410da2673133e16ab5"
    )
  ]
)
    