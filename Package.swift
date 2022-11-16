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
        .target(name: "_FirebaseAppDistribution", condition: .when(platforms: [.iOS])),
        "_GoogleDataTransport"
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
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_AppAuth.xcframework.zip",
      checksum: "2cf5859caa3376be6f9153833915a234a17c847ae2981d1e2efb2524fd0b55c2"
    ),
    .binaryTarget(
      name: "_BoringSSL-GRPC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_BoringSSL-GRPC.xcframework.zip",
      checksum: "b6173a63cd593e43f94fad92fc8e6114b00decde76071c5424dec52c72dcd2aa"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_FBLPromises.xcframework.zip",
      checksum: "069227cad5dc080a7124c423bb0afc02197222c17b5928ab6bf737200d6b6bdd"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_FirebaseABTesting.xcframework.zip",
      checksum: "858b51bd82a8bc7946afe64e5f423d1238db57f9e1d62a51fccb31c4931d56d1"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "ac68613cf9f7caf27be41d4ca2e568c175e0ff3724b2b6ff839b459e24f6197a"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "ab4ddc8dd4167143bdacabbd071b20c22e5e7a2ae7e644d1d3d9d44c132e1f85"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "3aa64f435b8f65be791b8eb7b085bc0b2920a6db77324c2100e44db2238088bb"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "49a989552c3a719daf0a5b37ff44c8917db26db3df8b38b41ae9d28739221d6e"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "abbadf85c77cbf38fd03def1ab064d57bdcc2ac1c1b21e0da3ba468e9ac24449"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "dc43f038f0fb38668d3ba23c1592dc7248c1404ca30732856ad782ea53d41838"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_FirebaseAuth.xcframework.zip",
      checksum: "80e4a51b5a9ff3240a1392295465f07e38bde8006518913fb43fafe49c35abff"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "e00b24eabdf3ffd42a08c5b5c1b88c61d0eaddedde648d262842aeeb837c1a61"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_FirebaseCore.xcframework.zip",
      checksum: "96c731f6e1b920621a23083446b6b633802e6cb8e0f87f40580013b2632fa111"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "f743a669ce2dc70be8c44e648ddf666bacf89c0b1ed118ee272cc746689642eb"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "0b021bd715698864f9f9db2376dbfcfb377a69bf34f505ef1520a62c697531ab"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "409b9e22b360a2e8d7ea5fda715932f702817076ec8a4fedbd189571fb313702"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_FirebaseDatabase.xcframework.zip",
      checksum: "2113855b8160fa388e1471bdc318b689d12989bc774794e24188c24a723dccf6"
    ),
    .binaryTarget(
      name: "_FirebaseDatabaseSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_FirebaseDatabaseSwift.xcframework.zip",
      checksum: "65e1b4f937f368b0268893d1be9f2b39ecb802dd9cd567329a1d2735ab8bb663"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "63decc210895033d053ec0a33acff22a9cac5324c7bf40dce7b56be26df25a09"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_FirebaseFirestore.xcframework.zip",
      checksum: "8ef2f32a4574e5762d1aaf07c5daa610f5e7b9bd57fc4245bb1b6263f0f4cae0"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_FirebaseFirestoreSwift.xcframework.zip",
      checksum: "a74997e94e1ece6d5b0ce479c737badaea0cb8273b9a02937ef91ef617a137e8"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_FirebaseFunctions.xcframework.zip",
      checksum: "979a18edbc76a3b3e1533ba9d29d637606b83d7d43369026636adf9ea1b07226"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "af287c14f4bae8bac19e53e81102c43b59a649aa71035697c583166c88bf9ab5"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessagingSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "03d53321e62bd488717b227fd2494bd41266f822ea6f2eea54edd0f3c077d13e"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_FirebaseInstallations.xcframework.zip",
      checksum: "9921a60d0ca27015f4b7fb6343057edb7c5baa5506a3436f8fb873580322da01"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "a6b7dd9e9caa86ad959667543dce733d10a319d61e673f92b945bc66084e9eb0"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_FirebaseMessaging.xcframework.zip",
      checksum: "e972bce31e3b553da1ff349046c46a416592be1ba85769aa7e86b5e92b7e772d"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "f09e53bf600e0b22cabeab9412e4494b6e86c3b3809c6dee4672188a09e40b59"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_FirebasePerformance.xcframework.zip",
      checksum: "9cc1a6c4f301014e26113de167a1ee303793fec57bb91a2b672b8dd5b377f9df"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "06292a3ed3d1878e7005211ad30b85c1424a2a0ddd697621494a4fc8ff5eda73"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "3f40252a9f85c7a84d768e9c7648155c4f40689e87c38f0bbc8aedd51d1227c8"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "ddd34ff390f610c58f5db987ad4f79dfc6630d4300df9757531cb55908a0b79e"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_FirebaseStorage.xcframework.zip",
      checksum: "7d821c40a34e44aadf80553861ffee15a540bf88728fb7451c7fca1d96d8b88e"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_GTMAppAuth.xcframework.zip",
      checksum: "7486b60d40f0993154fad61190c8b5fffb56919b47f032d42420cbcaf30aa3d4"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "f3097471b7a89ecce3038775b3bd81fb9c368db41ec25948571ed2fd91e536c9"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "efd4e1878e78f273055a4ce1e5b60c96a22faada51fed7929629f2c2c96c19c4"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "7f7546fb59c6a65e1c1fbffdcca7328a46c39077127b4a68872f485912f0879a"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "f37a14278eae799d17b35f9311a3fc8c3b2e7531489127413ebba88245bc171e"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_GoogleDataTransport.xcframework.zip",
      checksum: "1287288fa22c33f834c0e4f4fcc5b2c31b9045d5f8e0251fc607cd26b692cebb"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_GoogleMobileAds.xcframework.zip",
      checksum: "20317a1a283f2f6deba6eb92e39abb1e337d318277cc362dceefcc0260570202"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_GoogleSignIn.xcframework.zip",
      checksum: "ec5166688537731f09daaeafc05afb5fe275d983a17a0de11e4e8985f83f546d"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_GoogleUtilities.xcframework.zip",
      checksum: "429eec5b4d81fc35c2d2c6c1323934392dbc2f03e22e8b50901b89540ddd5b5c"
    ),
    .binaryTarget(
      name: "_Libuv-gRPC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_Libuv-gRPC.xcframework.zip",
      checksum: "94c228e1de9152b71394cb55dc85909b81f56904f602b844db9380b9409e94ba"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_SwiftProtobuf.xcframework.zip",
      checksum: "7355fc59be1027e31d3d9e9010483ab003b4c2f4446e8c8b1c7ed5df514d817a"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "f23cfa180a0be03343a9005a3b212c2f851e10e1d3f6e1ca3ff758d614a6d59e"
    ),
    .binaryTarget(
      name: "_abseil",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_abseil.xcframework.zip",
      checksum: "aeea1b58839fcbb0aeb419045285a8338609698442ad3846d85e03aaec7f97be"
    ),
    .binaryTarget(
      name: "_gRPC-C++",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_gRPC-C++.xcframework.zip",
      checksum: "0cd32d2857a64e3b878a9d8cb1efea37b3d0978762bb9221984ada5310fda15a"
    ),
    .binaryTarget(
      name: "_gRPC-Core",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_gRPC-Core.xcframework.zip",
      checksum: "d431ecf54ae3f2b1e6f337b2b5413aaaa253e0b8be80a9c412f90f4ec6e39731"
    ),
    .binaryTarget(
      name: "_leveldb-library",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_leveldb-library.xcframework.zip",
      checksum: "2142b6e3cf07a28cf5f9128c6a7bf2925899157864ccab004582f28fd5d3b876"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.2.0/_nanopb.xcframework.zip",
      checksum: "4546ea52a3d115593f46bb9f5584288815799b713685a7bceb86a364cbc60146"
    )
  ]
)
    