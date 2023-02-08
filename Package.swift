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
        "_FirebaseCrashlytics",
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
        "_Libuv-gRPC",
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
        .target(name: "_FirebasePerformance", condition: .when(platforms: [.iOS, .tvOS])),
        "_FirebaseRemoteConfig",
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
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_AppAuth.xcframework.zip",
      checksum: "b387ef824fb3aaae99e9b6e5739ffa451bbc7539e2bd8146a56de24753e00777"
    ),
    .binaryTarget(
      name: "_BoringSSL-GRPC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_BoringSSL-GRPC.xcframework.zip",
      checksum: "5a6538b030437f774c90f3be7f7a4a998c4d227be65dfc95da48164c96d7b112"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_FBLPromises.xcframework.zip",
      checksum: "24e32d3dbb800f98d25bcd4fdf7d37e1f8d7742f36ecf2f375f6480d924b87ce"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_FirebaseABTesting.xcframework.zip",
      checksum: "8f22df5e8eb4e608aa24582d0f5d62951a533c6c64091cbc2dc7a8d7a59ad35d"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "3fe3389ed5bf7f61d43a7b57dbce5af32f9e6ea340cf53b76eaf31f879347966"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "596176835d63d611f0d7b8409b84e2c94eb1d1dc7669751235fbed5410c03e98"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "e6b440a89eb31fdb3f34b3b67dcbd87e3bae6d44b3bc2c8d79aadd3689e7bfdf"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "232ab39323e53ff545bc7ab179f277b74f02d1cdfb34686fc56301dafe0e5fed"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "329b030cbdf7f608709e02e2a96af85e38a31e1a8405571427807e5ea64293c6"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "9ba54ae5188926ad241ca73e56e65c1909069e12d1f669cf6dbb800aab25a69d"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_FirebaseAuth.xcframework.zip",
      checksum: "ff1253d4382a98a06667f68f14a9cc5e1512172f2e5f09b49ebc71c7001c44d5"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "5f8ceb861675f8256a8759251422b32219fe0dcd1a1581ebaaa9c12a3d2bf64b"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_FirebaseCore.xcframework.zip",
      checksum: "ffc20569edee0d537de5778ea6c5646d120298b401cc926b5da1f03b1d07c9ba"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "ef1b165cc3a8499ad902de7c72e6e949866ef82ce0abef48fdf87fbffaa9ac23"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "6acc4179c1822cf553e40f2613b14226c12cfddba7b0e25dd518744413349eec"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "679a7cf5aef53a326969ebb103c1da826f9e930fc9769146c7140dc4a9770f6d"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_FirebaseDatabase.xcframework.zip",
      checksum: "46d9d7915b2054296b97f1b66b5db10c46ace789b4899278cda332ff006d9482"
    ),
    .binaryTarget(
      name: "_FirebaseDatabaseSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_FirebaseDatabaseSwift.xcframework.zip",
      checksum: "3783750dcb917df7542e5e0c7230406e80918fafdccb87a70b829e69aa0c638a"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "dcf11847d8757f24dee033dd77a259af68e89bf100feaedff47b6a51980fdf01"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_FirebaseFirestore.xcframework.zip",
      checksum: "1277138af31ec28e44555a6ed3b0de76a606ac1b1be145ddbea6b60b0e58d51a"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_FirebaseFirestoreSwift.xcframework.zip",
      checksum: "7cc6c1c717d7d1342404bccc5c1b7714457ad92d0bd6c948a23f952dce8e40ef"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_FirebaseFunctions.xcframework.zip",
      checksum: "43a4140c36c754dc31ea9c7c70f225109ba38c99e48a9bfb6262aaedd6748b5d"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "1cc907974b15587fb72cecce1c5f985322d4566042118952a309873d9aa1e944"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessagingSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "2b9c09fc79ede529e379abf44bf1bd0137b3e5f1a1aa223817e13a288bd5eb01"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_FirebaseInstallations.xcframework.zip",
      checksum: "a35caa805d39d441ccea3c22305e65e0b26902ed8157b6a994641a4feb3a43bb"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "ec5c113f340b9cf6d854a3e6385cf24b3646e3712c50aed79749f10c51dce0c5"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_FirebaseMessaging.xcframework.zip",
      checksum: "ff72b9ac6d6e83c97dd92269fab4bcd949e902e4aa247b5b8598fc8415a24882"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "02b780cfc9ae19d9065ec347c53cb04db5f1ba12179e3bbb59c47c7df87c0bad"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_FirebasePerformance.xcframework.zip",
      checksum: "aa9d4de13886e7d6268cde011e016f5c50422842a1f446ee151f62fdf5a0215c"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "75b8fca29a8a3abbfcca3c5d49ac894bb93f0d24f8f6e3347d9206a87831bb7e"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "748452b54e510a26b8c37ac5bced511b3b1fbce060fc83e5754c33ac305e5c04"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "553b397d767b6f0d5301e59d10a281056045e81587696f4beceb44aeec8c8f2d"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_FirebaseStorage.xcframework.zip",
      checksum: "d239987f7dd19455c7c20acf7c419e24041cd4ec421b3a76db45d657f6e47b59"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_GTMAppAuth.xcframework.zip",
      checksum: "907b7dfab7c0b7323fd4110a811cf3d355c757c720a246d107217108a447d946"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "8d57735db13a631e124a79d1343e52cdb5034e24fe3be72f8d40872f15eed95e"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "6fb897bce2c53cfe8d2b8964997993162e2c0a3f94549f4614f3cecf3d2f7a05"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "b3f7a1fecf38884d73f4af2ee0f4e03efb3081d030d92cca6c6b8e456575a0b6"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "0d10be91c64751c2668cf39ee37fbe92d43ee9d5841c7305fd1c574d94ca2136"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_GoogleDataTransport.xcframework.zip",
      checksum: "193ca557b5a15f3783f3bcaeede3af29a809d5226ebeddf7290717da008420e0"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_GoogleMobileAds.xcframework.zip",
      checksum: "a4406d66e09bf2a8480e5cddf66f747d07eecc0d8663bc560adf82659fb973fe"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_GoogleSignIn.xcframework.zip",
      checksum: "56d9e55e9487d526741560425ffff5ec5edf44bac9c182650b80cf7a6575b209"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_GoogleUtilities.xcframework.zip",
      checksum: "f9931c13b5f322a9bb9e2e4b584dc098f497de2037c2ebc8ae62ddf0301ac960"
    ),
    .binaryTarget(
      name: "_Libuv-gRPC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_Libuv-gRPC.xcframework.zip",
      checksum: "3d3489c9bce19eac5d784c8e2c1e1832a0b293af65d8e7acada32362fc08af65"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_SwiftProtobuf.xcframework.zip",
      checksum: "b870d36b0dedce621af6abcefad58962f4d7ff4d576593bb2a35a009495491d9"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "611af137b2b2803ad0d09589ae65b6a24815e78c37914b941bcd1cbde29e3672"
    ),
    .binaryTarget(
      name: "_abseil",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_abseil.xcframework.zip",
      checksum: "539138ceb8091129b30fdc1b3686bb276cf379a3d6de6afd42e4de19758ca9d2"
    ),
    .binaryTarget(
      name: "_gRPC-C++",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_gRPC-C++.xcframework.zip",
      checksum: "45c6680005a8ca5706f824c97efa055b76dbb50fa41df81f1eba363b15ada05b"
    ),
    .binaryTarget(
      name: "_gRPC-Core",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_gRPC-Core.xcframework.zip",
      checksum: "770991a7fe1e3722f9a85573c721e4979c1bde3f2067264623437e4b98c46997"
    ),
    .binaryTarget(
      name: "_leveldb-library",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_leveldb-library.xcframework.zip",
      checksum: "ba6af294598a76a295662929bcfe7e97b5e4680494c494705a9b9c04eddf5720"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.5.0/_nanopb.xcframework.zip",
      checksum: "b21654bbb61f63de60890011e1dec705bb7f07ef7aebacfa49bb48b6465a96e0"
    )
  ]
)
    