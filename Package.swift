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
        "FirebaseABTesting"
      ],
      path: "Sources/FirebaseABTesting"
    ),
    .target(
      name: "FirebaseAnalyticsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalytics",
        "FirebaseAnalyticsSwift",
        "FirebaseCore",
        "FirebaseCoreDiagnostics",
        "FirebaseCoreInternal",
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
      name: "FirebaseAnalyticsOnDeviceConversionTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "FirebaseAnalyticsOnDeviceConversion", condition: .when(platforms: [.iOS])),
        .target(name: "GoogleAppMeasurementOnDeviceConversion", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAnalyticsOnDeviceConversion"
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
        "FirebaseDatabaseSwift",
        "FirebaseSharedSwift",
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
        "FirebaseFirestoreSwift",
        "Libuv-gRPC",
        "abseil",
        "gRPC-C++",
        "gRPC-Core",
        "leveldb-library"
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
        "FirebaseAppCheckInterop",
        "FirebaseAuthInterop",
        "FirebaseCoreExtension",
        "FirebaseFunctions",
        "FirebaseMessagingInterop",
        "FirebaseSharedSwift",
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
        .target(name: "FirebaseInAppMessaging", condition: .when(platforms: [.iOS])),
        .target(name: "FirebaseInAppMessagingSwift", condition: .when(platforms: [.iOS]))
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
        "FirebaseRemoteConfig",
        "FirebaseRemoteConfigSwift",
        "FirebaseSharedSwift"
      ],
      path: "Sources/FirebaseRemoteConfig"
    ),
    .target(
      name: "FirebaseStorageTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseAppCheckInterop",
        "FirebaseAuthInterop",
        "FirebaseCoreExtension",
        "FirebaseStorage",
        "FirebaseStorageInternal",
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
      exclude: [
        "Resources"
      ]
    ),
    .binaryTarget(
      name: "AppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/AppAuth.xcframework.zip",
      checksum: "2301beeb5b46a622e941977bf47bbb7efb2aec1968e7ccef44347e7d0ac39f94"
    ),
    .binaryTarget(
      name: "BoringSSL-GRPC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/BoringSSL-GRPC.xcframework.zip",
      checksum: "0229c8f842159769ddc5d91c78b8feb00948e2b7419f93819294cb53fb6fb32e"
    ),
    .binaryTarget(
      name: "FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseABTesting.xcframework.zip",
      checksum: "8c6d6d2f1f41a254a0f27ae9e03f8f978db1438cacc2a671d57e139cb928601e"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseAnalytics.xcframework.zip",
      checksum: "e11ae7d359aba86a518b2e6c585da605e5b331fb49efb369778bc97fe1196714"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "b5022eb0e29ca833b99245418ff0565b9d148cf93e8fb95d026b9679da822a25"
    ),
    .binaryTarget(
      name: "FirebaseAnalyticsSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "c0145f6f1afafb306d676cc261560fb73cc5edc515d16122838c03d76c562481"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseAppCheck.xcframework.zip",
      checksum: "e50a1227776d80aa30c98be2b885dbe947f42d1ae292ff3d6044cb5173560886"
    ),
    .binaryTarget(
      name: "FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseAppCheckInterop.xcframework.zip",
      checksum: "3e6ee6fb75c9dca3df487dfa0147b725534a82d9903e533af3c36d92fcdd0629"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseAppDistribution.xcframework.zip",
      checksum: "c9ab0698722168c0bd935ba8c1da268b1a5e012b00cf6681fbc3cc48d96ff6db"
    ),
    .binaryTarget(
      name: "FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseAuth.xcframework.zip",
      checksum: "8a3a088c22d6dd473014d6174be2d3c0476c0535e2b1b5248c64da081b4a003d"
    ),
    .binaryTarget(
      name: "FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseAuthInterop.xcframework.zip",
      checksum: "18f9663021d5ba4a4a03fd0e4510bc18db604b66ef60e889a25d67920d7edb10"
    ),
    .binaryTarget(
      name: "FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseCore.xcframework.zip",
      checksum: "ec48f67e312973710fcd849f17550a736211cb734ff3804c65b35a6aad472d86"
    ),
    .binaryTarget(
      name: "FirebaseCoreDiagnostics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseCoreDiagnostics.xcframework.zip",
      checksum: "06bf572a002da108ef6f94ff5c343d8607ec5c610dbc292414120134af9727dd"
    ),
    .binaryTarget(
      name: "FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseCoreExtension.xcframework.zip",
      checksum: "6193b573365bc8b0799fa0ae44ea72378e9db824ea70c34b9560e46c94a4ba91"
    ),
    .binaryTarget(
      name: "FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseCoreInternal.xcframework.zip",
      checksum: "748a54fccb537868614867874abbd4b09b72491be007e91dfe44a525f1ae5ee4"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseCrashlytics.xcframework.zip",
      checksum: "e150c131837a03cf43b37e71c460053d70c1acabe53dc4f97b78615401f5b9e0"
    ),
    .binaryTarget(
      name: "FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseDatabase.xcframework.zip",
      checksum: "1fe62d6efc5c6a40cff00dc9e8aedaa0058b1c05a4797f9fd29b4a4453d04afe"
    ),
    .binaryTarget(
      name: "FirebaseDatabaseSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseDatabaseSwift.xcframework.zip",
      checksum: "dd92526ace1f40cc9877b9feedbc349fbaa248e34b5df248639ed684c2860556"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseDynamicLinks.xcframework.zip",
      checksum: "484e09b23cc34456f21eb6cfd5bb1cf0d11c472faae46d06b61abc1ece88303a"
    ),
    .binaryTarget(
      name: "FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseFirestore.xcframework.zip",
      checksum: "3a084665772d3a238a8680380ae93deff120b636000b570fb0a6ca360d96c855"
    ),
    .binaryTarget(
      name: "FirebaseFirestoreSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseFirestoreSwift.xcframework.zip",
      checksum: "027489330c583196e5d8fab00f49b83147758f410a7cf6aa4168dc803d2fceed"
    ),
    .binaryTarget(
      name: "FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseFunctions.xcframework.zip",
      checksum: "081a78d726a590dd66da77c74be4da0c15ba8380ca6cff91006e0990e8db61d7"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseInAppMessaging.xcframework.zip",
      checksum: "a7cc367b416471bcb43441b2d05715800b886958b3b55c70290561f9e0558f18"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessagingSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "84f42ab89d30f0fce8345b4a6dddff260f0f9a415331e1a92506a872455f7679"
    ),
    .binaryTarget(
      name: "FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseInstallations.xcframework.zip",
      checksum: "5d229b618e0f9ba6cfd2b984b0bcec1006710fbad966d29012433904a346ab44"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseMLModelDownloader.xcframework.zip",
      checksum: "10cd5d00abc8c0390c85affcccf4f39e9df265eaaa236adab853d019af205d08"
    ),
    .binaryTarget(
      name: "FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseMessaging.xcframework.zip",
      checksum: "344e4712150e73ea48377716a94d72ac724c3fec3df45c5549fc5f4f72d72f20"
    ),
    .binaryTarget(
      name: "FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseMessagingInterop.xcframework.zip",
      checksum: "73531dce2f18dfb7838f10a10cc10fba059e20da3ed1d531af15a645739a5012"
    ),
    .binaryTarget(
      name: "FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebasePerformance.xcframework.zip",
      checksum: "33d649e53f3ae607922434c76b95afc6fa527b8a3650102569698338757ef750"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseRemoteConfig.xcframework.zip",
      checksum: "5fb33ed134146ff80f7f7c294b3892845c0386995fbc0cd1bfce648210761c87"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfigSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "7b50f54c4b7c833ad1fbb9549d6aae236b56bb0e924dd5dd1d19ae0926bff211"
    ),
    .binaryTarget(
      name: "FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseSharedSwift.xcframework.zip",
      checksum: "579f87e254d9b4aea95c46e6af38b13fa5143f3bb70f01515fa390084616d923"
    ),
    .binaryTarget(
      name: "FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseStorage.xcframework.zip",
      checksum: "b7460b1f7ab8e5332bcd28a3456798b93c3929a68baa2fddf329a478d38c5387"
    ),
    .binaryTarget(
      name: "FirebaseStorageInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/FirebaseStorageInternal.xcframework.zip",
      checksum: "664154c8be0af4195375c9ef2ccacb4ed4a8ca8d70d31992b9f72dcec7d0fc22"
    ),
    .binaryTarget(
      name: "GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/GTMAppAuth.xcframework.zip",
      checksum: "7926058def705b9cd927c26da1b56b1e6e643fe3a84388c73d33506efc3ef69a"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/GTMSessionFetcher.xcframework.zip",
      checksum: "c5a3e612605a83bdf3d95b6019f5cbe225335b11ffd58d5b891e18e959de724e"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/GoogleAppMeasurement.xcframework.zip",
      checksum: "76c6e52415311f3d708a5f05711fdbaea54230834341072aed7ca700a4e5782b"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "8768847274346a6ed1d21589dbd43cd9c00e00cbdca302d68fa88b9ef599a917"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "5770a7d3238226096be375065c41421bd1f94fe9c8d8f886101bc694b92c5359"
    ),
    .binaryTarget(
      name: "GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/GoogleDataTransport.xcframework.zip",
      checksum: "8c27e6e010acb3d143e1a9835e3fd22010e1e81d6176e368e905ad64c8e8059b"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/GoogleMobileAds.xcframework.zip",
      checksum: "66753b2b1d39067a8f1fe90e41b424d45352f74c65a7bdbab9158eddd5c1543f"
    ),
    .binaryTarget(
      name: "GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/GoogleSignIn.xcframework.zip",
      checksum: "d77ca4e02b1b192f77747e8a9112a25199c265ad9f978ce7c5e6d259350dee90"
    ),
    .binaryTarget(
      name: "GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/GoogleUtilities.xcframework.zip",
      checksum: "483d8f23c65af025d60cab06fe55e3583f08d1c347487774008d538dc76c76cb"
    ),
    .binaryTarget(
      name: "Libuv-gRPC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/Libuv-gRPC.xcframework.zip",
      checksum: "c63addc2b755e6cfc48a2f8c4ae968bfed049de96c2eb89439685027f5cb4703"
    ),
    .binaryTarget(
      name: "PromisesObjC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/PromisesObjC.xcframework.zip",
      checksum: "599ae7887535e241ce523c5dbea42995c61b2d468942e5f05dab1e4302dbdf58"
    ),
    .binaryTarget(
      name: "SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/SwiftProtobuf.xcframework.zip",
      checksum: "054eceb2b8c9703a167782622bf7aa4779e31a8fdf4c094cc3525c5cd3bf2c19"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/UserMessagingPlatform.xcframework.zip",
      checksum: "5c26d4222a29307885d42d5cc781c9853ae0fb9c63d9efef596d52311b36d72c"
    ),
    .binaryTarget(
      name: "abseil",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/abseil.xcframework.zip",
      checksum: "8136c0f0fb7b9477b807bae797743e08c593b8a4be4b07d075bb9b6ab438c986"
    ),
    .binaryTarget(
      name: "gRPC-C++",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/gRPC-C++.xcframework.zip",
      checksum: "bce4ad3553f22249362e4d7fa7447869b532fad66d028d8cf902c7f75bcd76d4"
    ),
    .binaryTarget(
      name: "gRPC-Core",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/gRPC-Core.xcframework.zip",
      checksum: "72ded63e1522d0f5d94146a9648a0479d5fe231a98b52df769ea28594172ee76"
    ),
    .binaryTarget(
      name: "leveldb-library",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/leveldb-library.xcframework.zip",
      checksum: "0446fb83a1cb0a32c3b1cd9f5a8c846414639d9845197f307b9a3b0360e3b36d"
    ),
    .binaryTarget(
      name: "nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.1.0/nanopb.xcframework.zip",
      checksum: "5e466a8237bd7747d81269af02aebb73d277cb124c0ecd43e424c614c6a220d5"
    )
  ]
)
    