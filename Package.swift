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
        "_FirebaseSessions",
        "_GoogleDataTransport",
        "_PromisesSwift"
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
        "_leveldb-library"
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
        "_BoringSSL-GRPC",
        "_FirebaseAppCheckInterop",
        "_FirebaseCoreExtension",
        "_FirebaseFirestore",
        "_FirebaseFirestoreInternal",
        "_FirebaseSharedSwift",
        "_abseil",
        "_gRPC-C++",
        "_gRPC-Core",
        "_leveldb-library"
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
        "_FirebaseSessions",
        "_FirebaseSharedSwift",
        "_GoogleDataTransport",
        "_PromisesSwift"
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
      path: "Sources/GoogleSignIn",
      exclude: [
        "Resources"
      ]
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_AppAuth.xcframework.zip",
      checksum: "58a1c8bc1a00096f9125cc1f1d4b9ca4abb6428f30c369758d0ba4b146564eb1"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_AppCheckCore.xcframework.zip",
      checksum: "e8d7d32d205b6159213f3a6b04d92c1197afad96a10cbd22c8f7050ff6984b3c"
    ),
    .binaryTarget(
      name: "_BoringSSL-GRPC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_BoringSSL-GRPC.xcframework.zip",
      checksum: "e47434fd8921ab20419e769cdb01ada98339c158b82c598080a4b8573871aa83"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_FBLPromises.xcframework.zip",
      checksum: "dd131c195909f96f5f9c78f1196b971c9da390446017905ab044e2bbed3cfa9a"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_FirebaseABTesting.xcframework.zip",
      checksum: "667f44f2a998ebb796394aab48093c24476c96ab9a8946b284975f846d89850d"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "65732d900988f115f141bd3e6c1abb80af18508cc5b49ca57638d1531db6756a"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "4a529524d08d18147945bb719df74265e1c566514d6389409c75675b0c5c1ff0"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "520bdd7d4020deb106cccf0a117c163925a00f15c5dc7437bc499e0639c8d305"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "4a030844adda6cb2d0c1e0e181d4f1373a99515cde81a0e69030cbaf4ab65817"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "076b84bb469be6c67e6914f54a0aa62c8033467a8bf2f9a825b9be66cb277186"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_FirebaseAuth.xcframework.zip",
      checksum: "2a0b5beae3826a8fc1dde0d35df00108dcbd8855ae62cf600650b71aa5bfa8a6"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "eb97d57a62b72870aaa3f7980bd2bcb3fffb1de70549837a6c39a5387f7f9e9b"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_FirebaseCore.xcframework.zip",
      checksum: "fb4699b00afa950794fb52fa4b793accb6e27a2793b85935a982446d4d13505a"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "ac2d201fcd0dbb40c1514e8a655f3e5a0b95a0c20eb0d3f81e4b7e73e57c211b"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "5757350823c2e85ed90a7a8037464c6d47c30b1ba5ef9cc1ff0d614e616b924e"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "0cfc6edb98229ea5db188dce51a5e3d7ada36b65d529f25e78b5201d6973aba4"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_FirebaseDatabase.xcframework.zip",
      checksum: "8185978f7ff6066ff3b6cc27d1c89619f0e0d18f5476830aefcea687d946e97f"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "e6f2e2bb18642af2debcbe2b8a6fcf9fe12c4cc824f16bdf14523ad25aba1f1b"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_FirebaseFirestore.xcframework.zip",
      checksum: "3dff1c9e52e92ded1d529415eb8789f43117b3c7875ae3b2a4be42cd54dca5a1"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "8961b86c3fd36ce428873ed406b226941b0d0565b3cae2109974d713d16b7517"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_FirebaseFunctions.xcframework.zip",
      checksum: "e51f5b90fa107b0d2d75b62d2bf0eb6a5a732a8d0b4af3e14f4c71624469b4cc"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "73dcc1883320ec6f46148f91d6034fc4d0efa18ed6a863621133345e90115851"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_FirebaseInstallations.xcframework.zip",
      checksum: "d23b62d3971474d520bf1755c52ce8959d83f804d2adf8a1d4cd2be94025f97b"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "1c8786580f19b60820ebff5520ad1c8b2d19590c0fe7f2ec58cdc00c4378622a"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_FirebaseMessaging.xcframework.zip",
      checksum: "4f80b1c49e028ca58437f35ee2f5cca093a9e06aaa6dc6657df2691058ac77f7"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "c80a14a3d3b4dbb058ebed03ed0cee96b7d592e8ecb2e9e571ccb146d9eaecce"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_FirebasePerformance.xcframework.zip",
      checksum: "a9e7c6e46daeb9f05b0eb29c5bb963e3cf01f71f9f7de85044379234fbcfe4d9"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "a7de3847553d2ac780444de8ad21a4bc20fc1a311f3f84d6852f3768258e0beb"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_FirebaseSessions.xcframework.zip",
      checksum: "142f42a0b5c71af872cce2a7626b108808dfa3068320cb44e2376b0ff49535af"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "e5ff5f82568577e92e9b701b1e5ece287e8bc7c0efd12c2a5f620cb3508aeb0b"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_FirebaseStorage.xcframework.zip",
      checksum: "faf213f9c7bda2d9e624dd34ed10ef2d829a74ee7c72acef0afbf5b610123ba4"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_GTMAppAuth.xcframework.zip",
      checksum: "e641e7e38899873472bed7b35d0dddd2db8fc085c87ba3692df1bc35bca5f5c0"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "3d25d872716c09b1c27d92ab7f4dc6ad73b10f9d52841530e44dd38734b624bc"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "45a5690b3f15367e0fb4e8c6341d1c223cb56fc489799dabd529376a38089835"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "0cfb4c2b2541517dac85be2550136701852ae754912bc5090d8dcfbb5659a139"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "d7b834a73b062814c3fb37be8f3e4b3b273a5830319771d69b7ebc67327f84cc"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_GoogleDataTransport.xcframework.zip",
      checksum: "2b4cd03d7b06b16b7c178ad4add0e4146f17df1dfe905da258715ca157202808"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_GoogleMobileAds.xcframework.zip",
      checksum: "897699aacb8e4688f18072b963a0c511a948c1abde54bc4f10ae82263103f4ac"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_GoogleSignIn.xcframework.zip",
      checksum: "45ef19ff00790cedc82798fa7fd534182c87513968e8e2241e8d4f2d64d8aca9"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_GoogleUtilities.xcframework.zip",
      checksum: "e6820dcbd17acba744a32ebcb9058f10d6c61b1b1639b2ee09224e23dff12cc8"
    ),
    .binaryTarget(
      name: "_PromisesSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_PromisesSwift.xcframework.zip",
      checksum: "1050f398a3fe01a79ba95a8a9391e604f5de29297764d234c01336e91008a383"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_RecaptchaInterop.xcframework.zip",
      checksum: "7c307364297bbe3f5febb52137dfb8d0fd6601ab0f39ca66712c6181bb36531e"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_SwiftProtobuf.xcframework.zip",
      checksum: "42720458b21f7a116fc0373323e2c3a7710e1a9cafb89ab7e8694f06fffc71df"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "2747a5d61ee4812e141c4168ad256886e1f6802c468a1eea4085a6c1ebcf34c7"
    ),
    .binaryTarget(
      name: "_abseil",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_abseil.xcframework.zip",
      checksum: "ab67faba1aedb81f154dd16978499e3f29505ea953e16cee5186c84a9a401ff5"
    ),
    .binaryTarget(
      name: "_gRPC-C++",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_gRPC-C++.xcframework.zip",
      checksum: "05febc9868a72aaaa8d28b5d9e2bc40b082b28f6e63f3ade8e30d9660a4655be"
    ),
    .binaryTarget(
      name: "_gRPC-Core",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_gRPC-Core.xcframework.zip",
      checksum: "432d4869b3ff8b5bbb221d3bb37d3eec9c2b48033b8979113f61ed4c62e16eac"
    ),
    .binaryTarget(
      name: "_leveldb-library",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_leveldb-library.xcframework.zip",
      checksum: "1564729f55337c1d39a2db6447325704d0ea3c9ec2934dfba32f6fae79d134b0"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.20.0/_nanopb.xcframework.zip",
      checksum: "c5fdbdd350e1c43cff08d58c25c580a073f73ae54cf8ac6bf1b23b5515bb8861"
    )
  ]
)
    