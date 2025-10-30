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
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_absl.xcframework.zip",
      checksum: "e538fe9f4d6be082f909817e9e7bbeb921fa1451d1b52a2cd307b0720a7bcf76"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_AppAuth.xcframework.zip",
      checksum: "c7c355bc2be18306ea4fec23faab94d2f6759c8cdae6cb499226d2ac0f24b73c"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_AppCheckCore.xcframework.zip",
      checksum: "a3d91b3cdab3ff5ecb841a58c1df143c2a2997341540fd9f9bd9cc8bf497e58b"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FBLPromises.xcframework.zip",
      checksum: "b3af0e37aae942c993906c6faba32a70f3e126f0fc78d90d0f2c685444e5998f"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseABTesting.xcframework.zip",
      checksum: "b73450a431a620ae419dbda7e90640c5ca201931a3b11f29439295f883245fbe"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseAILogic.xcframework.zip",
      checksum: "543e68d873f2bd272e345ec65b6a8d117dc401e17a55cac26c204f8862e96a52"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "6ce7cb31c130f7185995e794ddd5f8dd24557eb299d20e69abb95acf042e01f7"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "8cf73b787b6ca623506abd390448fd0354570255dbe0e5a9ea872d9d6b60a256"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "0881a38267efc1630efe78ba7351ff3a227872ef993f1544b6dce95356727eae"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "d1effe122476c7112c5698e2fcb9830abb94407200632908ea5edb600c7d1985"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseAuth.xcframework.zip",
      checksum: "7be888a7b5b60ad002802e5b31e56966c8e69bcfccfc0b21e0ff899ade4d336c"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "7211de8cfb31bfd3dbe7f78ed913185838708beb80bba9fccfd63bed5e225518"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseCore.xcframework.zip",
      checksum: "6c1ea226084c1bc99be312c303f0462466edcc1004b3ef97256aa76a2771f2a8"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "8a9fd41442ba42e50c0cdb571162dcf619d17e97174ece9b4477a946d76b2ec0"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "ba68d844af2ba04588440a6e8a038743625961967ce343f5a00edf73e0944ad0"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "190568c52b9168ddd95f585eb940f20d92631bde9ab63c3ab24c460135cd7523"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseDatabase.xcframework.zip",
      checksum: "75ab59ec108d92bdd8489d5836c5f04cdba0bf02a7b16a71be52c20731e58e73"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseFirestore.xcframework.zip",
      checksum: "d44d14c75bd192473039838c1ea406785852d9055aca11074856d467dd4d7601"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "d05d7387c9ec7af64d956088c290527f74c0be4904bd401f568990e52bd91293"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseFunctions.xcframework.zip",
      checksum: "03a27588d2d7001b298abbc739cbb47973346ae32a4d5effa1f3e20cb8eef692"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "e73e9cb5b44816a4ae661bd4d53dac9895a8440567cd75ee18ceb40b724ef389"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseInstallations.xcframework.zip",
      checksum: "1e7c4da14c053f8c134773bb2eb3f6368c5ebdfd2c8ce55a24ac5357e6361293"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseMessaging.xcframework.zip",
      checksum: "981a8943ac14ca48debf37e2b3e89dbdb4df07a7afec30626a071382e9de3dc5"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "3cb558e63bf66939e052774a5f544452a5b9e186642428599e458f2897aece8a"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "b38b35b0d74c8c9a1118092e5e77b77312553969e60eac62191fb2565bed09dc"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebasePerformance.xcframework.zip",
      checksum: "74444eda813e0a77acec6f1c98f6e4ac073c858c45068d567699dc3fef679a50"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "790ddd3c54715d864604f4215e46b50042c60206a4fcb2594a6101445159e735"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "5a3b9d46859725d7fce49fb75b6ff8e2c8261c3655ca69c6354e118098ecabc2"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseSessions.xcframework.zip",
      checksum: "42d24eb2ac03dd226e40c1287994d91efae2d473e38506e9857a0ce5796b0d27"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "fc3513649e8d4d72baa2022e6cc124d7fe9d77c26d959dc4fb4774874c652db6"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_FirebaseStorage.xcframework.zip",
      checksum: "53c5191fd48083649b4ab1a768088c9581a663ffaff176a24e73e37fbd26c9ea"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "1dfac7bc0b3160c0e077d9408ab178266577883204b1f4b0a380aa05630f7de3"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "ea89f127fb7083f26e8a68e5067adceeee37b6c7529314096e39f9e521d1a08e"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "e971b107230e7c846ccad2e1a0fd99a7e967061f67000b81c334cf1419fcf649"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_GoogleDataTransport.xcframework.zip",
      checksum: "986d42b45a9e6e6fe5641805f48e1af388f436f791c866af759afcd282b4b497"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_GoogleSignIn.xcframework.zip",
      checksum: "3dc63d289fe9128d2599f09be2c0bc1c4a8dac9cc4f1b1859a649a1f80c255a2"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_GoogleUtilities.xcframework.zip",
      checksum: "beebcb5d7ce8756718285f4b03bf9f0b0a7403f8152b8564978b68f600ae30b0"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_grpc.xcframework.zip",
      checksum: "6c9e43e96b26070ec3e194223be9d9322ce5204131be86a68c82f27a9ce728c7"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_grpcpp.xcframework.zip",
      checksum: "ffd568a56abce11493aaa33f5145f5bc3464094c5bd4fa77e6644be7fc1723a4"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_GTMAppAuth.xcframework.zip",
      checksum: "2ba1e3fa27ead7cd3779ecf43ce09ce9dc1ededcb48b34456d4595247820faf2"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "ae84ae1ea8b0b8127d7780bdab96ae7c347d980d91790ebc32fe06c65d0c82c4"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_leveldb.xcframework.zip",
      checksum: "a19f729c9db9c9ec7564047c5b746bb8a25f3929895593bc8ed25c7c0e524f40"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_nanopb.xcframework.zip",
      checksum: "ce8b4352a32de1dbeae385b5c2a69d6d710541357fac778c1f45222501613468"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_openssl_grpc.xcframework.zip",
      checksum: "920b92d5ad19d1efcb9fb4e094455ecf2bdc7e0b8cb2349568d05282c428699d"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_Promises.xcframework.zip",
      checksum: "bf529fc446318b371ed5377d78b06056aefca9dd023b390466f58e541fd6d963"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_RecaptchaInterop.xcframework.zip",
      checksum: "8e442aa9064c662d6321a4a464e11e123b8409e0528f3c1771a8983f5c911844"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.5.0/_SwiftProtobuf.xcframework.zip",
      checksum: "1089511217acf50aae472039d05ebe04c3bf3cd786a8c3e9f87d4ce5191230af"
    )
  ]
)
    