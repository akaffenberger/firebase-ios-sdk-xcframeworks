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
        "_FirebaseAnalyticsSwift",
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
        "_FirebaseAppCheck"
      ],
      path: "Sources/FirebaseAppCheck"
    ),
    .target(
      name: "FirebaseAppDistributionTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "_FirebaseAppDistribution", condition: .when(platforms: [.iOS])),
        "_GoogleDataTransport"
      ],
      path: "Sources/FirebaseAppDistribution"
    ),
    .target(
      name: "FirebaseAuthTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseAuth",
        "_GTMSessionFetcher"
      ],
      path: "Sources/FirebaseAuth"
    ),
    .target(
      name: "FirebaseCrashlyticsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseCrashlytics",
        "_GoogleDataTransport"
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
        "_FirebaseDatabase",
        "_FirebaseDatabaseSwift",
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
        "_FirebaseCoreExtension",
        "_FirebaseFirestore",
        "_FirebaseFirestoreSwift",
        "_FirebaseSharedSwift",
        "_Libuv-gRPC",
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
        .target(name: "_FirebaseInAppMessaging", condition: .when(platforms: [.iOS])),
        .target(name: "_FirebaseInAppMessagingSwift", condition: .when(platforms: [.iOS]))
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
        .target(name: "_FirebasePerformance", condition: .when(platforms: [.iOS, .tvOS])),
        "_FirebaseRemoteConfig",
        "_GoogleDataTransport"
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
        "_FirebaseRemoteConfigSwift",
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
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_AppAuth.xcframework.zip",
      checksum: "f933f21b800adde9dbf8984747712adcfe7c39a0f565d7cfa8dfb667049898cc"
    ),
    .binaryTarget(
      name: "_BoringSSL-GRPC",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_BoringSSL-GRPC.xcframework.zip",
      checksum: "bf4e5b5dff1701c5bae73c84d4b728d0764aef115a8c04187cbde4ebd5c6fd1b"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_FBLPromises.xcframework.zip",
      checksum: "96680a0c94f059497f16b0c8207335e951924e4ef00af3ad64d130239cbcd28b"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_FirebaseABTesting.xcframework.zip",
      checksum: "38698b06a7e465871efa38a57b96e54389930d4b5b595736864b5130b0a039ff"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "387d2ed4e276f8a0143ed0ce28c4f417b553397ebf54850bc001e6f2e0ccbfcb"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "cbf821bdc3d3872add9bcba550ecf2c5992aa7e8c2ee2597d710422191a28e18"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "56759ecdfd72a5b8cf083905fa47816cb788f788567a6626e66e232c4130007e"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "f896d25925f2312b984cb81b377c02786b61d5f2ea7367f0a009e80c212a670d"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "d1d0ac4f0bb9c15fae27273587c2ce82857bca0bd5db9037efd1e10995c2fa3b"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "4d6f8328f329084febacc587728e8e3a18087ae555e4d12982c200ffc91ee191"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_FirebaseAuth.xcframework.zip",
      checksum: "5b12e3cce76a53449c78814d2bd2d98c3c1f53d0042badd941441e384865df84"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "556045174b9141678aa28a6295d71bef70203e620357b772f61790cadb947ee5"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_FirebaseCore.xcframework.zip",
      checksum: "3594f008deaeb075351d3f2d6443ce9c1c097268da6277f7a7a177276c028f37"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "0e2ada8acae5cb4092b177d52503d3070e42ec2061bad3ee25d43c4483ab9e91"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "efc5dd337dccb3fa4f9cd28a3074d153169b89ed26b6d4db6838a0f120f9e069"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "8ea03c775a926f96fef9cdacd6043b62c304c5e74c76bb69488c2bb313d1cb69"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_FirebaseDatabase.xcframework.zip",
      checksum: "ef9c4ffc677ee68eab8780edcb01530d54ddd854cc2dcfe6f24092647ec78921"
    ),
    .binaryTarget(
      name: "_FirebaseDatabaseSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_FirebaseDatabaseSwift.xcframework.zip",
      checksum: "e43f61f6a1caf16adfcc2749f67de01e4ac45c9046db187341bfd5b953780ce1"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "5e0e4d7adc44822e9aef92aa4a30fb52a05accd3ca4a2fa26f9e813462097456"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_FirebaseFirestore.xcframework.zip",
      checksum: "eca59f01a5992d9c7955d205e7984acd84fc82a56f7cab1720314d470a77efd6"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_FirebaseFirestoreSwift.xcframework.zip",
      checksum: "7f1db4a655ef4d24ef61a328b22dea856583bfc646bbefe97e36d004073083a0"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_FirebaseFunctions.xcframework.zip",
      checksum: "4f9302342ea4e089929f18a0b7d06ff61398385aa345a11265fe2dcea878bd4d"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "957f870e23d6561672475b812de102b143da541feee26436eadb4a6156a4dbb5"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessagingSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "7a5724e0cecb9a6be6ff954d11ea5061a9cef9d7e1c37e00292d1f481e843ce4"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_FirebaseInstallations.xcframework.zip",
      checksum: "0bde321aa04d5d59d6bc88a8bef5424c108685acb89fa6bdabe82b94998947cc"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "1ac536e7cc42b2e58cc146653bed9725800e966f5fadd4a969188cb7080a033f"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_FirebaseMessaging.xcframework.zip",
      checksum: "c55f933343f43eea0c9de6ea45c044808da7790413b05fdc04096eea8d9a7031"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "d393a6a100cca208db189d4b1dade515dfb3a81440b02a3bf1ab26318129dd35"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_FirebasePerformance.xcframework.zip",
      checksum: "50cd75dd92395b12d12c85ee55d1332b7b54c2a2b770ad7f7a3d1e719b8f29d2"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "7f9d59a4e7196ae8f56cdee245d2a3dd7378993a6653ed31d0a8dd9447110a0a"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "5bdc6874b254401d32089bdb937531ad522e1bc47b5a095014d9986e3d09acc8"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "7108f7bd872727a33b695afe5acedc707fe496c907c6770f8c07668da4c0f0df"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_FirebaseStorage.xcframework.zip",
      checksum: "e4a6a73acf1311c42f43ba1c10f39764d54befbe6ab9d685f2f7719f114ec971"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_GTMAppAuth.xcframework.zip",
      checksum: "fcc4e6ce28379995e01c1b0cf5e583d95b5d44ec7e3cfdcf6222c95739478785"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "88aeaafbc29b369824606bbf4642ac265b65b039f39ae83dc1740859f7938107"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "db7dd96f96752c42e10f9baa57234e0f6238930736678e4623b642273d2e18ce"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "3687b4394b1757abd3987817728ae4f482301e6d6b17ccf249088d7fd85cf8be"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "56ce11f7144a954e91f8c6a8e3e511d642d8d76470641068101d23213e3c22de"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_GoogleDataTransport.xcframework.zip",
      checksum: "ad6c840db55ddfc6dba485df7e3ca98090469389cf1df5eb0698f75446b54e8b"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_GoogleMobileAds.xcframework.zip",
      checksum: "33285bfa383dac0ab300fc7a8383ff481c0df764b01f0e4088ab1ab0dca77e36"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_GoogleSignIn.xcframework.zip",
      checksum: "595381ac006a4634553c07d96b921910a882e6a855e6dda3b73ad2148b7d6b22"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_GoogleUtilities.xcframework.zip",
      checksum: "334e9838fd4d773565a5f64019cdb1fec8be8064944fb285be1c546504531ff2"
    ),
    .binaryTarget(
      name: "_Libuv-gRPC",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_Libuv-gRPC.xcframework.zip",
      checksum: "1a16230d523b994867d32bec22ba757697ef0251e41a204c925525ef6692b5f0"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_SwiftProtobuf.xcframework.zip",
      checksum: "6d00f81e8ef7b82f629d680aca614892307838e9fa43e3a2d8e014a4c377abdc"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "c5e2dc14c5fa10166723d803aae52a76a63a8b20c83c3e117e330e43b9ff3202"
    ),
    .binaryTarget(
      name: "_abseil",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_abseil.xcframework.zip",
      checksum: "61723b50f2d64d3ad5d942b094a8dd5e7e4993a3fe018af74654261e7135f81b"
    ),
    .binaryTarget(
      name: "_gRPC-C++",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_gRPC-C++.xcframework.zip",
      checksum: "b88e098e1f314e674c7dd4038dea29685093bf0cf50fa053e3c8c9926369cd1a"
    ),
    .binaryTarget(
      name: "_gRPC-Core",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_gRPC-Core.xcframework.zip",
      checksum: "d5869f4e97651b419708ad366d1d10bf1fe6378a0a8d997b5460cc6c4b1cedf7"
    ),
    .binaryTarget(
      name: "_leveldb-library",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_leveldb-library.xcframework.zip",
      checksum: "3959f6540dc6a9bbd152e25bdcdf61a26534aec1ea0c1350a0d2cec0657533f8"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.3.0/_nanopb.xcframework.zip",
      checksum: "845ac101d4e30d6497836c6c593901097be8bc17129b1ca1f1616450c10ba1d7"
    )
  ]
)
    