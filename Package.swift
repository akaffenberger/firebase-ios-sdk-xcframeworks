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
        "_FirebaseAnalytics",
        "_FirebaseAnalyticsSwift",
        "_FirebaseCore",
        "_FirebaseCoreDiagnostics",
        "_FirebaseCoreInternal",
        "_FirebaseInstallations",
        "_GoogleAppMeasurement",
        "_GoogleAppMeasurementIdentitySupport",
        "_GoogleDataTransport",
        "_GoogleUtilities",
        "_PromisesObjC",
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
        "_FirebaseCrashlytics"
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
        "_FirebaseFirestore",
        "_FirebaseFirestoreSwift",
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
        "_SwiftProtobuf"
      ],
      path: "Sources/FirebaseMLModelDownloader"
    ),
    .target(
      name: "FirebaseMessagingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseMessaging"
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
        "_FirebaseRemoteConfig"
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
        "_FirebaseStorageInternal",
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
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_AppAuth.xcframework.zip",
      checksum: "35067e4b9b3457e0fd5a94eb46247136fe4dde2cd67584f41b72094641a5037d"
    ),
    .binaryTarget(
      name: "_BoringSSL-GRPC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_BoringSSL-GRPC.xcframework.zip",
      checksum: "d414d43afcdffbfeafb4d6161f37b40ad4ebce949fc3b1d9c3b1e5c44607233a"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_FirebaseABTesting.xcframework.zip",
      checksum: "a652744d2586b25891e861448a18d6fb48e535ae862271b9ac40219eecf2be32"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "a3d7ce8528a308e2ad8265e1025c76e69bb499792a75db2c51eee77303a5b2f6"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "c6fb0a3d2e165008179eab9a6dbd859bb54671a2cde935dfc7eba6cedf1ea622"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "721095babe3322b02afc156b25f6f3e76d0d386c84530236716e8960a0ea6d88"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "9ab95496da07b13f9e9f2efd2426c9dbad7a51c15017a27cb726f0d92c0cfb98"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "ab9091f74f5db2d11661b78d3a39c7eaf226698d965ed8249d42fb733b3f602c"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "0f5062a7e3e526a4ab1baf9343f7a3ebc80c7fa7d7ddb4639b605f548686684a"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_FirebaseAuth.xcframework.zip",
      checksum: "4fd65ca703d2f58e981062903a9e5829b6b8431125f9979229eb0a4b8aeba5bc"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "9123fbbe43cfa904d7f0b9a4e9ea4ab32f60e2815a90b3137e3a9305b554354d"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_FirebaseCore.xcframework.zip",
      checksum: "ec5c3ab69ed5730cb1dac32c85a234893c39328b8bf187b973897a70fd37763a"
    ),
    .binaryTarget(
      name: "_FirebaseCoreDiagnostics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_FirebaseCoreDiagnostics.xcframework.zip",
      checksum: "c322536e9df75fd5eb2c7bf88fe5cf4b72a90e1c649b30d611993c90a203095a"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "6ccf2b20a197d72cafb8e3015c9989026b0cb88b077ccfd6c45fde76a53f8e3d"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "bc78992b58fb90421f81f647af0923565d167910555201f16930b23c5c16cdc3"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "48d6858fc19daa585e97e1a9ee7665c34e98978cdf778fff8edf307f558351ac"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_FirebaseDatabase.xcframework.zip",
      checksum: "57ed1b3fb05a100de8af3544c37e36fd16a93e5724133092df3c0d8daf084d1b"
    ),
    .binaryTarget(
      name: "_FirebaseDatabaseSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_FirebaseDatabaseSwift.xcframework.zip",
      checksum: "c1bc6396e03f28e3c4a5c9a07faf8317384a529a989fc7bb53745ed4bffa8aa4"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "82da0aae06b076dcf80eb19e0d0ac220e4694da82fd2a472740d1c6a69e93db1"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_FirebaseFirestore.xcframework.zip",
      checksum: "d1d1f2c38e878e26e05beb99dd4736ca09b2c3d2e0c3cf17d4d8e335eff993ce"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_FirebaseFirestoreSwift.xcframework.zip",
      checksum: "65e1c256dbe8e98f28df2599898c34d5cc3d87a6422fb4e1e02ca1d5262c3877"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_FirebaseFunctions.xcframework.zip",
      checksum: "f2e09e61f8b6e35594470ef39344a09e98e6e51f5eeeec3063b0096e9f087d05"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "b034cac00a08682264770d05cb33e0e7e1f92afdf2db61b5e784563d83a1940a"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessagingSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "453dd4979335f6f70362e104372ad430192ea1e74f23be85b03a9a914f49a830"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_FirebaseInstallations.xcframework.zip",
      checksum: "6cf530e51897f296c210e93f4eff18aa6cf422744ca002dbc58b2be2238773a8"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "3a6d9c1679f96461e8bb8b129d12db02ca0eb3ac2380085b814f0aa0670a1d04"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_FirebaseMessaging.xcframework.zip",
      checksum: "8461a16e4d820b923acc805e87448927579478a5ce7d4e8ab09598c3a57bd9da"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "301e7016ff5a8a3ac9507fc93c8b8a9ea00c712f4e5f3357e4e790c0993f79be"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_FirebasePerformance.xcframework.zip",
      checksum: "cb91e46c2d681fe2feea430709c357c3146e9f1b02a4adc4284bf52d624e87db"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "7e62d7b04ea5203df090951a17e9d43b95dec5c06cd50da696b12af74bbbaf1a"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "238caed3ee731174b100a9d7572ae2ec214f1d701038e3cdecc25060925be502"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "ec7e4624caf3b13beb30058ce8c619958f37ccdf1b72f0bca873904382a97108"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_FirebaseStorage.xcframework.zip",
      checksum: "21693e3f75da8f6248e7252eac73126136fec0e7dd7bbe5795b470d4c4fbb2af"
    ),
    .binaryTarget(
      name: "_FirebaseStorageInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_FirebaseStorageInternal.xcframework.zip",
      checksum: "7285c9f4f1cf0ee5e9a76e09c640c34196a2a87beb07caa176383fe6586f290f"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_GTMAppAuth.xcframework.zip",
      checksum: "49c09d6188dbaba57fca3017fd6a65bead9cc8f44f6c9e83f18071b92c2cfad7"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "c8a86ae7c23f2bc98b2ecd6b452a8366c92b64ac17341181abcb5c6c7a6ea54f"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "786064fe62077bfe5c48ddf52e34dd587877d11d64113caa1440f4bd95146fd7"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "d8098316b5278425f3e43f61f6c4d87c666f5dc10497b0488d4a215b2cd9531f"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "b611efa98c749a9f3b56cba6b86cb0536bbd8e38d3c1f22bde1b21ea15aa2746"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_GoogleDataTransport.xcframework.zip",
      checksum: "2de8776315a02370be41e60b1d9d73fa69e48fae0418e02b68c19dde939778cb"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_GoogleMobileAds.xcframework.zip",
      checksum: "7f6fda62c24b0b44e43180a020827e046d879620d351a106a168508a48642839"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_GoogleSignIn.xcframework.zip",
      checksum: "8aa4f34cf984b3d65eba2829b531a29224180df05559e9c003bb91023255c21d"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_GoogleUtilities.xcframework.zip",
      checksum: "22d37ea558b8ed1b3c599b3a26725b304e9db30644b2e725bd77804d44add09e"
    ),
    .binaryTarget(
      name: "_Libuv-gRPC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_Libuv-gRPC.xcframework.zip",
      checksum: "6ff4b94870aa7dbfd246f2aba25378b5864276f73a9add4c17f0988ee53d1f9b"
    ),
    .binaryTarget(
      name: "_PromisesObjC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_PromisesObjC.xcframework.zip",
      checksum: "0c865fac9afabc9ae1509fd265664e91c5deb3fd2b5f80b401b543c878cfb723"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_SwiftProtobuf.xcframework.zip",
      checksum: "2b5f64fa9d85bec8a64934ac40a692e76165caa21689b1156a17c8956961f15d"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "77aa0349144292e727b1345775c34f52de95dbd0d45800437b091788e87e382c"
    ),
    .binaryTarget(
      name: "_abseil",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_abseil.xcframework.zip",
      checksum: "05d218a083a44e84fc704f7027b06e90b24239cdf6c6ae35d346235f11d88efd"
    ),
    .binaryTarget(
      name: "_gRPC-C++",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_gRPC-C++.xcframework.zip",
      checksum: "8fbbd94e175cb72556d13ff2f66158c222ac99cc4f4dbe7a1092c8ddd549162d"
    ),
    .binaryTarget(
      name: "_gRPC-Core",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_gRPC-Core.xcframework.zip",
      checksum: "a2bc73193d780bc880295964f527b4be58e32d4a19837ee2fddbc68c30aca5b4"
    ),
    .binaryTarget(
      name: "_leveldb-library",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_leveldb-library.xcframework.zip",
      checksum: "ee2cdfc01d6ac7fec25f4d85bde969a9bf90e72b571a7f450b267e1abac3f0a7"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.3.0/_nanopb.xcframework.zip",
      checksum: "32ca6bd305cdb739e85a19d7d9e3972c90cd9389d40393498950a6f36ef3f296"
    )
  ]
)
    