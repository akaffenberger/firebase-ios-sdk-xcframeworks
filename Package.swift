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
        "_AppCheckCore",
        .target(name: "_GTMAppAuth", condition: .when(platforms: [.iOS])),
        "_GTMSessionFetcher",
        .target(name: "_GoogleSignIn", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_AppAuth.xcframework.zip",
      checksum: "ba32b6ae2651fb338775a1ae5e8ca3edbcb9f819e8006ff0a06de02d478abf41"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_AppCheckCore.xcframework.zip",
      checksum: "2a8d5de6f52ebd23dbedac5ebc0cc7b6719473c28470d6c9c17987728b01f1c8"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FBLPromises.xcframework.zip",
      checksum: "1b52f7d8d8dca44b4e2bbe34094921b8c877518ca32f9ab4ef1242057d6e42c2"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseABTesting.xcframework.zip",
      checksum: "1b1092558e1753ad9383f0dc5d4d6a78d786e5a8c83326722f56ab26af2cf149"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "f324ad1ddeabdfa754b14173384e41676be788f795ce56f62464f1cd8845474b"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "f6b5759c08820a2e2f75c85e1e99095eacfdbfe2fb92bf6760348f8d5236d372"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "028fc358f11de9eb1dfe3fea463e1f0c45a39aa7e5ab4601bf075faa8a2a4d95"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "0b51d988459cca5f2102bf6b8ba32f6a38fa7ab626d9bf85f44a6faf9b691268"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "c862936d4657e9aed51f78880ce472cbde6cd327cc5063aa2c3483d644983593"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseAuth.xcframework.zip",
      checksum: "0d25f516ada9036bcaacf1338d2a174dccc8ff15b99235a465035fa33c4b848f"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "0d76d797217b7bb2428b542a7d5abfde97b8f20209576146d6d1a356a285e170"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseCore.xcframework.zip",
      checksum: "1d49775314064abd9b7b457c432fb68d78810b1815f13aa405cec999c78e83ce"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "335ab45ca7134c4303ddb2093e6e337ad3d6f988f7bffdbb26fd896b4e7b2d47"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "01717340f54fb691402b5c517a2833cb3ed8c480d1ad7e91cc62be8402b63b03"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "8b27c2e2d4072204f3da03d4e1ed912826183fd01614c7161c87a165bdbfbc0a"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseDatabase.xcframework.zip",
      checksum: "3694c150dcb6a9ee597f2789be3a58cfee2c9ba221a1a9a0b8c20f8bd3cac290"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "ea1aaf6b57baf50bc566348e3f27490abce7c8013cb9452e74727af3f4718a91"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseFirestore.xcframework.zip",
      checksum: "00a3d5519e00abafc50ce6de42fc3ddef9da816d08417850a8d7e3184413b344"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "efeefaed46cb765c6cee79ad82e95c0f87470eb040c544369c06b734f818ede4"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseFunctions.xcframework.zip",
      checksum: "e9a4558786d64ae48a7777164f9457d57cb30917e7cb986998fd4832517c01a1"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "cc8f002cce8132e4f89226a67bfda97ecfdcae42e0439ffa59f476feb0390b4d"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseInstallations.xcframework.zip",
      checksum: "9e7af60ea7bb541d251516ae1c7f0fe5151e8066ed5f6595828f1f4d6f352e24"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "eea463cd9e23b2dcf5e038843756c3ec468e439aba64271d9f3a0b74aa21cb32"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseMessaging.xcframework.zip",
      checksum: "ab16b923ede29766a7e4accae70cc8a7719cd7d34dc2df18117e52b89b7cfbde"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "63953a2855bb7a835b3c1a1594b684ad80d94bea8053b72af2a31f592cd14800"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebasePerformance.xcframework.zip",
      checksum: "ad85bba92214676c7443c661f7f51ceeb1133f35601b4712ae7733943e13b866"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "e273eeed48953ed9895913a0d61f150f9bf5cafe4f81157ce1c9efecf022d2d3"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "acbb317fadff361cafe29dd4a1968146bbd0c9d1f973f6ca61a561256d960e13"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseSessions.xcframework.zip",
      checksum: "74e18dfec508029ea0a9f0fa3279b2cc8b1294833eaefd96d0ba83ddfa33002c"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "9a2be76ec60191ed601d2ef55799125866a2820dd8d2b543441703d67aa12bc5"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_FirebaseStorage.xcframework.zip",
      checksum: "175725daa0ba0381196ea37c9c65d8c6541902585ae5827b925d1a97623a07e5"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_GTMAppAuth.xcframework.zip",
      checksum: "e93cf81e869c28f7cc1a64e1752381b9212baca5b0c5a00b18f8f9366243978b"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "b810c9c5b17df341060d4af35fa20a2d8ae6c8317e74b9fdd37fb7723ff3ceea"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "102a2acb67bed8a24e53d8017fbb2880467b8c974d1b691b5188ea083f7c0e51"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "bccc2c9c93a71118cf4a8707b2f67cc141036e0c06cb3631470eb5e771b109fb"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "7260fb8f3a8ac583a4a0de6dc0c82b14ce93875d88b69c1dd85cc6af93d6d138"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_GoogleDataTransport.xcframework.zip",
      checksum: "833000f0d7cfa56bc1a635f1debf6262c74489bab7c1d8462468cde7f840945d"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_GoogleMobileAds.xcframework.zip",
      checksum: "4fc46e76d4ec62e4e57c5454b86d31b3c70eb1449b2922f65948a267466ee007"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_GoogleSignIn.xcframework.zip",
      checksum: "bc7d30e369f8c139ec144558d6359a84cc712730ee802f30745b85867950c37e"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_GoogleUtilities.xcframework.zip",
      checksum: "5f47a37693b8ff561c213f6278cf13d8ecb132e8010171e45bdcb3d2b21c89ae"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_Promises.xcframework.zip",
      checksum: "4b54b6764f7c249661cf5ee0100113feb3e2344a2e6191da9c6ab91fde825fd4"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_RecaptchaInterop.xcframework.zip",
      checksum: "39fd26ba9adf2770cc6e6c925ad215cee7f96da2ab2f3873fb1f18f4fbaa570c"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_SwiftProtobuf.xcframework.zip",
      checksum: "eabfa6b2e28ea88e070fc72eba9966babdb4f20677619fe43737244b0f575fa8"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "7c91a107aa24f4acd8a6b5dfcd06843a378411dc16b70bbc17e8b5092ed7f66e"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_absl.xcframework.zip",
      checksum: "fef66b7a76c99428d030305ea9327d1f648d63618c39a2ec9b7fdca116e25095"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_grpc.xcframework.zip",
      checksum: "3021d3890d11599957c53eeffac8b554327bca8871fedb6c73eaae43b92bc0e3"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_grpcpp.xcframework.zip",
      checksum: "18ffa64a2220c25399977850253636c8968a839b2808292c6971c2e13f2d1cd0"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_leveldb.xcframework.zip",
      checksum: "4e0dcae12e047cc390f2185b39879a8cdda1cd5d1af9ad91b56034949d262023"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_nanopb.xcframework.zip",
      checksum: "f876ba86e68bc6eb4a622fc1833eee9ba6124d41a15406bec8887c5ef149bccd"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.3.0/_openssl_grpc.xcframework.zip",
      checksum: "1a1223ccd9b44f117eba962c7bd6e7c890ebab2400822983a5ba50f3167aec41"
    )
  ]
)
    