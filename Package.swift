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
        .target(name: "_FirebaseAppDistribution", condition: .when(platforms: [.iOS]))
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
        "_FirebaseCoreExtension",
        .target(name: "_FirebasePerformance", condition: .when(platforms: [.iOS, .tvOS])),
        "_FirebaseRemoteConfig",
        "_FirebaseSessions",
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
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_AppAuth.xcframework.zip",
      checksum: "75a01c0335534b9916f59b16df9af893290857d4453d5b468fabb2242a110d41"
    ),
    .binaryTarget(
      name: "_BoringSSL-GRPC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_BoringSSL-GRPC.xcframework.zip",
      checksum: "975d1d61cdb40a63497768b84c8f48499e4babd95ae26e9a0c49e9f1be9c1670"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_FBLPromises.xcframework.zip",
      checksum: "b8caa6e93e657c88e8a98e20315b87573d938d599fa79cc47bd34cc56d14d070"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_FirebaseABTesting.xcframework.zip",
      checksum: "6b5e51c347dc8b37ad8c9d9240d4ae73a7154b4645ea9032ac2c0754e7c01a7e"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "111862a3c6e95d0ef9783108e8938cf779f00c9145f21387647699b93c0441b9"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "09211bbbc9d7cc45e08b4bb0367a30b3d35fd217a462039e07d271cedd2124d8"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "fc8e100f6703b5b57d29a8663cb38c3188b4954cdfef9385375a99d3f52ba69a"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "0012d6d5133182b2fc32c60b4bf108d96b6345aab88fdcb665c87d28c3584d2b"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "dd2bf0700fa7a9643c95d68fdc9c3a6c96a6c9eafc9425030689fef7fb045f92"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "b421836c8724bb22a30b2f268c9fb94de56641b0a38a5c054a9a74850b44a0ae"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_FirebaseAuth.xcframework.zip",
      checksum: "03d00057174974f286b4d5dd07ed58d7119311fe91513324436b1f5c3c3c72e4"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "fb36981a43dd78168996d599dcb6add3dd8d30d1633b5086d0cbeb9fe3f62c3d"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_FirebaseCore.xcframework.zip",
      checksum: "f0ab526ae294826efb6122f2ba592ccca940025879b2dd2e0fb6027945afb4e5"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "7639696195585af458c65206fae33fdb8165bae57febaf090fdc683e7a053aee"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "38ffce54d62e71d5800bbae4d53e9409eb3b3da28b7b0cc039ce77f0dc3c5600"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "e30fdca496dd6389d9dc790a6ab32cbebca4688b8f89c4a50a8ebb11c6eb948f"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_FirebaseDatabase.xcframework.zip",
      checksum: "f4d19bd9c3596fbb062cfe6a310cbe3ba341e122390d7daae2310048d794ad17"
    ),
    .binaryTarget(
      name: "_FirebaseDatabaseSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_FirebaseDatabaseSwift.xcframework.zip",
      checksum: "9e2f41b204a60ab8f93479d0592a8dbc54c5471f658d81f50288a2da2f10e757"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "9e05ed93ecb0b495d56702be4218fb993c4468922f527bfc3e38d3acb24c6375"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_FirebaseFirestore.xcframework.zip",
      checksum: "6c35a24a4004233f2db57c7af1d6c77e50ee8180bc4bd1f7f1e5eb9ebf0b4b99"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_FirebaseFirestoreSwift.xcframework.zip",
      checksum: "106117400a596d51921bc47852d2d5fdb66c53b8468bc6a38ab20368769d21d9"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_FirebaseFunctions.xcframework.zip",
      checksum: "c79158e312da491752c8104abd953266ad5c7478009e84195eb97b869cede302"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "e8553f26b7526d23593c4593d118e71203260356b308add108ee935888e61909"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessagingSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "9a2d078260b1d28f09edf387c116942ff4ba1c93f3aeead2aff64f66a4a159e4"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_FirebaseInstallations.xcframework.zip",
      checksum: "e2ef46c521cddfb9918f5d3a7e4b08673ac9c04d11a742f52fd25d823e281b9f"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "47c37b70635fa9aa87943ad38a37ed8526b200926cf86d737b3c5d726fc9e223"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_FirebaseMessaging.xcframework.zip",
      checksum: "a1af082aafaceb93300a6988064f932bdcd975947a28383c6fde3c123f58e2c7"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "9341f3a5ba127ebac81fc5ae9f632fbb523cfe918bc258d89e14ea98f3966ee4"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_FirebasePerformance.xcframework.zip",
      checksum: "63f06c826b87226f7a1c6b4511dcefe1cd9f4b5ef5951862b8c7c8ad7ad35a06"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "c7a7eb62ea2e57d66690b698c6d4f98c907789099abcbfb8b2833aa8ca3cb62c"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "bd3dab8947090b819e438d90256333256fc2424f0bc0eed40a511d6a4f134d2b"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_FirebaseSessions.xcframework.zip",
      checksum: "150ad6092f5bb02257fde08bd3371243290a50131c10b9f728765dc07f9db7bb"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "4a8bd22b079a6fcb5033ae479818c433449bd7d3e448ddde61aebc07a99759f4"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_FirebaseStorage.xcframework.zip",
      checksum: "0375ebc33f05f75f34fb2abc5b0a2440f9dbe2a7ca87ccc5884921a6e1294653"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_GTMAppAuth.xcframework.zip",
      checksum: "56ea1308019bcdaf4a873eebfba4b7454e33b01f05e5bf9461535628ad1d8c18"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "eb53cb40804fff8c3857ef81ab733f77bd08c4c0c0377b00afc1c4bb140471e9"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "2b358ea29f07e65096a82380b706dfcc7a561ae95608f32229957b352504700a"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "4690061cfc2f3a13abbae8c176888634bd3592fb6edfb97f7062a9e65847ddd5"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "29f21189a70ec2250aca04cc84bfb833dc49e755a1287e9aa9db023b9d34da9e"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_GoogleDataTransport.xcframework.zip",
      checksum: "3f685caabdee9910f389447a6b726732e44879264001bc8d55aefe04e5b87f27"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_GoogleMobileAds.xcframework.zip",
      checksum: "5220918c558f90ecd9a089a2acb9e2d9b4daec25f3f7fe09a079a0d1b99f3cec"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_GoogleSignIn.xcframework.zip",
      checksum: "36276958ed606e3d0f3bf696368ac2d1fd044484f229c987fbc931e93d313cef"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_GoogleUtilities.xcframework.zip",
      checksum: "5837fa5b64d2a5ccd4f2208bd829f8bfba2ada65454ba581758f34c8779e9762"
    ),
    .binaryTarget(
      name: "_Libuv-gRPC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_Libuv-gRPC.xcframework.zip",
      checksum: "1bd1fa789102dc009e15e60ef9f80ea19de3bca966f27a31cd4b42718931527d"
    ),
    .binaryTarget(
      name: "_PromisesSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_PromisesSwift.xcframework.zip",
      checksum: "c4ffb772390d620e0bef08f8091df9c2c1c05fe6dbac595cc9727d66262c00ed"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_SwiftProtobuf.xcframework.zip",
      checksum: "b2080a436dfcacff59c1065f054146e4a32f07153b1f986cd912faecba5a6d0b"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "584e849fab1a8ec4c81662c01cba68aba5a1c35dd3ffb7e926513eca434a2d61"
    ),
    .binaryTarget(
      name: "_abseil",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_abseil.xcframework.zip",
      checksum: "b4173b3642b4e61418de335c5c4e7ac553e27069b068deb2d8c3f85db4fe9847"
    ),
    .binaryTarget(
      name: "_gRPC-C++",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_gRPC-C++.xcframework.zip",
      checksum: "d3c03bde71ad74438f434d714057381b25ff20b79963070e915f8734db87fb4f"
    ),
    .binaryTarget(
      name: "_gRPC-Core",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_gRPC-Core.xcframework.zip",
      checksum: "04055886b74b3dc43e4baec8ec7a7594807f10bb707e20cb0054de052ced14f9"
    ),
    .binaryTarget(
      name: "_leveldb-library",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_leveldb-library.xcframework.zip",
      checksum: "b15a133f1a378785ea356f6823f38a3a842ee5e15195f220f36bd9600636ddf4"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.6.0/_nanopb.xcframework.zip",
      checksum: "0c8b05cac154150409bae820a0ba85f449cf30d5a9afeb7800b1cbca4167e32d"
    )
  ]
)
    