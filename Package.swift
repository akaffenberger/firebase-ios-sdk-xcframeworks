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
        .target(name: "_GTMAppAuth", condition: .when(platforms: [.iOS])),
        "_GTMSessionFetcher",
        .target(name: "_GoogleSignIn", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/GoogleSignIn"
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_AppAuth.xcframework.zip",
      checksum: "b380be95b337016d3f95a9fb299edf86e8391c1e2da020a3f2545af542400687"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_AppCheckCore.xcframework.zip",
      checksum: "493dc75abc13b9dd91561cff9941b259795bdcfba36f5b4c67df677c5f745b2a"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FBLPromises.xcframework.zip",
      checksum: "f80c4d1ddf729eccc6ba5f076779ad868e43c3d077106dab3e9f581e5e3dd680"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseABTesting.xcframework.zip",
      checksum: "27c438b7de2994eec0b1b4753617cdd7ff220d541741df1529c76c8e1339ab79"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "92101a1d8728e8176c1cb605b7846a77f6314ea13226cbb93e68221ffc5e1879"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "71a92ad8d1c6edf1566bcac96818814b03f54f12fcf9d80e86a0b150b1534390"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "7e5652b3201555aff403edbb92cc54e533d0ff342924c146be9ee27b41eab8a8"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "8a2433aa78a455731b7b5070bde4772f23142636d2240f72d4cfba593149dc6f"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "dfba99effb19c1f5260b513c97db31d31f6ae761418796682fe7954464a3c14c"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseAuth.xcframework.zip",
      checksum: "06e5fecb81ca1f32abe1b941026a032932081588e6fed5f77f847ed3b2289cc8"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "9374d9bf1b247dfc44ddd22fe2fee919178df8bf98199c14112666e13e83c53d"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseCore.xcframework.zip",
      checksum: "d7e80798634d6ad365d8056ce5b0b58b6dc43b7115d0e574662edf3ebc9a4560"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "f903c129440a6a15f314c46738d8b5736e2a35eb5186450de6d54ec70b9b4059"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "d00099871e0690ea347962fba5b6132d2dbc1065f3fb5e9288a083c57fd077b1"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "6e1b8fb5ebddee20aa107cbf58ca548ae69c2b9db497642f424525441bcc885d"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseDatabase.xcframework.zip",
      checksum: "6797449dbbceb89c3fcca17f7ef3ef24b14b35443cc41736c843e6073bf8e9da"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "975e9c6d9d5ab2dcf322655160bdde6a0d6b853d486467e1eba9cf3a08bc461b"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseFirestore.xcframework.zip",
      checksum: "8873e76e51700431ff347bd4ef0269bf30f6b8e36046e7ca56c3e4207b6cc8bd"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "f0ee0560dd843977c960b67fbe606af6e21a3e560ecaa22f902f67fa833eef64"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseFunctions.xcframework.zip",
      checksum: "410c9acd8910feb3b1e6d2272a467e673d6a92c9b6c51d86bb51de44d5e8cae0"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "167d23ab859c82adb9158cd6e8131ffe56fed0c0fcf3ddb55a34b545aedf66b5"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseInstallations.xcframework.zip",
      checksum: "c7bf8a61e71f735ee9f975508674c4c19dff6647d77b47cd83493a545bab28be"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "678902dcd7c575aa2fbbd5e8176ea7a42c6902a45cb8d60bb95b2d1d7a93c4b5"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseMessaging.xcframework.zip",
      checksum: "f1cd99bb5afd18ea172aa367e65008921af1b31f08d09dc68d9ea5f22a4be320"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "1f4b84a8a40b57068744df8b56685a2a825050f2ae19369aaea88f0c40b91f41"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebasePerformance.xcframework.zip",
      checksum: "5e6853dfa1ba93dc5e61d49ead80d9cf3c05759fb38752dcaf69740afcbef0bf"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "654a5985f40c2e606a2f9c78c1fe57f7bdbc4084f350259ff5b5df5438d2b95c"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "1cb6b1ce0476a0dd271b5ae2f074a0920d1b88a7c7db3f6e7c2434a9686adaa0"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseSessions.xcframework.zip",
      checksum: "5671c6d8d1b533dca45736d6cc22db2e2e7e54c850c053cc999d6621920bb0c8"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "d100220ad93955d6c00da3fc7410f62c87bdf6c8205b2e0b8d0fbcdcc76bc41c"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_FirebaseStorage.xcframework.zip",
      checksum: "a15251d06d2a2ed516c8991c2ed28ebcf23832bd6d5d8024f70fe137fb63bf40"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_GTMAppAuth.xcframework.zip",
      checksum: "29edc841a0fd8b49f2c07788a8036a4d1d23c0edaf6bd9c21f75f7d54397b52e"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "c6d0d0244884636eaed0f9a9ff8460fc3cdb6d917ba11996e5f8ae9e5e42f084"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "1c625e9a6e45cd85e9a324c631c5bc8c1e8c9a7cc40e25e145dfa1e01d6a1af1"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "76c85690649b2ef8d1027d42be25258f6bd1d6d346abf678ae2a5c7fa2179c27"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "588890cbd5ce0b1aa08287e9e9844f24fc5c56289777886eb3b76a4da94ed52d"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_GoogleDataTransport.xcframework.zip",
      checksum: "72f293d8a95020f491615f4729f5008c31c00d89d63ac31763c275fc949cb62c"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_GoogleMobileAds.xcframework.zip",
      checksum: "29cc347f4742d39706fa4f89660ee6c6695a4841f6792f0ae1b80f0bbb8a88b3"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_GoogleSignIn.xcframework.zip",
      checksum: "215cb66771d47e5e89d0b7f1c984a36a3369af8725516ecd582e40cf7136ea9b"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_GoogleUtilities.xcframework.zip",
      checksum: "bbd078b24fd0d9b3df9b49d8cb0f9a15dd05c82c48ea6d75769bbd1c3423e5c9"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_Promises.xcframework.zip",
      checksum: "38fca42585c2e9f34f0f6539a8cecd3d58b421a72bcc701a54dc9073842f8307"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_RecaptchaInterop.xcframework.zip",
      checksum: "938305d510b1091477677a4ceb8baf2d5ec8e31abc94353c576457a9b00f875e"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_SwiftProtobuf.xcframework.zip",
      checksum: "1640fd71306709e8510319d2283630a38aa0aa5dac4919eb26f87007d274c56d"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "efb0329ee77e990e33fa84399f7c355be37f5593250f2608c14c3d316bdeb2e1"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_absl.xcframework.zip",
      checksum: "6fa3cc41ae0b4d62e011b87f93efa5e1427345230dcf8b6d36aeb6b2da6d826c"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_grpc.xcframework.zip",
      checksum: "6d0fbb807999d43bde49facd3e551f9faf83571306fae09cad3224f3e57a7fa3"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_grpcpp.xcframework.zip",
      checksum: "4c399b6786708098179ae86308e3685ba26e083c8cf9b679e5f63c2d6277587f"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_leveldb.xcframework.zip",
      checksum: "ed5a4980b39975985055f23324d3d30dbe4cdf442e6ea0d3a5cead616af21ef2"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_nanopb.xcframework.zip",
      checksum: "467fcae7981388f1b5f3849915f262c6cf2201f26d69ab6e993ed02e4dca76dc"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/11.1.0/_openssl_grpc.xcframework.zip",
      checksum: "4b22cdde5d7a7c83f7c421f32d4531bc53c49b31fffb34d8f6c6055bcd90d1b2"
    )
  ]
)
    