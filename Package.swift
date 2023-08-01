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
        "_FirebaseAnalyticsSwift",
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
        "_FirebaseAppCheck"
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
        "_GTMSessionFetcher"
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
        "_FirebaseSessions",
        "_GoogleDataTransport",
        "_PromisesSwift"
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
        "_FirebaseDatabase",
        "_FirebaseDatabaseSwift",
        "_FirebaseSharedSwift",
        "_leveldb-library"
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
        "_BoringSSL-GRPC",
        "_FirebaseCoreExtension",
        "_FirebaseFirestore",
        "_FirebaseFirestoreSwift",
        "_FirebaseSharedSwift",
        "_abseil",
        "_gRPC-C++",
        "_gRPC-Core",
        "_leveldb-library"
      ],
      path: "Sources/FirebaseFirestore",
      exclude: [
        "Resources"
      ]
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
        .target(name: "_FirebaseInAppMessaging", condition: .when(platforms: [.iOS])),
        .target(name: "_FirebaseInAppMessagingSwift", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseInAppMessaging",
      exclude: [
        "Resources"
      ]
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
        "_FirebaseSessions",
        "_GoogleDataTransport",
        "_PromisesSwift"
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
        "_FirebaseRemoteConfigSwift",
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
      path: "Sources/GoogleSignIn",
      exclude: [
        "Resources"
      ]
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_AppAuth.xcframework.zip",
      checksum: "c03cc2335cc3faae2dc29a536a456344b8c440d8dcd01b6ceef090dfc69f1bb6"
    ),
    .binaryTarget(
      name: "_BoringSSL-GRPC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_BoringSSL-GRPC.xcframework.zip",
      checksum: "9d80a49695cb7c1010951476efa74fc5b200eea34bd570f5434004308fbb9ff0"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_FBLPromises.xcframework.zip",
      checksum: "bdc64f4653a7e96be17184ad67cfc2b454ffcb5ff9acca3c63463ba6afffde36"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_FirebaseABTesting.xcframework.zip",
      checksum: "81643c30d87122e457fb88ef8fd36dcf3ff0bedd1146d38e462f214455c22538"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "6aef5ee4b9b5f02761ecc96e4bcdd84af4d6bb8f83938c8b42830e4a08f81873"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "262f47c32050cab7b8159abf6da6e12c465df203a03827b8348e224751f3f92e"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "08ce06dc55d4e17e3a512495ddb4bbe61fe1546e610d844b04c5ff855d1ba92a"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "64e97320f2f26a48ebc18eec2b0df2a89a20949372a6c520acdef186fcb16fdc"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "ecdbb0f7f839ac8880bb3e9b9e1ea5816ef84d75787db2970ab1fa44fb0307de"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "1d0bd4aa34e52cbbae75d8b856ded5f40020945bb77fd4c43da8594ba086a1b2"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_FirebaseAuth.xcframework.zip",
      checksum: "806aecd62cd154814a37b16d945ed774391d3fc229c9f7719b455848bbd52a5c"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "bb9c5d59c6a0bb992155e0e55d60d79dea9367abe5468a7ba678a4fc377f57fe"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_FirebaseCore.xcframework.zip",
      checksum: "0f6c01d50f18747c5d8d41c085edd45b5b46403d89f25726f8e1c0f175004529"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "f2f0eed6f6dd299f669816cb07deb1a7ae03241e1dea1766dd74e281f5d44e1e"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "f7ed202df0a24789dcf71d2dfd6d0ff43af37bfe4c100c06361554c4e552c531"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "cfbac1d7fac39454aca674fc7b93f09bbe32d843432868fbaf4035e995994cd8"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_FirebaseDatabase.xcframework.zip",
      checksum: "adf085dd994580595449bdaa77d1fc39bc1670f7360bb11b81569cd52df01b8f"
    ),
    .binaryTarget(
      name: "_FirebaseDatabaseSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_FirebaseDatabaseSwift.xcframework.zip",
      checksum: "53bfcf4398890e4f64e212167ca8c8554382d18b8d8a77968edabf454b37db24"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "4c64a7141a20f1373865a74cf0b33c38c521effd32b61b1148e890c5dfdc7985"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_FirebaseFirestore.xcframework.zip",
      checksum: "8eb50f5467ecb79a77f16e62606ae73a705c91625fc7e399a2e7ac37435fe420"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_FirebaseFirestoreSwift.xcframework.zip",
      checksum: "c9e913177d8aee3242581795cff465fa5165150accbac2551c4282fb78dd37a7"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_FirebaseFunctions.xcframework.zip",
      checksum: "dfa98fb2910e71d02d8f76bbf0ca6376918ac261aa6f79c11c94156519be4d48"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "7d2a0e4c764ab0f3fdbc53e89eb349d31897d4f897f0db0a60761175f8cf666e"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessagingSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "d5c39bfa98ab33f4e6f8267008e95514b4b4ccbbb40a3aab32643a7478167567"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_FirebaseInstallations.xcframework.zip",
      checksum: "184118b104848faa96c0269487a6030ddae730b9275adb48f02bbb49737ea5a7"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "bdc12123730fd07f069dfd0863991b0d6a90f242621336292fb3db87f9e674e1"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_FirebaseMessaging.xcframework.zip",
      checksum: "7bf435449740e717bc0a1fbeb0ee09e6e4d4f3a695c02989963adb9a5a4eb0c3"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "1146291d2fb93d27a7559e124beed3f8f1d3c5d63cb19f60af06094390b09396"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_FirebasePerformance.xcframework.zip",
      checksum: "906af8740f6a76103c784f0627598c9475c8dd2ac6317ab25422d64bb31afbd0"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "166ddae027d723c2a10dd22573cd8bc69a593702739ba9eaaeaa40d06ce0cac4"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "948914691df4a5f51859ec38532b9478df754029cac3cda6ad34c1e9d80d91a4"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_FirebaseSessions.xcframework.zip",
      checksum: "5139a344a38b67daa9d9c5cfbc2cbf2f2d104bf71a73cbbc15c588ac2778be81"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "4078131d2b7261d697e68edcb82d6aed05ae7bca2be6f84d86a06e3d4ea542a8"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_FirebaseStorage.xcframework.zip",
      checksum: "d1097bbb78fe5bfe3f29f05f7a511ac0644354b248dc664a27318702c8efcfcf"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_GTMAppAuth.xcframework.zip",
      checksum: "a29908704ebfddf496c60b77afe29c70766f1c0c03a0fea0af60f357d6b704bb"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "fcde39aad3a905044a4642dc3d47a2d47b3e3162292fcc34a3035dd2a175f383"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "e03b90550063d7c4957b93080ac6c1f44e9265b47887a780bc05b5ce94283096"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "4b71c7b8c010e6a329f9e352a3c97f55c836c907db69981ad3a99d16f6e1695e"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "cd8f9432a1c2b661345ed006dc7f4eb34c68a7f24311b5ce615c908c97c4a807"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_GoogleDataTransport.xcframework.zip",
      checksum: "b0e78dc8b0bd1efdec548659f7f868b83c22398ab9fcae20dfb9c98e426777e5"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_GoogleMobileAds.xcframework.zip",
      checksum: "34440f9c5a6d2710e63de7a4c4334f2f6acd6c20030db221959237be17155241"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_GoogleSignIn.xcframework.zip",
      checksum: "1e04cb5349f9bc459c5777195c367afa16efb58d991e44731cd89f42616137a2"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_GoogleUtilities.xcframework.zip",
      checksum: "0fc3b4595cf872efc3915398167dadd716a5538ee295dea56a118766d9b3dc24"
    ),
    .binaryTarget(
      name: "_PromisesSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_PromisesSwift.xcframework.zip",
      checksum: "ffa18b2c64cb2827435eb3fb07cff7e82e8e4490f3a1eed9bb6d5293b7546c00"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_SwiftProtobuf.xcframework.zip",
      checksum: "f36b343cd2f5533b873a743c0819b1fb767de59982624fdbbbfd0965c7ad950f"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "f353f7a58525d5522d91afaa24412a718f16e4292e2a969b6400dbea45888f55"
    ),
    .binaryTarget(
      name: "_abseil",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_abseil.xcframework.zip",
      checksum: "a46751e565693bda53e8aaa84e0145d90f1a3fe841aa45254c600ec8ab97e23a"
    ),
    .binaryTarget(
      name: "_gRPC-C++",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_gRPC-C++.xcframework.zip",
      checksum: "3b9ef775cf0f58b02ee909fbc52d75e4414c155bfd40b9c6b3194687305dc075"
    ),
    .binaryTarget(
      name: "_gRPC-Core",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_gRPC-Core.xcframework.zip",
      checksum: "490ea36e1b629185a286c6e0037bed0b6031f14a418a9283550ae9b2cf177948"
    ),
    .binaryTarget(
      name: "_leveldb-library",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_leveldb-library.xcframework.zip",
      checksum: "3503a4239f6e440b872c16828586d3df65fd40013f4bc7b01afaafb1f5aea768"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.13.0/_nanopb.xcframework.zip",
      checksum: "4c1f0caadecc08aa273df928c9e82132d3b997dc9a9549cb12ea2f01dbfb4433"
    )
  ]
)
    