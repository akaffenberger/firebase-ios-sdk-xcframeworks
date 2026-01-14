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
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_absl.xcframework.zip",
      checksum: "da868d1b7ce49382ba84a3931a6c57f9ec0d0969d6e9e5ab3ecd0fcf2f0c9b7b"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_AppAuth.xcframework.zip",
      checksum: "10de3f7b6abc887d29279475b91b7f7208551998d39922c0dbf6dfd8d2bdfadb"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_AppCheckCore.xcframework.zip",
      checksum: "0a4505356a2378f412754900e3c478b1ba4286fb950a7ee7e6a812a08994b1fb"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FBLPromises.xcframework.zip",
      checksum: "67cf9cf7d71786e432228449f011341d68a2dd289df833e07132a2585346afee"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseABTesting.xcframework.zip",
      checksum: "f33ab20d5c930a51516c7232f2d36d02daea713c8b0229c7515f51f73bb35e5b"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseAILogic.xcframework.zip",
      checksum: "feba9ce564465f089b4e94d259bdb86d03dba9487b3554edb36a5a81390a4b22"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "5cfc9198fe73bfed52ce40d33d4db718e953243b08020634904920d832067343"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "c263c3972fb4c81c33fd37b3622e8bfb6a8afcdb727570b7a5463815d7e02ea4"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "b17589ab7b101fa15708fc41a15c77b553869521f0747f5e0aad8dd202348089"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "efe47dd4e35862f26a810fb5df726d2a802706b2506c9d42ae002d6136473f86"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseAuth.xcframework.zip",
      checksum: "cbc7e910db4f1594263bbc5c9d0b22e5cd7d5bd707c9c0069ef041f8e63679ab"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "d7470369f049f3f1e85b0b8a1e2908c48a98a7432eecd15e723fe8ea8be9c1cf"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseCore.xcframework.zip",
      checksum: "e269ccfa72549a273184bb8afbdd1bcb6eb6974de80c4af6cb8a0e3bdb5e674d"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "258bcdc93f381241d37036fcf419e94fffb0cc25b0071926b6f103ad8d3895b2"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "484c13c3e52c9e11d5c5a39566679b5e3de4d9cf8cb15f3b16987b556f3e15e2"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "7c2d7e60338fe0eefb766efef5d2c0c0c80a6b3ec6d6b069a26dcb475e2a33e4"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseDatabase.xcframework.zip",
      checksum: "bf2c38f24256ac45270927b51df53510bdea8d8548621feef53f2f12527b4dc8"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseFirestore.xcframework.zip",
      checksum: "ed8acd630be75752ea8fbc547922838cb990303e85c1d91cd124231ecb0c472f"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "7b0132b5dd186a6e5e19ee0686985e712653a2a4b5a07c3f7ae73d7cd8d8349b"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseFunctions.xcframework.zip",
      checksum: "ff4a54556f0b682bd8296a8876c5cb0d63ce56d85cc1cd16ea2fb7677bb27096"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "4c855a6e43d7cf63d70f54660c34085ee2116fc2ffa42999326529287a64344b"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseInstallations.xcframework.zip",
      checksum: "30536a0997e3ac0b55cd0b659efd92768d791a985a38c984c4f98921597ad6f3"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseMessaging.xcframework.zip",
      checksum: "a3a27f7d66fd468c44fdc82c2d748e6a6bc9545b27838142fcf96084c4bac2d5"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "f887c262bb72c690f529305aabfbf958352de531112871b8ae8d590e4749e102"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "47b92d6ac85868d8aea121efedc67fd522c950928a60fbf0b5f8e241878b7f06"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebasePerformance.xcframework.zip",
      checksum: "e952665cf5cce582d204e73143403bc8b55ed6f0c74b823c37f0c33402c7a8c1"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "443d34f7f984a0727c2acb45ba9c1f0f169e85ea7761d39da76ee98d3d03aa2a"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "b6b52767b30c1d213693d6bc3a46a5724df58b0be2dfc992383b3b907886357a"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseSessions.xcframework.zip",
      checksum: "549a30c71160848bfc502890cc36b68a048507d2e4d7a73b34881f14f188ca13"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "4c4838581c81d54edbde4b87cbf84a447a7e3cabc49e79a20167bfc129412e80"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_FirebaseStorage.xcframework.zip",
      checksum: "ee1dd0ae624ea89aecd8ac63dd97d83445d9f77a15e14d7b5b95abc097e75932"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "9435b71da9d1f8cb75c93698c6717642d1a03c150842e60904ecde46735d71d1"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "bf859cca15fd6bb0774bcc185eeebb39caf9f2d14e3d74543dc8731778fe5a68"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "1e3fa385dbf6491e0188e87865609392ce0d85fb1671eed91494bc74709d6c93"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleDataTransport.xcframework.zip",
      checksum: "307239f2e3bf3940c00e249d7724b46e780b3dc79b3ab151027e43f4e8548c96"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleSignIn.xcframework.zip",
      checksum: "98d1d0de0652ec0155593d88ad513cda17cdefa2f423113c53e9e83daad3d885"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GoogleUtilities.xcframework.zip",
      checksum: "5280283d6ba0fb3dae03bb573b038189d20914eb57cbd0bb9e2d1623967e3292"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_grpc.xcframework.zip",
      checksum: "1740e0b73ab44c3ad68f9cd92fe13b4b1927efb6c9832d72a80bdc1bff866084"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_grpcpp.xcframework.zip",
      checksum: "5be6c9b3fe3b23ccb14b1e4059b9b2d0fb836f442f9d0b812a23508dcbaa6b39"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GTMAppAuth.xcframework.zip",
      checksum: "da7c33dedea9785a6df7b3eaea63cbd627ec1233e01bc240601b3350921227ab"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "023e6ca91d51e23ffb5a33cebbd0e42f0344728fa540de6b313f1a3d0aa77e66"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_leveldb.xcframework.zip",
      checksum: "d6a230853f91f7942f62d0a1b2b7afd74862b0d5cf50a249fd236876ad1d292a"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_nanopb.xcframework.zip",
      checksum: "bf8f0d88ed06e706c4c8a775dd8d956e006bb8688a0d55005351ee19792b4e17"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_openssl_grpc.xcframework.zip",
      checksum: "2a107aedf399e7afcc1b3e944fd794bd8bd10f0cdd1af942a705516d5f0016d6"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_Promises.xcframework.zip",
      checksum: "656346beb23dbf29d92418623f27bc07d298544986017839cd8da94c57e379ed"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_RecaptchaInterop.xcframework.zip",
      checksum: "5eb6b96792967d83f8509aa17aee15ef14b1a3b7552f99e938d504fc3a5024b4"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.8.0/_SwiftProtobuf.xcframework.zip",
      checksum: "8744a7c5e4ecda84d089211eac94a172ff75ff5b449d40a5dede5401fa7c0c0c"
    )
  ]
)
    