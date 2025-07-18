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
      name: "FirebaseAI",
      targets: ["FirebaseAITarget"]
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
      name: "FirebaseAITarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAI",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension"
      ],
      path: "Sources/FirebaseAI"
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
      name: "GoogleSignInTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_AppAuth", condition: .when(platforms: [.iOS])),
        "_AppCheckCore",
        .target(name: "_GTMAppAuth", condition: .when(platforms: [.iOS])),
        "_GTMSessionFetcher",
        .target(name: "_GoogleSignIn", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_AppAuth.xcframework.zip",
      checksum: "c36f24f7510570a4ba81ae72e711d771925d15fd567721df63474329d86671a4"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_AppCheckCore.xcframework.zip",
      checksum: "fd9961032159909bea12dc1853ac988896f2e849c6745ed924cbdcfa37f2bc44"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FBLPromises.xcframework.zip",
      checksum: "6cfa1ae80d1c6209c99213268a881e5d8aa2669675a0c6eb34eecb49b3db5a70"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseABTesting.xcframework.zip",
      checksum: "87ecdc18c38f93641bab6d6141cece31ec3cbe7b922ee16a10f4de2b47a98113"
    ),
    .binaryTarget(
      name: "_FirebaseAI",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseAI.xcframework.zip",
      checksum: "6faa0c1fb396e0de41b1c28935c6baa82a60a453eaf1b261d71aa71b8d02c87c"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "0fc4beef8205391ac52c30c1d87f200949eb12225dc1c02833470eeb8bcc95d8"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "5f30cfd23495a2106b7b8a007a5d61f5b454ebc38f478958d37287c59f8c90aa"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "73e1d163b464b58fcf6e8ed8e3001912114308625c79575538125c619ddf8a8a"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "3a44a3b834c51199e69f7ccea52365a75172c7074c9d2ed27b95cbdf910ecc15"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseAuth.xcframework.zip",
      checksum: "b06705406f6595ed833aa50824836c55f0c9d99179f5e7de5f5fb38e55088557"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "fb159fa1a761b9264341f669f60cd03d4a57407c8d2493f98822d726fceaf687"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseCore.xcframework.zip",
      checksum: "bed0a29fb33e9ef91a67bcc723ca67b4b27902219858bfae9ffb86ec65eef96a"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "54b818fdd278dbf4871c358d9895f902b11360804cdf9df31d2b7d25b0cc8f50"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "7d118e4d9bb5028fad6a1b74f0fc8c0ff37422a8377f33de6da01754a3a640b1"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "034179dce05b6efb2723ae6329b63b0575ef7c226211c4192d99a14dbadab4d4"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseDatabase.xcframework.zip",
      checksum: "3d263c80ee7a481252bf5b637afb4ecf44d7ea638e75a21d4795bbb376d94a67"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseFirestore.xcframework.zip",
      checksum: "5def887b8fb607f2959a8c1d429d2e2260fa7efa76f32af8af809ddbb016cee8"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "783db409f79dfb49c6991fe9bdce02dcdda8955093c578998a27acdfd8cc984e"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseFunctions.xcframework.zip",
      checksum: "9cded00c541bb29031b94ee6b763335aa5f16a363cb2570e95bdb2bafd57f8c5"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "1b47ac7dac1d24b08495d99ca143d85038fbbbfc0fd9de8432fa364b07bcbd24"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseInstallations.xcframework.zip",
      checksum: "b64210db88115f173b3163de552fce56f1f40bb91fb420d9ca3a040bf1fa6096"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "f1981a983b92502ecc1acbbaff617ffa09f90efb9fd81f48e81078e3f2d310e5"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseMessaging.xcframework.zip",
      checksum: "8a23bcacad2602a96bb3b59b9b37509ba39188b72a522e700a5db9dcb43480f4"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "aef5231861c560cc19f7b51e0de75776f57807e95b30ea0bb86b0b9668da8615"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebasePerformance.xcframework.zip",
      checksum: "2be47da9786e1d9368b426fe1dbc7c1ab0a6a68dfe946f7517d4409dab4db2ba"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "eeadad6162499b486a987e082670acfbbb1686bf8ce6f25e4a6f56ded3f2df46"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "0c431e01aa87a17d7e4a7f5e03b8d0d75c9d1b22a82702f179f0d0cad51788ec"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseSessions.xcframework.zip",
      checksum: "2b4ff2a1a6bb30b69e3ed158914515d35f6e4ff9ca86a7f828b14491ed1ffa57"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "c6ad2083b1cfb85d0f8711a799b2d87265a0707ecccb597b7357a032a6bd26e6"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_FirebaseStorage.xcframework.zip",
      checksum: "19d370db8a88f733607787972cff77f2de0d620ccba78c2f87113f0726fbe1fd"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_GTMAppAuth.xcframework.zip",
      checksum: "57bb4b5d25a457ece966c170563c103d432a2bcdc7d16e4f4fc337d32c65f4ac"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "d54da2c425715f37b9ed7e54d502be97a22fe577b473a7caf9eeb1cea75a10a6"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "0d6545c3d99a89f7aa7c7da2a5218dda619543c8a45a6c3c45e938a310f47f50"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "18f146c8ba5661b8b8dfb5a769a0f62ee6a5c858e31d77d09028c174c0c391a9"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "d0f5cfb240821ff0272a32831184307a94afcb5bb433087b06fa185c6c1c899f"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_GoogleDataTransport.xcframework.zip",
      checksum: "ef86fb252506071c406400d89bd86b9fedae6ce913f77944dc5ac14b09b3fba0"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_GoogleSignIn.xcframework.zip",
      checksum: "55da78188df598386f6b2c3af62f98b12efa701380ccd091f1ec1d2d6b9cca55"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_GoogleUtilities.xcframework.zip",
      checksum: "2d763b7962dbf698384da6df13d7453080bf8cd7f21728b93658ff1c97beeef9"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_Promises.xcframework.zip",
      checksum: "8666e4339ffe9270fac599fcdfd741b3c1adb50111e04246207c207e3daa43fe"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_RecaptchaInterop.xcframework.zip",
      checksum: "b741b65216d9b3d1814c74f257cc3258c1744e979ce44914b739782ffdaffc5d"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_SwiftProtobuf.xcframework.zip",
      checksum: "56ed460ba9663a14bd8cf643d1920495911c5b8b86ac352df91985d797cd9043"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_absl.xcframework.zip",
      checksum: "069ee3c90bdc3619971d544f0529e5b98aee538f8974b5b222c747d9bf9c7456"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_grpc.xcframework.zip",
      checksum: "604d7e0d7300ac6301c4562059f015f21ffef4b37653bc30c59964bc00763584"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_grpcpp.xcframework.zip",
      checksum: "f78394492ab43072bc1d89b374f18f9b9c2e38a1849f8e0ebef9185cb9560e50"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_leveldb.xcframework.zip",
      checksum: "7acd05d056b5b2746caaae56a67410dbed9633177d9eddd7f875bbef0d1d9f8e"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_nanopb.xcframework.zip",
      checksum: "4bf9ed540dbd1440036e8eb65ccb8b21628698bca45c0e45ccdd81bff61ad448"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.0.0/_openssl_grpc.xcframework.zip",
      checksum: "737a09820c62b464e5c5bd715be5e2edd9abc593d6e3cc0a029ef980e9f8ccf7"
    )
  ]
)
    