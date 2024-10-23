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
        "gRPC-Core",
        "gRPCC",
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
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.1/AppAuth.xcframework.zip",
      checksum: "81e0e93142b688fca561796ca3971b36253fe52fe88ecfbb3506ee73152117f7"
    ),
    .binaryTarget(
      name: "BoringSSL-GRPC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.1/BoringSSL-GRPC.xcframework.zip",
      checksum: "55d187c738deb39e1c55bfcb7560d60cab7a5321685cad7fc0cf24e7d242a29d"
    ),
    .binaryTarget(
      name: "FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.1/FirebaseABTesting.xcframework.zip",
      checksum: "4a7d1f5229660123b0c32c3030be07de4d0ff27aef4a21034f4313700c18a6da"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.1/FirebaseAnalytics.xcframework.zip",
      checksum: "cdc7aefae08740d4c4d263f201004b825a8478fcd46e80a56f9d2eb524ced2df"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.1/FirebaseAppCheck.xcframework.zip",
      checksum: "b2f76840240202c70a1ee1d34d17dd03e5355069d3d1bb4d9e903c83f12a2d75"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.1/FirebaseAppDistribution.xcframework.zip",
      checksum: "7e307bc97e1dbb525207106ad3668338ad05bda0468305be0236d7f29731ec9f"
    ),
    .binaryTarget(
      name: "FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.1/FirebaseAuth.xcframework.zip",
      checksum: "8756b1cc60544853951eb38c64a648472da7c2e05cc78d2726b5ef14712b68a1"
    ),
    .binaryTarget(
      name: "FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.1/FirebaseCore.xcframework.zip",
      checksum: "c4e2efde8863b1a2917d3cbf479d32be121595dfa265e4af80197126b381d9b0"
    ),
    .binaryTarget(
      name: "FirebaseCoreDiagnostics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.1/FirebaseCoreDiagnostics.xcframework.zip",
      checksum: "8a46e9c1f85b0993292c4946ca29f976f467d1dad2f250e72703e7769ea09708"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.1/FirebaseCrashlytics.xcframework.zip",
      checksum: "135de2ec0b3c53a688781f2a5b4b9054b0a861995d28b424e5629bec648bdf28"
    ),
    .binaryTarget(
      name: "FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.1/FirebaseDatabase.xcframework.zip",
      checksum: "bc69399f02f75facb9dd2b6037f076776c39658dac18d76d8bd137d2d741e23d"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.1/FirebaseDynamicLinks.xcframework.zip",
      checksum: "968f7fb8c2962ff54907b7693fd5754b01433b67839b42afc590a9909a9c0d9f"
    ),
    .binaryTarget(
      name: "FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.1/FirebaseFirestore.xcframework.zip",
      checksum: "43c06fcf062aad00ff525bd2a24743bde07ad33d057636c2623721aa0519bdc3"
    ),
    .binaryTarget(
      name: "FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.1/FirebaseFunctions.xcframework.zip",
      checksum: "c1eb2376b4b35827dc693ab6f72704902857aec51ca459f91903b9a4ea4755a4"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.1/FirebaseInAppMessaging.xcframework.zip",
      checksum: "bc677195ba1832ec40ea3a8c42c9daf9953570a84fd2a3b0cfa0373cac2181e6"
    ),
    .binaryTarget(
      name: "FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.1/FirebaseInstallations.xcframework.zip",
      checksum: "b74fd0b6f838c322aa3e798f63fa226d30d8f37230ca3bb3a2c480021f473348"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.1/FirebaseMLModelDownloader.xcframework.zip",
      checksum: "fd8f16579bb0420c85b133fc45d663c2742dea5ed729a6c88a675dfc160312c7"
    ),
    .binaryTarget(
      name: "FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.1/FirebaseMessaging.xcframework.zip",
      checksum: "272a2baf8c3e4b0747d188a29687b8128899e28922ba0afa9faf9cdb347dbc10"
    ),
    .binaryTarget(
      name: "FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.1/FirebasePerformance.xcframework.zip",
      checksum: "65c604e905e0bc288d319d3aabf66ec3472b18dc2338a14a7e3c3075c1ab72cf"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.1/FirebaseRemoteConfig.xcframework.zip",
      checksum: "b13e5fe400f596e5f3146caff50f438d65ab8e022dcdc3a2412dd0dce3658e65"
    ),
    .binaryTarget(
      name: "FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.1/FirebaseStorage.xcframework.zip",
      checksum: "3c8203a35b621ffc1eba277980f99840a01c889556dbe6906c3a2dd8b15f1e2d"
    ),
    .binaryTarget(
      name: "GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.1/GTMAppAuth.xcframework.zip",
      checksum: "6b123015b464b9c549abb7b2a0fe1bbaea825d7f1bda5bf261dc054825f68084"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.1/GTMSessionFetcher.xcframework.zip",
      checksum: "d1e7f89ddc92809e50b3df436da6ebc7fd2dfbda137835a3c852219f156e6a41"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.1/GoogleAppMeasurement.xcframework.zip",
      checksum: "96315b6531c9540153d27ee4e8bff4dc46e0badd51c7ddae9be522e581b5d382"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.1/GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "650d78cd9d855305fefcccaf30db7301aabc011436ee7540dcdb1158cf990b12"
    ),
    .binaryTarget(
      name: "GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.1/GoogleDataTransport.xcframework.zip",
      checksum: "88f7c0494e4579f88a19e3f2f723005e4e185cf474597ba0040478ac42d3d857"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.1/GoogleMobileAds.xcframework.zip",
      checksum: "d8a27801c1858735183ac20d95c3e1384cb3c8700cbcececfa32b5b5f5000498"
    ),
    .binaryTarget(
      name: "GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.1/GoogleSignIn.xcframework.zip",
      checksum: "df4c8e295a4a766c00f9aed5768db3ebb0bb33fcefe37e6fc19eececed91b01a"
    ),
    .binaryTarget(
      name: "GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.1/GoogleUtilities.xcframework.zip",
      checksum: "701981fc3cb789c307c9402a29f7c538d780e6d5cd1d16c3a793174a302555d5"
    ),
    .binaryTarget(
      name: "PromisesObjC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.1/PromisesObjC.xcframework.zip",
      checksum: "108412e1547fc4c6809fa9f8a15271fc5e5c366eedeaf0618900d0dd74f50a23"
    ),
    .binaryTarget(
      name: "SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.1/SwiftProtobuf.xcframework.zip",
      checksum: "a95577979486c31971bf185c14b70348ce842e2dd7f30b24a82e9c626574b682"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.1/UserMessagingPlatform.xcframework.zip",
      checksum: "64e104ecdec45aafb0f6d6797ab6db663c464df1ab219102cbb248be1545f4bd"
    ),
    .binaryTarget(
      name: "abseil",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.1/abseil.xcframework.zip",
      checksum: "6226c1e6d08bb6a27a0575b168e1f6bead3addf42b1fbd61467b3a1e84ef6130"
    ),
    .binaryTarget(
      name: "gRPC-Core",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.1/gRPC-Core.xcframework.zip",
      checksum: "8f4b12e3bd8ceebba402741a876338b7f03b7fbc9a4358752d00218056656dd3"
    ),
    .binaryTarget(
      name: "gRPCC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.1/gRPCC.xcframework.zip",
      checksum: "e45d1a362aa844b69623da75ffee96faa8365661924ab4aa359f90539dfac185"
    ),
    .binaryTarget(
      name: "leveldb-library",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.1/leveldb-library.xcframework.zip",
      checksum: "33d294c8a4f3293351acbc043c11bea8577929600d68eb75eda4d6b7c5b00d29"
    ),
    .binaryTarget(
      name: "nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.1/nanopb.xcframework.zip",
      checksum: "e552eac9184c4b1b876d710aa587c685fb509575fda0f4e3b8694937449fd909"
    )
  ]
)

