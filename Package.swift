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
        "_AppCheckCore",
        "_FirebaseAILogic",
        "_FirebaseAppCheck",
        "_FirebaseAppCheckInterop",
        "_FirebaseAuthInterop",
        "_FirebaseCoreExtension",
        "_Promises",
        .target(name: "_RecaptchaInterop", condition: .when(platforms: [.iOS]))
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
        "_FirebaseAppCheckInterop",
        "_Promises",
        .target(name: "_RecaptchaInterop", condition: .when(platforms: [.iOS]))
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
        "_FirebaseMLModelDownloader"
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
        "_GTMSessionFetcher",
        "_Promises",
        .target(name: "_RecaptchaInterop", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_absl.xcframework.zip",
      checksum: "e5c18aec234fa25ce17d5c3bfb1b1e93c366ff41fa7d634f17b3c61ee151530f"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_AppAuth.xcframework.zip",
      checksum: "0daff5bf6391926f660cb55ad997a1acbbf309cd7dbb75998eceb479d6328831"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_AppCheckCore.xcframework.zip",
      checksum: "5071dee761dd98cdbd2b89908fa70546506b40fd09247f2e97756c776246e970"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FBLPromises.xcframework.zip",
      checksum: "10a50294bcc1e5f5cafbc9cc51aa6863b3ee2091d764b6b14f2f43816b198cbe"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseABTesting.xcframework.zip",
      checksum: "ef3d2df16155b2297828b0144148466b2aa56c563727db2ea1e81650725e5d60"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseAILogic.xcframework.zip",
      checksum: "d5770797b462a7bee6f6c1c9aee5ddefe30ab114aa933d64c8bfa0f45033fede"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseAnalytics.xcframework.zip",
      checksum: "40736826672a16cd097e0f25adbecf8b5b7f77591891161cfdf05d59876c7395"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseAppCheck.xcframework.zip",
      checksum: "63a9cba4de7c58d86cd8947c4bd6c5171aa4ddde1cc7f3e108846f2122ba511e"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "3daca08993d07ed412d2d5fc8b870c595c636954a28a5747b95900d712c8a3b2"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseAppDistribution.xcframework.zip",
      checksum: "db6ae335a64525d1b2f95322f6f2a7b514aa1223a28ea838fac844af961466cc"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseAuth.xcframework.zip",
      checksum: "44ba486c9a5d44c67dd478e99ea5c1b6a9ca39e65950be6aa87db26697626d3c"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseAuthInterop.xcframework.zip",
      checksum: "2cb23b3ca9da0de01e07c1676ba734875e933a3a9e97c7be5dfd75c4a66eac07"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseCore.xcframework.zip",
      checksum: "d8a1e065fb3bd1ce428e4139736fc25be6f0aefcda5a8b96781f0c09fbe07595"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseCoreExtension.xcframework.zip",
      checksum: "d1485a60fc40e1823fa39c1fd4b2d21838e0be89fd2f0afb53338ea2291815d5"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseCoreInternal.xcframework.zip",
      checksum: "9b344833c750895e92df8654da38393a2314fe5eba5dc00c95b3a634f4b42dda"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseCrashlytics.xcframework.zip",
      checksum: "3743bb6d4afa5e7c3418514b8689e6076429b091a2b95212ba1919605e74d0ef"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseDatabase.xcframework.zip",
      checksum: "ae462e08eb053a734ee9d778fc5ca93ac134819e345c54b018a6bb3f620c6bac"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseFirestore.xcframework.zip",
      checksum: "60c476f4ae426db4bab860f631f8bfa66bfced97d012c922e07b627823904b51"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "c32ef831f5f41131df75a8bc01153cc51a739ef694d3ab65c146bde1bd095028"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseFunctions.xcframework.zip",
      checksum: "d3c3007d0b13745ea6606871a1a21794abab12498007196a037d6003a1f8b85a"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "16d8add8e0f6ffe9d70fecdc756af76313fe702e65c0e9f2c07116d00f87d349"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseInstallations.xcframework.zip",
      checksum: "e879784c764dddfb73974146de891d201abf3b64d8560ea54c898030d3f59df5"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseMessaging.xcframework.zip",
      checksum: "d05a86aa2238089b67ca2d02a8cb57de4708f5642969583220d25c06af9596f3"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "bcf361ecf8d4e05bf76f01c5e2268a57cf174e3d89d464c8b38687fb51342060"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "fb9e0f4a7addb3b756c1a25884be7b449c04343e1af9249c17c264a1e9f4a048"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebasePerformance.xcframework.zip",
      checksum: "b750fc269353c5fef82443f472941771f645f279dea2b00c5079438e9cb8380e"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "a75448cfcc29f5c53eb0d70763762c60aee78bc5e09a3a613d2a1e383eeee45b"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "96eebdb43b49461a65ff367feb79fa7c5c6f152c7dd0dc19e8f49cff62a253f7"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseSessions.xcframework.zip",
      checksum: "7be0410076c346f5c1707645e37edf4eadeb2ff6428fe29063f264e19e9903cd"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseSharedSwift.xcframework.zip",
      checksum: "6e230752c012df555fbcb0638d3d4ee2ff0c3fdaf74dc0aa8a1c589075c9b550"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_FirebaseStorage.xcframework.zip",
      checksum: "067d68cc21b9c958363d1ab50aa6236986c6021b65470552f659a11747808ec1"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "53f5409b716b436cf0b3e01ac09d92160fe853a06786ab7aeb6f97906095492e"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_GoogleAppMeasurement.xcframework.zip",
      checksum: "c625a3650ae14916ebfb88c5d0ea7eacf479f44d326ee767c3f6d22c21bc62cb"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "f33ad3512474133780494c7b05bb0f9340a6f7759d12aaef392e171f107362a1"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_GoogleDataTransport.xcframework.zip",
      checksum: "7fe65abffebe99b347de69772674874ae634a034765bd6d1563aef0eef7d3a60"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_GoogleSignIn.xcframework.zip",
      checksum: "615e4ca9f6eeba808927d68d88dfd3690c2c1722e3d5adc08e93a5634f39b76f"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_GoogleUtilities.xcframework.zip",
      checksum: "a772c87f7cb7c7af776b583eadbf5231b8a23afd37686a75923c763fcb8a8b91"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_grpc.xcframework.zip",
      checksum: "f59ed167d2f836c94546062b6e369b3bd4c2bd0b855ef75c2ab97564a10c9f8d"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_grpcpp.xcframework.zip",
      checksum: "b8a85a32733fd27d1ad26e1dae0fe2bd2a5dcb29fd0657fe61cfe5c66288f43c"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_GTMAppAuth.xcframework.zip",
      checksum: "278c183aff88e17bf45c5788cb461ee975d703cb680fe164b6652d7d6dc858a8"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_GTMSessionFetcher.xcframework.zip",
      checksum: "e92976750d488701f02f8afc59b7bcc4500efba45acce51c31f10756294d4dd1"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_leveldb.xcframework.zip",
      checksum: "c57ba817c57526ed91687e1dd8772c59a93274fb41b9a67a78a6a875371ba05c"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_nanopb.xcframework.zip",
      checksum: "408ab12d9505610644cbe1fad37e8b0540c82df45de3e0fb9ac12c657a7a9dcb"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_openssl_grpc.xcframework.zip",
      checksum: "5c86947095b196d000bac944955375b1def689b0c56310869c71bf21892367b2"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_Promises.xcframework.zip",
      checksum: "0cbde3f92a394ebf59cc5a8912739b9fc949bf8b68cf29447acd394920fe715a"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.19.1/_RecaptchaInterop.xcframework.zip",
      checksum: "cb4c73c721563603dfe96bcd3436ecac9bb77685e352058e7fa91ef9fe9c7cf3"
    )
  ]
)
    