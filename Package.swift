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
        .target(name: "_FirebaseInAppMessaging", condition: .when(platforms: [.iOS]))
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
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_AppAuth.xcframework.zip",
      checksum: "b25bf2d6f8d53159695862e27970a490838c27782f1b49339a3d115d32381a14"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_AppCheckCore.xcframework.zip",
      checksum: "99c2eaec35bf77c1d663c4c23dd79a1194e1b2ce4149c4db5c52167587126b2c"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_FBLPromises.xcframework.zip",
      checksum: "2bb9b7643470f8ef1be70c969a46fb15020e6470952beb858b9920a129678870"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_FirebaseABTesting.xcframework.zip",
      checksum: "71ef6dc591dc90234fc213cb8658887b28185441714a3fbaf7c352015679ccb8"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "3959e93f60b6c65bf23d89770bd15ce4cc10ed7ae734491938d5e193aea04523"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "eb4f1cd3ffe41b083af167ebed882d8c1509ba8d87ad50e86ca3c221dc82bbb1"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "3adf79f37d7bb7833e5a2721d69693f4c78c02eed0d1261c00a5d2d339b58ba1"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "d56d65470789e32ecf00ee0cf58240f481c5fc3c7f39499b1c7188809d809c2c"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "71c8db0f3b967ba0df5b6548fc6a938ec6edb48e40c7c35e858721318019d9af"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_FirebaseAuth.xcframework.zip",
      checksum: "be7362e6df186337f690b3cbc628e14daedde5c28c9c56bd17ed771695a1a00d"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "87af4d21715e254d45692a4e6a42d375f38163dd90bff07965acbb6f32d28734"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_FirebaseCore.xcframework.zip",
      checksum: "d8e26f97b1a6f4a7cadc9e667d3399c0aca46b438e86e3811c31d1ddc5a2bc2b"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "4ccb6a7595399f95da99b2d01093832c5353f2abc4e7fcb9a510f9e1c9a24ab9"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "792f0aae66261191148f35b4cecb63fe88c6536b30bc62c54c82ad503227e89c"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "75fc7a1b4b3f49d88842af8857aaf6a9a248065e9be515dadcda8ab1a2802f80"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_FirebaseDatabase.xcframework.zip",
      checksum: "dac72e7b6fd783c19d683c731027dd39dbf06af9b050975ec608a5f64d456158"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "015c30abc36bc181fdee2ea94942acd9baa01d118ce2eb4b0e5d2ca7bc65899d"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_FirebaseFirestore.xcframework.zip",
      checksum: "2108c36b1e134d47eb3f0c8386dcd86ed49de6d15efcca57b6940546eb5f4c71"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "753ccf95ca437bdcb758c08d250705378d2779b77d75737c8d0ad6c996b7d12f"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_FirebaseFunctions.xcframework.zip",
      checksum: "e0f760ff968e1476ed1de54200a926b3ff41982c31b3adbcba36e182dfab35ac"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "b46768d60b81a1f18c279b284b307511c64788e79ba64dc2e57d06c0ecb6b7da"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_FirebaseInstallations.xcframework.zip",
      checksum: "ebed4be23e6caf5dab8909ed5d88f95c596a8c4186a9660ad402fd7fec84b8dd"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "30f6deb701793d558dcfdacaaa38b50748bc449f1f293332e508bb74e6e54fe5"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_FirebaseMessaging.xcframework.zip",
      checksum: "f4faa0257a381623b40aaf1ff6fdcdd31636705644af5b6745cfc73f2b2300db"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "b4535423a8ca6bd8481efe296f8774898bbc9ed3819b18090f2a72267ae20340"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_FirebasePerformance.xcframework.zip",
      checksum: "99f80d2b20398f9939b7dd8b0dca5073b43cf9f64d44c564ed273d4c0fd33cdb"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "078cfeb01fb0a44400f90c31e40b5d59ccc0753310d593aebb9b470887ac1d0e"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "04a4982f1bfdef7fa53d014f38d597cab8598b3c2190728c8704a60a294b8d28"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_FirebaseSessions.xcframework.zip",
      checksum: "82a9823afe733e4fa83aac9a42f9825b81aa3db5b027693fc4cc96d134179e3c"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "ef1a79a0f9309d3ab31dfc0af31fa104ffcf72233daadc08c80ea40bce5741a1"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_FirebaseStorage.xcframework.zip",
      checksum: "2e89d26a57886942710c78439907604cd3d6aa41a795050766741536b07d2f9c"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_GTMAppAuth.xcframework.zip",
      checksum: "bdd8b1ad4acc8b3ae540ea8e06c6b34144b215be57916ae11b0db5699ad26714"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "c26ddd73051df050be1d6deb6e68a968c13820e93364e512745c835d92e65852"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "28d7ac38be48354a86029c4ca8a4a29a21617384d852ab11bc55c849cbdf64cc"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "115ce380e3023a6f5f976e077be16da547960fc6d09bedf2979bb0ef38e83b6d"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "8e6b8748a9d23a36b03462985f8a3f5dc1edc504bac7eed5ccd4a0b6c4867810"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_GoogleDataTransport.xcframework.zip",
      checksum: "b3c273e493e79739b48b6ca3b301edadfacfc78bb5b98325a461a67c27770de9"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_GoogleMobileAds.xcframework.zip",
      checksum: "057cd0b1990f823aa6ffacc33249eedb8ef2833ec56b6f758dfe93a14295e025"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_GoogleSignIn.xcframework.zip",
      checksum: "d4d394d1bcbd2c71e88a500a859a9dcff080448cb7acc344ed90950b6a3bf3bc"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_GoogleUtilities.xcframework.zip",
      checksum: "a36beb15257f521a89c8d5cee572d3db1d44c96afa8f2b89872a76b9a09c212b"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_Promises.xcframework.zip",
      checksum: "8d134be0cefbcd3502eab4b08004b2b40c10fb5a1e5e93f517eb69c224ba6416"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_RecaptchaInterop.xcframework.zip",
      checksum: "ffedf7d03d223bc522976e028d1822ae8beba75f8b20b6016b4e1da14c931cad"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_SwiftProtobuf.xcframework.zip",
      checksum: "fb792addb5ed623d585133580f3dfbd4a7151b0dbbec3e859ee24aa9c824c132"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "050ec3cfe5bc9529c750eba370f6896bd54648ca4beeeb0691e97be73fb184f8"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_absl.xcframework.zip",
      checksum: "2ef3f20d62ae54d9d561c858d155c6b97bbd536f8ae8150b9b0fa526281d10b7"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_grpc.xcframework.zip",
      checksum: "eaf1fa29a3924dde61c991c9ca3d8f48b349bb554c6450f364217cfcf9b9fd19"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_grpcpp.xcframework.zip",
      checksum: "418e7513c44bc3e2c37c108c28c3ce62bc897a796dbdb113ab7d6c3841f73b00"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_leveldb.xcframework.zip",
      checksum: "4fb84d6e446c69a1a6e3cf04379bcc9068cfd77f420c22b4952ca5255ec98c81"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_nanopb.xcframework.zip",
      checksum: "ee8b09f23499c2a509d9035e693cf7eda6cb22ae6c08bfa8264e476c1820aee9"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.24.0/_openssl_grpc.xcframework.zip",
      checksum: "0e0686825c750e9398fd9f92a1062fe6899d530cf057d38ea8e2e8277a5e3d97"
    )
  ]
)
    