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
        "FirebaseABTesting"
      ],
      path: "Sources/FirebaseABTesting"
    ),
    .target(
      name: "FirebaseAnalyticsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalytics",
        "FirebaseCore",
        "FirebaseCoreDiagnostics",
        "FirebaseInstallations",
        "GoogleAppMeasurement",
        "GoogleAppMeasurementIdentitySupport",
        "GoogleDataTransport",
        "GoogleUtilities",
        "PromisesObjC",
        "nanopb"
      ],
      path: "Sources/FirebaseAnalytics"
    ),
    .target(
      name: "FirebaseAppCheckTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseAppCheck"
      ],
      path: "Sources/FirebaseAppCheck"
    ),
    .target(
      name: "FirebaseAppDistributionTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "FirebaseAppDistribution", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAppDistribution"
    ),
    .target(
      name: "FirebaseAuthTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseAuth",
        "GTMSessionFetcher"
      ],
      path: "Sources/FirebaseAuth"
    ),
    .target(
      name: "FirebaseCrashlyticsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseCrashlytics"
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
        "FirebaseDatabase",
        "leveldb-library"
      ],
      path: "Sources/FirebaseDatabase"
    ),
    .target(
      name: "FirebaseDynamicLinksTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "FirebaseDynamicLinks", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseDynamicLinks"
    ),
    .target(
      name: "FirebaseFirestoreTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "BoringSSL-GRPC",
        "FirebaseFirestore",
        "abseil",
        "gRPC-C++",
        "gRPC-Core",
        "leveldb-library"
      ],
      path: "Sources/FirebaseFirestore",
      resources: [
        .process("Resources/gRPCCertificates-Cpp.bundle")
      ]
    ),
    .target(
      name: "FirebaseFunctionsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseFunctions",
        "GTMSessionFetcher"
      ],
      path: "Sources/FirebaseFunctions"
    ),
    .target(
      name: "FirebaseInAppMessagingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseABTesting",
        .target(name: "FirebaseInAppMessaging", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseInAppMessaging",
      resources: [
        .process("Resources/InAppMessagingDisplayResources.bundle")
      ]
    ),
    .target(
      name: "FirebaseMLModelDownloaderTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseMLModelDownloader",
        "SwiftProtobuf"
      ],
      path: "Sources/FirebaseMLModelDownloader"
    ),
    .target(
      name: "FirebaseMessagingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseMessaging"
      ],
      path: "Sources/FirebaseMessaging"
    ),
    .target(
      name: "FirebasePerformanceTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseABTesting",
        .target(name: "FirebasePerformance", condition: .when(platforms: [.iOS, .tvOS])),
        "FirebaseRemoteConfig"
      ],
      path: "Sources/FirebasePerformance"
    ),
    .target(
      name: "FirebaseRemoteConfigTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseABTesting",
        "FirebaseRemoteConfig"
      ],
      path: "Sources/FirebaseRemoteConfig"
    ),
    .target(
      name: "FirebaseStorageTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseStorage",
        "GTMSessionFetcher"
      ],
      path: "Sources/FirebaseStorage"
    ),
    .target(
      name: "Google-Mobile-Ads-SDKTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "GoogleMobileAds", condition: .when(platforms: [.iOS])),
        .target(name: "UserMessagingPlatform", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/Google-Mobile-Ads-SDK"
    ),
    .target(
      name: "GoogleSignInTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "AppAuth", condition: .when(platforms: [.iOS])),
        .target(name: "GTMAppAuth", condition: .when(platforms: [.iOS])),
        "GTMSessionFetcher",
        .target(name: "GoogleSignIn", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/GoogleSignIn",
      resources: [
        .process("Resources/GoogleSignIn.bundle")
      ]
    ),
    .binaryTarget(
      name: "AppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.12.1/AppAuth.xcframework.zip",
      checksum: "05c5d78b7b59577f1f8b402c8c40e4c7f5d6d671880de4da940576824bb3fc5d"
    ),
    .binaryTarget(
      name: "BoringSSL-GRPC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.12.1/BoringSSL-GRPC.xcframework.zip",
      checksum: "b6af7e4c7d7be2c8c6abaa88550cf94ea9bad5bf9ec16e65ddf64369adc9c0f3"
    ),
    .binaryTarget(
      name: "FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.12.1/FirebaseABTesting.xcframework.zip",
      checksum: "bacfa15622759552040b5330255c00fa3ba836822713a40853c5696138a60b33"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.12.1/FirebaseAnalytics.xcframework.zip",
      checksum: "3083d58b3b3c1f57bfb9485de7bbf0fbb55b6cde3ed0f23627ad03c0af4254c1"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.12.1/FirebaseAppCheck.xcframework.zip",
      checksum: "08399e434f29d0a8c14edd8d87657d493de1423a9943eb9ae7232603fece6bce"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.12.1/FirebaseAppDistribution.xcframework.zip",
      checksum: "a5597dbdd7a403548c1d39964037545c0c57318170914774533a37f90ccaf29c"
    ),
    .binaryTarget(
      name: "FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.12.1/FirebaseAuth.xcframework.zip",
      checksum: "3520a17d57b6e1ff8733baa5378b5cefdeb1cf5d0ee65ea0e5d38b726ec5f531"
    ),
    .binaryTarget(
      name: "FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.12.1/FirebaseCore.xcframework.zip",
      checksum: "e757b76d0224b16c8679b8040bde53eceb41413702203f008d5fb4fbc112cf49"
    ),
    .binaryTarget(
      name: "FirebaseCoreDiagnostics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.12.1/FirebaseCoreDiagnostics.xcframework.zip",
      checksum: "16c1b745566b96ac97d282467a9bc8d180a9e9f8257e2e67d62987d2cec01b13"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.12.1/FirebaseCrashlytics.xcframework.zip",
      checksum: "fc5785590cf32b8d43090de7da3e5b5755c7c0319ca69c67ef7657e4a6ab4838"
    ),
    .binaryTarget(
      name: "FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.12.1/FirebaseDatabase.xcframework.zip",
      checksum: "fa4c11f7a334d1c138b206b1db33a3323d779ce24c5c21238d2262ab88efd65e"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.12.1/FirebaseDynamicLinks.xcframework.zip",
      checksum: "b924241bdbe97731b39d1136affef46e157dbb79c9ed9d113dd073462a055cd6"
    ),
    .binaryTarget(
      name: "FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.12.1/FirebaseFirestore.xcframework.zip",
      checksum: "843e246f3e2bd27833071fd061d74ee7b14c2d72ad25ad5aa14482eb18fbad37"
    ),
    .binaryTarget(
      name: "FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.12.1/FirebaseFunctions.xcframework.zip",
      checksum: "5188520cb7d2c8c24c07b4c2373d17bbb146301f8111feca2727f6da30210a94"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.12.1/FirebaseInAppMessaging.xcframework.zip",
      checksum: "dc92b1709e10c58c02d86ced6d633aaa45e2496a1f8a7c572e7b9ba7b33203c5"
    ),
    .binaryTarget(
      name: "FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.12.1/FirebaseInstallations.xcframework.zip",
      checksum: "9132f719172b76f7d1ae3b8fdc4a675a7c9a6b935946a4a2b74e5bf44d928ef8"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.12.1/FirebaseMLModelDownloader.xcframework.zip",
      checksum: "6a388391005a8156cc17b041cd117aedb3892f20ec43ccd030f966d8cf297132"
    ),
    .binaryTarget(
      name: "FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.12.1/FirebaseMessaging.xcframework.zip",
      checksum: "a09c45360362715aa0ca382a7e8f593b1f5d08aa643c22273e5f281bfa84971a"
    ),
    .binaryTarget(
      name: "FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.12.1/FirebasePerformance.xcframework.zip",
      checksum: "5ab9f49b410367fe3133d491017e48ce27515e6af87b02d474d04e0a9d38bba0"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.12.1/FirebaseRemoteConfig.xcframework.zip",
      checksum: "c85c1373008a57bb249e169f05705a2c5c0400174114dcbb18ed7f57f90fa912"
    ),
    .binaryTarget(
      name: "FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.12.1/FirebaseStorage.xcframework.zip",
      checksum: "31d5ea7abfe83e6d644c394230bd254107922c07b27f1f0bb82b9dfd9a911aeb"
    ),
    .binaryTarget(
      name: "GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.12.1/GTMAppAuth.xcframework.zip",
      checksum: "c4549605b119be4e48b4c2b3dea10ce320e28cd4b0f8028d3dec4e690d3d3bea"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.12.1/GTMSessionFetcher.xcframework.zip",
      checksum: "b7d92558436d34f5719ae2f474c4c46294c7ae9061260ce60fff0ff1fea61bc1"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.12.1/GoogleAppMeasurement.xcframework.zip",
      checksum: "e16b47188032a5b6048a41675ff5c7d3bf70d8ec4fe0a3e91cf54ae7bb410e9d"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.12.1/GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "7f519e311e5d1ba1465851017aa407d9ff90f9de375a2aa57075bf99a0f5502d"
    ),
    .binaryTarget(
      name: "GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.12.1/GoogleDataTransport.xcframework.zip",
      checksum: "d3e5a4f9777e6348c7697a14b4d7c5b15797881b715984648cc668adcf4c54fb"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.12.1/GoogleMobileAds.xcframework.zip",
      checksum: "3f88047011dbfc45f2f8388770e30d1b4349cdfa5e97725039581b832561d7ad"
    ),
    .binaryTarget(
      name: "GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.12.1/GoogleSignIn.xcframework.zip",
      checksum: "4e115e9956a55b63a767a33b76ffad3f70b11102f00e672d6fdbde49608ea268"
    ),
    .binaryTarget(
      name: "GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.12.1/GoogleUtilities.xcframework.zip",
      checksum: "80ac556a14a66f3af7ab1cc8d07dfb2ede87b60cac90fa0a418e6f4b88091837"
    ),
    .binaryTarget(
      name: "PromisesObjC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.12.1/PromisesObjC.xcframework.zip",
      checksum: "6230950ef2bbaa3859d711cf2f3ac3984d82af69933e061d6ec6d3f3411b6a82"
    ),
    .binaryTarget(
      name: "SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.12.1/SwiftProtobuf.xcframework.zip",
      checksum: "a7bb3cf357797163dcc8ac18c7c45a05ba4833357e1a26fe1a6bb71e8adb7928"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.12.1/UserMessagingPlatform.xcframework.zip",
      checksum: "e030ac44ec11f6de87ea2e5b3137f2ed8c068e3004b3aa50db6fc6686b0851b3"
    ),
    .binaryTarget(
      name: "abseil",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.12.1/abseil.xcframework.zip",
      checksum: "0a0140ad2398d5daf814743546e6d341af004db28d851e06864df618b560bdea"
    ),
    .binaryTarget(
      name: "gRPC-C++",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.12.1/gRPC-C++.xcframework.zip",
      checksum: "74958eae95bb3599e7ea483f7c4408aa602bbe243bf895c42c78f5618e9a1750"
    ),
    .binaryTarget(
      name: "gRPC-Core",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.12.1/gRPC-Core.xcframework.zip",
      checksum: "4304ce53295b35bfd6ea7bf27e01b9b920539d96db10e289433600b3f3773137"
    ),
    .binaryTarget(
      name: "leveldb-library",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.12.1/leveldb-library.xcframework.zip",
      checksum: "6a2ddcd58b7cb10d9b76c4073d0582d33e23aae8684d59d1bbdaa4c6ba105a53"
    ),
    .binaryTarget(
      name: "nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.12.1/nanopb.xcframework.zip",
      checksum: "8e7ec57a850df24ea4aaec0e039c5ff47200cd40e1a6511db9a6ee26a1189e3d"
    )
  ]
)
    