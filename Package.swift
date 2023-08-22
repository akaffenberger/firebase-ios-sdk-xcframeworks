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
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_AppAuth.xcframework.zip",
      checksum: "5db09baca8cafebfec10e99827bae0ea40514cbd3fd579d83cb7c106547ed920"
    ),
    .binaryTarget(
      name: "_BoringSSL-GRPC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_BoringSSL-GRPC.xcframework.zip",
      checksum: "e2260f0246dcaa460ebafbea432e24ae4f05cdfc9fa4973e8062372d2ab8fe8c"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_FBLPromises.xcframework.zip",
      checksum: "cab9c9669879e771e6a72bc44e9ff7a784dac8b6417ab5f6d968a48a55bc1ab5"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_FirebaseABTesting.xcframework.zip",
      checksum: "e29685ea505617dc4d1d7aee5f6eafb5ed422e257187bc288c6811705219b1bb"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "5fd28efb2ca31c23cd468521b7c6bbbec4f706b00d86608596d9f0eff404afa1"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "37b0b8eaed0751cea5bb3056c76c7bb4301ffaa1ac817b9d9d9514d846c37e89"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "8db880fa3597254ea02cde12432c99b22929d288ac22799d70e713efef516ab8"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "dcf5bb5a52bfc2b7aff4bce4fdfff1cef01eb2fb13b4a12fb7ecf97153ddfab2"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "62cd4fea5c6e6ce7eae36600169dba89e31cb96d313817eb6dee8998035d345e"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "5d6204cea7c8f453b6007cc33b61b91908093fb2386b98c6e1f7aa871bc1f5db"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_FirebaseAuth.xcframework.zip",
      checksum: "7ffbb772dcf0391956d166fa6db1e69ec22b4c958209503e11f930a6eb4cf9ab"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "967b60fd83540f7ddf3a3ceb171bd3054e65b13917a57c7bc307ad397908faa2"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_FirebaseCore.xcframework.zip",
      checksum: "948e2e08a1d8ffa9e2f74a9eadb1cca02e6cdbb8bbc9813e66ba7370e8a7bd33"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "4bdb91f4c4dbd8f429ebef8fdc8d2b7093fd0dba0cfc0561fe6b5e37939271d8"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "4c87d1c8ebd29c23bc62442fbfa4f1c038eb1f2277bd0997652011b97f162236"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "601112227c0e84561bc33acc90dec5dd56ddb50a942801601b547daa1d975325"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_FirebaseDatabase.xcframework.zip",
      checksum: "77bd004ae192e397c810c70ba6cef56d26a8c70339ce9b9b90bc37fe781ba0f7"
    ),
    .binaryTarget(
      name: "_FirebaseDatabaseSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_FirebaseDatabaseSwift.xcframework.zip",
      checksum: "53b7f0dd054a0026450140b169e1c93f80db4e511af10a08010eadd73ce3001e"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "afd193f066d2197f8a93329c83835c3ebbc821b903c02cd890d668bad13eb852"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_FirebaseFirestore.xcframework.zip",
      checksum: "1f9d369a1de66fba7aa2f58b2a9f9c2573efac6cf60e6c7ba6a6bd5791830c79"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_FirebaseFirestoreSwift.xcframework.zip",
      checksum: "7854f8ed46daec21ff97b6566502fbdd19521c7ec8a3a04349c70ba761257e48"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_FirebaseFunctions.xcframework.zip",
      checksum: "8dc13898be69d8b0ee138fef28418b18d5c549f53e909e07ae0d5c0ef736c445"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "24bcb4edcaee48ba21cb1a435682d51d647fc66b7db85d2d98bb38e408ecca40"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessagingSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "23a26fea8de779e1a457bdbcc83bd301a44c25d7632fc676cc23088f1a14f6e8"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_FirebaseInstallations.xcframework.zip",
      checksum: "427f076189c2db7db3712bffe4f90c1f91100e881f49cdaa17451d7d77bdf39c"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "9dfff8d9df7084f9ddc1772c88b8f163bde5afb83f57d82e13ebcf93a551adf9"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_FirebaseMessaging.xcframework.zip",
      checksum: "e1147a6f1c8239665780d7afb16d28f54cc9f2e599b40207a92cc77db5412458"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "d0aaaa3831d6ba71dcda3eeaf9911a0a44457cfaf3d9b94a15bc1ca87225a014"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_FirebasePerformance.xcframework.zip",
      checksum: "fa1d6f477b7924148fab367df368f25cc16c26c0829dd7135840a453f92759d0"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "191854f5d494f061485686724117b4d3b5c2f35acd9bd806d968f4f3fb6cc95a"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "3b2778c9f1afd9739889980b3c3d0a4c42fb991e5e3de4674a4ebf5ba80749bd"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_FirebaseSessions.xcframework.zip",
      checksum: "b70b839e52cdaf890f361e9a500482489844f6759e687f7f5d775616be1861f5"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "86e9412539947d046cb56a06908cbe3f6048a2ea3f521876370776b217a00017"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_FirebaseStorage.xcframework.zip",
      checksum: "d0448426d0c345314133d12e54522d9c53ca51b02af3af3f26201ec539ed668f"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_GTMAppAuth.xcframework.zip",
      checksum: "923f4dfc9d1944c70916414b4aca10747951759dec09e19e195a09e52e20bd94"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "1d72970e7b3679cc53f8907df9a22eff80012fd26c00550ee09c4dda290ce592"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "10da0706c2a745055b3f2c350c8aab4cf1e16dd88fa5575916f2c9105212ea15"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "e2939df0201198b2f75cb1a6378b7ca23a1ff3a67ffcf7bf83d6c30ea7144d00"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "b48619477ec2601c3bf8a020d832cd9aa2928bae863c55eee5cc10315fc8a04e"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_GoogleDataTransport.xcframework.zip",
      checksum: "e8327ed16fcb665da6c67c4996c8fbf199cf694e4663a27fac2737df044079d4"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_GoogleMobileAds.xcframework.zip",
      checksum: "b9da14a6bafe154a2e0a7907b496905ddbf2973285e6b0c4fbcb7c456c8ab08c"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_GoogleSignIn.xcframework.zip",
      checksum: "78919a88c84bfc20c4e41f6a122d23ef36713cf6455ea48f174931d50cde946b"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_GoogleUtilities.xcframework.zip",
      checksum: "0c974db5a70035cf68672405c336273eaaee86296d8089643c2463f515b2adfe"
    ),
    .binaryTarget(
      name: "_PromisesSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_PromisesSwift.xcframework.zip",
      checksum: "61d5d56e090c243be78b7748f75e81d2ba2233ebf376043d45da09d048cd0b60"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_RecaptchaInterop.xcframework.zip",
      checksum: "b6ddd36d27ce77ca9bec3143268ebcc04b0e774b8cc81cf2191ff2926dca25a9"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_SwiftProtobuf.xcframework.zip",
      checksum: "168c96e898f7aad34bfbf000d0454ed8fee96d2688d3374394fd1fd8e1901ea6"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "b7bc1bf922a22f67f03fb513fbd505fe87c1ff50a327a42ce6c244c4fb0b8e9f"
    ),
    .binaryTarget(
      name: "_abseil",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_abseil.xcframework.zip",
      checksum: "1712914533e4f52debff0c4b902f2f1f6d03cb64adfe09ea3286e56d0cb16586"
    ),
    .binaryTarget(
      name: "_gRPC-C++",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_gRPC-C++.xcframework.zip",
      checksum: "3febb290cc4ac259d350e922c2415e903470b238f65ede889c5f64ca1fdfdd7f"
    ),
    .binaryTarget(
      name: "_gRPC-Core",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_gRPC-Core.xcframework.zip",
      checksum: "41769cbbbadf7d72c029b2d4ca7f02917f7a0937abf0af5fcc917240be3952d3"
    ),
    .binaryTarget(
      name: "_leveldb-library",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_leveldb-library.xcframework.zip",
      checksum: "3a91bbb3e2cd5ddd121c84a857e8918d72994dfb425d850c3cffb18fe5dc84f9"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.14.0/_nanopb.xcframework.zip",
      checksum: "aa43051ac134dfb9388f73aa4ae7f3072dfcbce633610f74e2b4f7333a4ec8ea"
    )
  ]
)
    