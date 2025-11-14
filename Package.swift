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
      name: "FirebaseAILogic",
      targets: ["FirebaseAILogicTarget"]
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
      name: "FirebaseMessaging",
      targets: ["FirebaseMessagingTarget"]
    ),
    .library(
      name: "FirebaseMLModelDownloader",
      targets: ["FirebaseMLModelDownloaderTarget"]
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
      name: "FirebaseAILogicTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAILogic",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension"
      ],
      path: "Sources/FirebaseAILogic"
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
        .target(name: "_GoogleAdsOnDeviceConversion", condition: .when(platforms: [.iOS])),
        "_GoogleAppMeasurement",
        "_GoogleAppMeasurementIdentitySupport",
        "_GoogleUtilities",
        "_nanopb"
      ],
      path: "Sources/FirebaseAnalytics"
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
      name: "FirebaseFirestoreTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_absl",
        "_FirebaseAppCheckInterop",
        "_FirebaseCoreExtension",
        "_FirebaseFirestore",
        "_FirebaseFirestoreInternal",
        "_FirebaseSharedSwift",
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
      name: "GoogleSignInTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_AppAuth", condition: .when(platforms: [.iOS])),
        "_AppCheckCore",
        .target(name: "_GoogleSignIn", condition: .when(platforms: [.iOS])),
        .target(name: "_GTMAppAuth", condition: .when(platforms: [.iOS])),
        "_GTMSessionFetcher"
      ],
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_absl.xcframework.zip",
      checksum: "de6f2158987855804597d04ee9095f84563fdc7dd32945b5aea246505b9fd12d"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_AppAuth.xcframework.zip",
      checksum: "1018119d5f9c135a7591f965ba332d22be73fca0023a6312e141183f47e064fa"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_AppCheckCore.xcframework.zip",
      checksum: "d3403207b943196898f4b336621f6cb7e26285679c8494d98b1998c910a82e1e"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FBLPromises.xcframework.zip",
      checksum: "2cb2e107d63b184b3b5028d3e3d6ca44fe93aab334c7dee46ca34aef1d559029"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseABTesting.xcframework.zip",
      checksum: "a584bebf2eac255fd53462ab3af9425cf3ed4cacafa97729a572ed0caccd2a71"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseAILogic.xcframework.zip",
      checksum: "f48629e9bf632673abf2d15ba69dfa155f0b55b000268feec44f239ddeb0bb39"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "41e7d4ea3694312408c4aff1a5ee8dadb98ad0cbc2672d73ea3269c81df63d66"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "60755d73dbda0ee491991be534bc3d548ab9085f308109eebdfcff908f944dc2"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "f0299de8c9666869582b84f2aee09d79b9c062ec7b9f8032f555db474cdcb5d2"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "d03759cbcb976e57cf8705f293208feba2fe8d690bd3322bf6ae61b2ddab898a"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseAuth.xcframework.zip",
      checksum: "81db50622f6173c9d83089fdd5361b9a71c80608690ebb0ae057bc43b7eb7880"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "8ad88da8df3f87652f34ac024bb785dc308d0c34f3e9efbf43d8643f80223f0e"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseCore.xcframework.zip",
      checksum: "1b57134327ea3f478dc6110cd096a669a666b1b71ef14f0d42de7168e908ed34"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "ab05aa9ed8a17a362ff1c1f11874de2e770eac6e4fb1e44e2bf6c8b136a14519"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "0dd2bbf4507298215b0777280743b4a4d689b5fe8317bd5f4f8fc07b1eece7a1"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "567c444f0188cf59def0d8be869f8aad7b36d5685769ba486df8eb8a3c8b6889"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseDatabase.xcframework.zip",
      checksum: "42c1e010d2d16414dabfd6ba215a5d362c652c7539ba4b8b1227e099360b9515"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseFirestore.xcframework.zip",
      checksum: "b95c4ba68ee3fb944eb203e270167f0b03dac685aa5d598799d5497b8b9da5a6"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "0078cee806b34ca8143e8d43585245feafe4f397c3b2044c25757776b8ddd569"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseFunctions.xcframework.zip",
      checksum: "d4d3cf087790e5ab08f6075b2cf2a65d790601cc5da6ed814ff2a4ab12d4e36a"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "483b49dee0269babad8d55ee6e07a977b3b402881cb82bf997c05ddc1b8380c7"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseInstallations.xcframework.zip",
      checksum: "1ce63d48fe9cfe1e9a8893ab642715778d047aa70918c4c9eb47c91d45e026f8"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseMessaging.xcframework.zip",
      checksum: "fbbe351b851bdaa4394a922fa1bdbc331985f59fba9c8d0eb743a462cf1dc48d"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "b14270b41ede1366d9a583fec4ab1052664031c596d49e68216a07d77a709e70"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "faaa930a11a82861275eedae326378b082250fe95219acebbb36e586037bc580"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebasePerformance.xcframework.zip",
      checksum: "ad5b6ba804680b450bd943954de2d6c7c72244fa7cc49166745248a0e757b732"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "e7e2c5db1d5b8a89b0b553c2b4b7269729bf91962ce713acc50801c55b4fa07b"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "a613a411a6c7af078064db1674ff1f7d1e08470b89ae75f3cf77f20f7204de9d"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseSessions.xcframework.zip",
      checksum: "e6771489488d6ceb740618a38282ca06b2566be73443a6dcd1ba53ad6a778531"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "9abdfe9ee5c03790ec32d12eeecb82daccc73ddbf42a8c744308d22fe4e9e6df"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_FirebaseStorage.xcframework.zip",
      checksum: "d05a7329eabc45807a048f484b5be3cc814aea7f357a174261468adac5305564"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "03e5995250b7803db9bb23e9b93179ab05fe8a0160e051994cf6a3e725c231ad"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "4a815cb1892441f9658dc45da874292b8cc2b1a0c05e4f48c0812a50c601ea9f"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "f0814c556422a6967bb9df981ee0d51f4a8e1004165e5c6900a0a19c7c85d4ff"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_GoogleDataTransport.xcframework.zip",
      checksum: "80e420ac3276793671b79e3c96edce07eebde90d0aa3d4ab4196548515ed3f48"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_GoogleSignIn.xcframework.zip",
      checksum: "ab542a11ddf882df66d3a01443ecfd973aba84861b9520fc514ede9efdd3e297"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_GoogleUtilities.xcframework.zip",
      checksum: "e3fcc6949fc455c4e48f23904bb73ab6fa5f70ac77b32290355d5ba32367620b"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_grpc.xcframework.zip",
      checksum: "dee833ace63cee0785574497eb9908137104a8b87b0f88663bd647bbc1ff7d6a"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_grpcpp.xcframework.zip",
      checksum: "54686f6b2614faa5d4548feafaa06ef351ff965a418b91560667e613c7c4f60a"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_GTMAppAuth.xcframework.zip",
      checksum: "5decea390f074b904c002ab1f1f6799fd130840d8d310d3866c4a8d6ae06ddaa"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "218165b95fad6cdc72f3a53fba7273866b161c04df43b11eac7c7ed236441962"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_leveldb.xcframework.zip",
      checksum: "37f9d2cc54743efcf6191b1af057badde459fd38d18597025ecdd259094f34af"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_nanopb.xcframework.zip",
      checksum: "45e09d84e906901387cd4141d63f3fb64a0e24cc75931cbed2832747aca5b623"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_openssl_grpc.xcframework.zip",
      checksum: "9f83faaa4d07e7b8f99433ecb0696df471cd5eaa4c0c74bd261a65ed3656925c"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_Promises.xcframework.zip",
      checksum: "207685e5c46337c42a88b9f75a4d26d526c8e5a8a20c581abd0afa240920aae2"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_RecaptchaInterop.xcframework.zip",
      checksum: "555fa43526606b98ae01707d7d47f974ff26184d478289bb2af6c0679e4da4ef"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.6.0/_SwiftProtobuf.xcframework.zip",
      checksum: "ceb2a4fd5759c4fc29d63b60d95ae316bb1755d967a3f942ac242efc4c2fd27b"
    )
  ]
)
    