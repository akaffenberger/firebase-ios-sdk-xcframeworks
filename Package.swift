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
        "_GTMSessionFetcher"
      ],
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_absl.xcframework.zip",
      checksum: "873e4e516d091a38133915849ebe266bd240f9b07a12829f3ea74fc8eff5da69"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_AppAuth.xcframework.zip",
      checksum: "9bc59a4bb5ca4cca4493bb729c036d17141bc71e479501cf7aef1dc8c1501dea"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_AppCheckCore.xcframework.zip",
      checksum: "a3636c75f9f7538a27d11471d99147b1fcde7ae1b356bb95285d4a2abefa3bad"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FBLPromises.xcframework.zip",
      checksum: "d17dcc1999b0c25a1c36a67088656fae4fa32c0fc90092b375834f3e421d3ed9"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseABTesting.xcframework.zip",
      checksum: "de5a3387e5895cf76d75bd68367c958b2121d77c2b641754251151c395d6b78c"
    ),
    .binaryTarget(
      name: "_FirebaseAILogic",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseAILogic.xcframework.zip",
      checksum: "dcc43c2f21ac4b7b3575f3df91a32c7d22772548968b9f5aba20d54bec8be76b"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "c22704ee591bfb800fc0e82c13c5f32599eeec6ac47306c7fddf6d45bcd0d5f5"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "9d27e57449145f2ca27f4a4b423fd110769d3fc83c6ed561b964fa2eb3064931"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "364e84f577a3b0c635642a206c5046e8ddf06835dfbf73792001725be3ffbacb"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "4edb9efefa4cc85f54adb7d76fd11e7e085e7598463130f800e5cfc87f1ad723"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseAuth.xcframework.zip",
      checksum: "64f266e4fbbb4777637cb73da6225b0c334e8013613f838d8a3c45e0bb318ab3"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "e29467a8887d5cec1e21e66c8f22abb917c63b038bf3445140819e340cfa37fc"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseCore.xcframework.zip",
      checksum: "02aba63fa6bcc3ccb06f240f7eba0cfe09dc3a0f568725b3e21ee974095b3a24"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "69f6ac9e45bb2aacc09e16a85ee1c7382d55eab3ef8b4f14094481948f7008bb"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "b3b51ab2861c2dc3b0c96666b07c4d9e4ba47b5c2170ad05889faa545aa0bb93"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "a1630cf0c5dd69417a1b3244e1bd4a4d548f86febae8e8f6f4a980e816e376d1"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseDatabase.xcframework.zip",
      checksum: "bf2f27e1ec324097af51c89b6afab1fe367ed2d31bd666ae87722531e807969f"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseFirestore.xcframework.zip",
      checksum: "185a38f5f9bf738099d28669acda8462074eee99b11ee9cc7bf149b1e72b56f6"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "a48d73fcc67401b871e508d6555f21cbe1a5e2f7c668546c16dfa57b91aea8a2"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseFunctions.xcframework.zip",
      checksum: "d86f08883fb513d56ab92c7faa41e4cbb9a5658b37868ba2ce12130a099b6d8d"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "ae5158c17dff01ac1c3b6a6fa85d54c9b78e19fbc2e4de7f27318a4eb1ab5bfc"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseInstallations.xcframework.zip",
      checksum: "1b0efbf1c764aa9e52571336d817e5f703da902960379198189a62072624df76"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseMessaging.xcframework.zip",
      checksum: "137541e844df73f2a6ab73003f4f5791cc1f59f964c17f9b3de36f2a92553f2b"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "ea4fb5c79632bce8bcc9f94ed1c9cb156e4cc78cd90a26c2e77905108380b960"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "5478d612322885e27d551df978d81d5075c13791cd498be7d7e5f4d0b8ecda13"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebasePerformance.xcframework.zip",
      checksum: "089046dc314450a79e5936ab07dd386a379f99c05fa8da5b4e30da0c507d45dc"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "f7a592ba90fd952fe4a2eab1f6a2e02ec5a5b50dd39408b77174cabaa1c0c93d"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "233562c11216e250ac24f59dac94a5d48650d5c4e6dd26a2c2687e021d06c2f6"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseSessions.xcframework.zip",
      checksum: "a7e806c9bd2b38ab4de03943d5b19ac130aef0e7dae5b47a469832f6266d5c27"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "450b0d57fed9debc68af31038fd645c7284a7f2b777548c7b3cbc2ec0fcc89d0"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_FirebaseStorage.xcframework.zip",
      checksum: "6191819e9025b0c44c4bdfa279f534385d7f2d7db3bb57709d161dbf33c600bb"
    ),
    .binaryTarget(
      name: "_GoogleAdsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_GoogleAdsOnDeviceConversion.xcframework.zip",
      checksum: "7517b650021b8527228746a55f7c41c5dfaa8df50db5e1a3bd9aec09246239e2"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "0c5bf0ea3e7eedd3047a8ed68295893eadc0c39c98798f86f2cf55f805d051a5"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "5c596555e67ff9eef1fa9a2efe4d68e046d048dae4f4053a3336a586e8c74df8"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_GoogleDataTransport.xcframework.zip",
      checksum: "5868bdd545f2b0ad1656c56e6f957c19ac89ff99f7b2368303c57088ded6557d"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_GoogleSignIn.xcframework.zip",
      checksum: "c438bb415bc9957916fda588928d4efece91220ce43651ab59a4a08adbc7cb6b"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_GoogleUtilities.xcframework.zip",
      checksum: "fd2244e7a012c110593c92e74dda85c76d9c94d6e3eeb8bc167909917273f036"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_grpc.xcframework.zip",
      checksum: "f562a56cbb0b927eddf75b3495c3cc512d367358f5cd57faefc0244b90de072a"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_grpcpp.xcframework.zip",
      checksum: "804366342a51670aec97ef12d1d3545bdf92389d88269c36044792f16c57e42c"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_GTMAppAuth.xcframework.zip",
      checksum: "10eca1cf6f5658014ef36a92ebd1d4638efa2e40035e895c1e153ee1976d305a"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "76562b9a82b99aa9488cf39cd982063aa1cbad1b0f1c5a2fe70fae24fb37855c"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_leveldb.xcframework.zip",
      checksum: "68e7f55f98ebb364beb7971108b739b73e7f101295a8f41696c7f9931b905f5f"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_nanopb.xcframework.zip",
      checksum: "0650534dfbf58e497686da21ea8796245dcd88ad3359adb7bbf9040bde789477"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_openssl_grpc.xcframework.zip",
      checksum: "4e553081b50280d77c980c29684acc4f7145488098bfbaab3c221410a1e4cdbc"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_Promises.xcframework.zip",
      checksum: "3407f491eb5e7639386cf663cd1c637c045b076b7b7470e6433d03c4333bb98f"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/12.14.0/_RecaptchaInterop.xcframework.zip",
      checksum: "d3057e272df22a47cba4c418cf9746c514b2226499cc64b63f222d56e27a44ed"
    )
  ]
)
    