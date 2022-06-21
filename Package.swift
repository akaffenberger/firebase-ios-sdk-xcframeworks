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
        "_FirebaseAnalytics",
        "_FirebaseAnalyticsSwift",
        "_FirebaseCore",
        "_FirebaseCoreDiagnostics",
        "_FirebaseCoreInternal",
        "_FirebaseInstallations",
        "_GoogleAppMeasurement",
        "_GoogleAppMeasurementIdentitySupport",
        "_GoogleDataTransport",
        "_GoogleUtilities",
        "_PromisesObjC",
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
        "_FirebaseCrashlytics"
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
        "_FirebaseFirestore",
        "_FirebaseFirestoreSwift",
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
        "_SwiftProtobuf"
      ],
      path: "Sources/FirebaseMLModelDownloader"
    ),
    .target(
      name: "FirebaseMessagingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "_FirebaseMessaging"
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
        "_FirebaseRemoteConfig"
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
        "_FirebaseStorageInternal",
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
        .target(name: "_GoogleSignIn", condition: .when(platforms: [.iOS])),
        .target(name: "_GoogleSignInSwiftSupport", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/GoogleSignIn",
      exclude: [
        "Resources"
      ]
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_AppAuth.xcframework.zip",
      checksum: "b14cf735308bba99f9004f382994434620f8423a97d968b90aafd70d1a7b6829"
    ),
    .binaryTarget(
      name: "_BoringSSL-GRPC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_BoringSSL-GRPC.xcframework.zip",
      checksum: "46864e3bfececc7742428a3bfa2055c9dce67225b9d2bb9b90786bff94a3e9b5"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_FirebaseABTesting.xcframework.zip",
      checksum: "ae218d949b8353a1a24a6449fa7b182a191a22411401962f3cc3e771096204cb"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "6ac5282bb9eabb414ebfafcbd36d0df0a3d9e169b60029056283b2ebdb2e6440"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "4d7e60fe6f8e4756245d0384cbb1fc9e707e2dac53a6a0f8b00ab6270e0ffceb"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "80caac74b0b63d76bf3927ecbe745595ff1384525c319d590dbe77f641fdd0d1"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "4a358139d188969ea3adc6fe045941b9b5c16bb1f1e586f0b87204980c7966f2"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "d09a844323e474817fb3dc4519b3256612a357aa1f1ae17cf3f1692438788a52"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "a765aea03a07a537b31bba31e991bab40ed95d14396af041a95bc4f7e47ecb40"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_FirebaseAuth.xcframework.zip",
      checksum: "289430e0f6341ece25c56726e93f092885d44dc1a2b98a0e31e132c61f8ff12a"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "fb5a637a4e954cf4cb3152d44d8cbb95ff6e8f21d02ce1974504c62c4f348fd5"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_FirebaseCore.xcframework.zip",
      checksum: "9c1b3e7bae734c11c7399914514a523fde092f94baf3d1b3945e4e88d7064537"
    ),
    .binaryTarget(
      name: "_FirebaseCoreDiagnostics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_FirebaseCoreDiagnostics.xcframework.zip",
      checksum: "2b3760bf8ad69ba49f4bd688e7159044d16cdb9663f617e984b51aebca290c96"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "253ae4a81d8f000f7e81b6d55651db1c6eeecc857996dc0f071a5a747b229ae1"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "9cfdac2ae0ed221ffbb8fc4aabf88c9016eb8bde6c43bd057c2f172bef887877"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "fba63846453a6a86ea817228146133c7f7c505a178bd6eacc2af640aa9e2e53f"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_FirebaseDatabase.xcframework.zip",
      checksum: "d5ef3c77e505c5ed1ad0cb86007ae517a93561d85439ff5f9c2d7d49dbd44620"
    ),
    .binaryTarget(
      name: "_FirebaseDatabaseSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_FirebaseDatabaseSwift.xcframework.zip",
      checksum: "427fc89c0e6c77717c256c288c84f2603c30e6c4af597942a077124a8f5e311f"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "194cc0c8dc034b4948239dcca177fdc7eb048b873ced48df95242ae5976e59d0"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_FirebaseFirestore.xcframework.zip",
      checksum: "3371d02a975d9df8400e20abcb08631ee5470cdee39b5ab37fa09700ff4f94f1"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_FirebaseFirestoreSwift.xcframework.zip",
      checksum: "5b55d6968ce85bc3d320c1dfd68d645a337b64610a6a05346824b20ce835280f"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_FirebaseFunctions.xcframework.zip",
      checksum: "d3ac2b700276cce2abac3e2c8b356740192af1a3a6e2d1152a77a5c88452b6b3"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "fd8f67638de305d71d462fc04e30d5b4166b68136258c7187df1dd3b412a97b9"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessagingSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "9f78aa350326c5e21b95bc9970588694bc6fbc5cd12dd241cee01aad8c713e7e"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_FirebaseInstallations.xcframework.zip",
      checksum: "09324a6237f4102cd8caef0fdcc18c8678043da22b342c65b587488a5c058528"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "b7d063e86e91ffda9a994226f7f01a2422a588933328caef191210dac3cdda00"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_FirebaseMessaging.xcframework.zip",
      checksum: "b4216e8468b5826eb013517bb1957c08b822ac4254ae71f1318f0062d2ee12b0"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "5286139f2c0cf77720bf58a25eafa7b0efab72fd42dc045048dca13386dbb6b5"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_FirebasePerformance.xcframework.zip",
      checksum: "b8e6231fb388c982eecc8efc198d6390d2174c3cb1efb5d5bf9f0dc511a32edd"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "820cf7e27299bc91685affe9342883093b69b1cd4b1dfe2b9fe695aad9472e87"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "407b89c6010f2c9fa53ecaabccb0e59f8a0ec7fe121663bf7b9b93bd33751810"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "c4cefec639c6a52ae2deb9fa39afe5be1dafe03fbb67ec5a580de59707f33c7c"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_FirebaseStorage.xcframework.zip",
      checksum: "65f66e91504436675ac08064dd5d4062ae69c461c5d3c9c7e857de4f59008f7e"
    ),
    .binaryTarget(
      name: "_FirebaseStorageInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_FirebaseStorageInternal.xcframework.zip",
      checksum: "f15b9cf5a7aa5ce592fc40232f405864bb3d7e74a2c85a6d41d7ce94bf2999cc"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_GTMAppAuth.xcframework.zip",
      checksum: "8779e2f9d25a3144de464187dbb8e231f97e5424f4c03ae0140ac603febaf9f8"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "f98822e48e88daf1dc0cad5d3964a03546f81702d5d1f8ba789ad3b7174c1370"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "9dacee2ff4c11dc7b9840e2b12284503c506e631081cbe0f8693928bdbed03d2"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "58b4a390a9f9fdaa9883f2aee208821741702a8e473137f139516ec79cd6c246"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "51f370eda1b652d10404e1e24cafe913948526ea4aee651604f406efa79fa97d"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_GoogleDataTransport.xcframework.zip",
      checksum: "4a3c6f82f9ea5993eb914289af3c5d76e62815a1727867f414ef627858123b07"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_GoogleMobileAds.xcframework.zip",
      checksum: "c1a1f387b402cefea2ec038574810e53d0abdbe925a9f032a7c8e65df5b230cd"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_GoogleSignIn.xcframework.zip",
      checksum: "a2d81cda4c0a406ec37515a88f9333c3d744788e017c52ba82baefaf5404171d"
    ),
    .binaryTarget(
      name: "_GoogleSignInSwiftSupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_GoogleSignInSwiftSupport.xcframework.zip",
      checksum: "4412f266fea9ce287682d56b553f44ea31e6e7f3fc289d25dfd2e09cb12d898e"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_GoogleUtilities.xcframework.zip",
      checksum: "3ab8b2ba6e701e2735cd2388c1ba6fbf226dd98ffb74968d879fee4af97592f9"
    ),
    .binaryTarget(
      name: "_Libuv-gRPC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_Libuv-gRPC.xcframework.zip",
      checksum: "25b25cb994c6578960533b30c8d916fcc69c1f78cf859197d9beb877de58f061"
    ),
    .binaryTarget(
      name: "_PromisesObjC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_PromisesObjC.xcframework.zip",
      checksum: "4ab346b69ba86f752a24db5b000c53db9000eaf597ab4cbd58147605fe73ee64"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_SwiftProtobuf.xcframework.zip",
      checksum: "2de15ea40bffc7178e73d50041fee89dbd25008316f7c9d79f6e884cf5979bb7"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "99953acba0d1641cb8b82fca7bf74d538aa8492920ba2489bdf3e1d02466efec"
    ),
    .binaryTarget(
      name: "_abseil",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_abseil.xcframework.zip",
      checksum: "3f38b7289bf6e53b9d8bc01c95806f7d0c282a3bc229b171b0af380250cbd14d"
    ),
    .binaryTarget(
      name: "_gRPC-C++",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_gRPC-C++.xcframework.zip",
      checksum: "1b1c09607bb51d783db03105d1b8d737d0a295e05b9bb714e115574c01ef1bc0"
    ),
    .binaryTarget(
      name: "_gRPC-Core",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_gRPC-Core.xcframework.zip",
      checksum: "8b2f706cfe8ab4070a9856747cc7dff8d2dedfc88044bcfc1d62a2adccbf2082"
    ),
    .binaryTarget(
      name: "_leveldb-library",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_leveldb-library.xcframework.zip",
      checksum: "c08e6a78becf41c86c307ff6aeb1ae705280a0d6ae6fdc03e76cf5cd778eb0b5"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.2.0/_nanopb.xcframework.zip",
      checksum: "82852c583c4ffc0a45c2daf9c9d167f820394aadd231915a29d878f272076a41"
    )
  ]
)
    