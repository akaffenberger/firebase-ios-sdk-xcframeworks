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
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_AppAuth.xcframework.zip",
      checksum: "66ff83533ed6e56668ce718820d52f55577e584d07f7155e5464fd0495186c83"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_AppCheckCore.xcframework.zip",
      checksum: "a63ca624c6caf25037e99e61cf6dcbfc86bc2e1f4f3609f5ccfabf2b1d65fcbd"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_FBLPromises.xcframework.zip",
      checksum: "184040d9758e566b50aa0a011124908251a6db92727f11e8ff5db3e0d21ae204"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_FirebaseABTesting.xcframework.zip",
      checksum: "2c5818f9a38148f794ab5e24888d17ca42ed3b1ddad6111c955af8165e45c319"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "47bc4250af828142bbc54f0b63526c82e85c46b4a9289c2357a650e92603f586"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "c1f15a41e6791eea5631d1969e36ab75601866f1c299b397b2f99da275a76ae1"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "bd4a1b8049dbaf372e7b2c48daf5bf30717570b9b3a76fe9178ec056f042eafa"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "1fb1413c8983459532b5a899b020bec3632388defefc4f8041ae33cdab958526"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "309a1b2e49c7850e8a3e4299e24d3a0b6a6ee1d486b68cd638bfa1f0b59299be"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_FirebaseAuth.xcframework.zip",
      checksum: "9a2b5b685bf676a72fe74905d4982e1988691cf09dceb981eeed7f5fbc910b1a"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "e01e6797dec6c440e535a9433b596b9fec247731b02326c355eb5e682f017722"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_FirebaseCore.xcframework.zip",
      checksum: "73e1bb830355479a88c24b0dda7d6501ca007559ec05fd24b410b4f77fc86055"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "08c03f52ae2db0fc42dd5cfc106b1ac7d0cd6096723cdbb0dc67cada5d5c6d44"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "2e4c93c5bf11e5193ea2b4c3dcefdab7e1ad9663caaf904633ae8e669ed91311"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "b23ae4777ada9a94104299e4f5d3446ad1ba544a2ec3df6449fa669682d6f869"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_FirebaseDatabase.xcframework.zip",
      checksum: "d422014403bda6e8f763fb40ecde917a2fe8b22ea6ccef87594fbc09ccbbc7b4"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "82c7d9c9015874fa42505385b51f210f37eb5f3220563a07340e4015e47b558c"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_FirebaseFirestore.xcframework.zip",
      checksum: "7ee05472e5fe865b592ed3aa25d22c2e83d087fe4b79c9ad88be3286f63e2569"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "b6e9bcd228f341977e98bd99d5e2713a8fc1ce734f184e47227ba82fdd90b2e3"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_FirebaseFunctions.xcframework.zip",
      checksum: "8ec8874288a62886ddeaf0bd9134aa5c7bfee1ca3e8b0f55743c6aca300a1893"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "0b141c6d394ef58069dff93369c832bc319b5768d4bdddd2dcf91b31f91577c0"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_FirebaseInstallations.xcframework.zip",
      checksum: "46d6089edd7c43b686b37cdc6a9ef67e4732550b15d87e8b019c046db48c5dc8"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "ff6aa60180bd9b9c4dd4c797c8bb753cc64f7582c0700260bb195a49418b6403"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_FirebaseMessaging.xcframework.zip",
      checksum: "d51cafe009cec8c8d1db139795be6b98029b36189ee3596fa65f0d1ccddb3f9c"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "8efef5d79eb0bf61f4594f80efa14caa619475dcc1037a426706af218ed83f6c"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_FirebasePerformance.xcframework.zip",
      checksum: "e6d860c774982cafb2f7d3db3577b5b5ca3f8a0c5552236a84a9667f4e06d475"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "fc1a88da7df1477a3df5d456e4624b116051af1713d0b45fa8b282edd85f1e66"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "a2e01f6105bd4d0d4f0e5ca36b7812f543c5226374468584c11c11861d883343"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_FirebaseSessions.xcframework.zip",
      checksum: "c0cd5c3e4de0b126a08042fd5322a64f6e92746159fdef36bb705b4b844c3c54"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "529cfdeffcc5db51093895508cbe4dd205afe16da6003aaefa905134b6ffadf0"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_FirebaseStorage.xcframework.zip",
      checksum: "13764e1fae903bb04f3772f98f6f9a0cc45f63c29b760e7749f032abd7b9236f"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_GTMAppAuth.xcframework.zip",
      checksum: "dc20223e9d520dc6d9763ff6bc5f25267fd34c7127b0453fd5b28469577e6946"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "9c63f73d536805a5d6758c9d7c52d8f4b57aa64649aafc10e06467e437b53668"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "b77795e38a41df9f8c6fdc7257e184f51dea5e09928167357bd86488ce376739"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "24e62155e6d5900c92baff40b80228339bae12f3f7d07725333e6958d7d00620"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "2e45fa5abe5c0a31a06586c518efdef3c866f4e701ca16f4613debb7ff42c391"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_GoogleDataTransport.xcframework.zip",
      checksum: "96f566b82c0e2a74c43613fdeb23ee1043e3c6635cbab3323ec89029d8e8559c"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_GoogleMobileAds.xcframework.zip",
      checksum: "3cb02a2dc047b3fd753d93e5a46668a179d18fd3e23bcde9302efcd0caeb5f96"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_GoogleSignIn.xcframework.zip",
      checksum: "8eec884e4edbb7223824d20e2753f88437cdfedd958633c24586f6752801cd54"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_GoogleUtilities.xcframework.zip",
      checksum: "f48e5ad4394e6ec5e4115aa580887a15f158c7e09ff73f4e4dcadb7d65ebfb51"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_Promises.xcframework.zip",
      checksum: "7001b6641b638c33b9cdaf851f4e65f1aaa5420abb60d9388b9fd578887f9782"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_RecaptchaInterop.xcframework.zip",
      checksum: "a131b1c9a4051945c633f8c0ccac7e68a1fb13c464a9dacc89417b99afd9a2a9"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_SwiftProtobuf.xcframework.zip",
      checksum: "232b09b1c97d65e9621110d6ea30159a054afeafd638b8dd11e7c3f97b76c6bf"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "844871ee4f653031860a71699a91ec62a6993b6189b8cff82c7e9fd7898c012b"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_absl.xcframework.zip",
      checksum: "3379c6766d08563b3e28c03f2303bb23cf65b88dc828c9ee9d1d651593b96f0a"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_grpc.xcframework.zip",
      checksum: "d118aed71a45eaaada4f8e2c1a415025ae734faaa820a67215e08eb81b1d54b8"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_grpcpp.xcframework.zip",
      checksum: "5ed0ec43ea4330eec6ba73eecdc99b57a0a613862938e4cb9415acd3d7c7ea31"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_leveldb.xcframework.zip",
      checksum: "0d03f725a000547e01f23631698f05d07d65f0fc07f92d251e6e216cde9913e4"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_nanopb.xcframework.zip",
      checksum: "ff404ace9d00576470a10feb6e4c72521fc0c27ccfc3cb1cde22b900eff6ffc0"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.27.0/_openssl_grpc.xcframework.zip",
      checksum: "b7628c541b0572977441fee83d553fba8f2693dd48e8e3315de4beb32a0c3590"
    )
  ]
)
    