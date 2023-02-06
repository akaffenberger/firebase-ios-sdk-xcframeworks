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
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_AppAuth.xcframework.zip",
      checksum: "486c0f46f97413b86f431a32323a42f527f5c9b2fedd1112db7a721c090dbee0"
    ),
    .binaryTarget(
      name: "_BoringSSL-GRPC",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_BoringSSL-GRPC.xcframework.zip",
      checksum: "1c060251ad0921dde33ce635f7b4f8145294b54276659f34193dc7a4f1e455c8"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FBLPromises.xcframework.zip",
      checksum: "b369c3c79d9a27367365e1022558e18741424df3ce92924fa26b4d1ddea22282"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseABTesting.xcframework.zip",
      checksum: "9b0888cb79a5d00c7c08bd0aa06495b5b02db8fa440b7d1fe22cef024a46ddda"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "ff3f0c50e0919df4ff16a1d439531626314b4af93b910f0ca48cfafc2829ab6d"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "0aca0d10733e4418f17363e41f22e0244cafea57f1f7e51ffb649dd3c40edf49"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "e624b4fa83598e176633de6f2ee2942e4310a0f908c9628c1038022aa5d51798"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "55dc14d26fc4467b7a6c1cd6ce44156d82846c6f6cda5074d7a212b9ebeb96a0"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "71b16809cd321845b3b15f48c0dbcd634a838304cf210285affb36f4bca2dd1e"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "eadc200868839fbe4ef8b05adcd1301a9e342ec2ff40147fa4f54195e96d18c6"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseAuth.xcframework.zip",
      checksum: "1ca67ea70cf4bdcf25abd2afa6a93a2460579598222373499339c907054d60d9"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "5ad7a07572a9fb40e2f81217e10acbd918545ecdb230e05994e9786ff2d7d507"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseCore.xcframework.zip",
      checksum: "750fea427672f5550812cfd6895f5abb76ac232a86234d5eecda280525e9e74a"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "382ca9c79a98e4a926fe0f9e38680fb0a0e3105473756741b6cb16aa520d49a6"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "633ca0e1bd4b8c4b430158e73f8cf41c1f12bc5b62509774ffa8996e24d67017"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "fb6fe5eca16dc4df16d31c25313f0d5b3369e959b86b1e013f03b61ffecd6d86"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseDatabase.xcframework.zip",
      checksum: "ac84bf622b633ed190f1372ea83ec5b8b47b39f2e3d8d949eec7bce60fe50e52"
    ),
    .binaryTarget(
      name: "_FirebaseDatabaseSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseDatabaseSwift.xcframework.zip",
      checksum: "c9a9222aafe22bd1d17a89dd69dfc83952c32f63d066efc5ec4e09022c9307d4"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "c008bd1615079b3735d09225d53a55242f9e8ea3555ace710739b0f28a5a91d5"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseFirestore.xcframework.zip",
      checksum: "df84e62fc45693ae78cd1e75a7ac9736fb0f1a593902b9cdeed33182a5f43b8a"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseFirestoreSwift.xcframework.zip",
      checksum: "a2daf8f5fbc195b5028f8af0a1884bb9562a3ebfe4c9b959d91090887d87154f"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseFunctions.xcframework.zip",
      checksum: "cf54ab89d6b67ddb6aed5056ab88d08b7607558f132ef6b0cdc4a5f65e9b30a2"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "1bff2b1d62092cae5feeb326f59f382858f670fb2a4139a6a683f6a255a3c327"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessagingSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "e56cf42bf4d38f063a3e37081667ae424bbb8c2bd5beecea77cafb62c07e34b5"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseInstallations.xcframework.zip",
      checksum: "d35c1bd357481260e406fef362ea6688243e70fc610a2e3e6413515717f301d0"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "4528f88932ed69940a03e59666e4c8418387f8b1980cddaa250c39ab6e1c4367"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseMessaging.xcframework.zip",
      checksum: "fa80aa11f65212db0c0c036ec109349dae006330618dcb6b12d4fa3d0fd822a5"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "bf449e7fdfd5823b1c493dead2a8d9898a5dc9c661cd5a671ff5ffdfacf2f6f0"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebasePerformance.xcframework.zip",
      checksum: "99acb946142cf9e53d78ba45674a577f9149441d85519fa542340475a2cb6abb"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "c306801819a5461a0e7893e1018f35e12c75f163fe18e74ddb02bf48310a6960"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "a431c7f4c75a44d1714af592b5657ee5a4583e5b7aa5c98ad74e1f365c16d4ed"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "561a3e739a2e5dd11c7192c45a2fd61b506eb09b597f38b27029cd1b8e67c625"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_FirebaseStorage.xcframework.zip",
      checksum: "79d895becaca4d1b3b44b68629028dec085961be8508f5484bf107a401b50179"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_GTMAppAuth.xcframework.zip",
      checksum: "ceb13fde0ee1386005c507b221a0f58f61b09601c62db4444598308337376b3e"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "53723abbd4f8f1b5c888747af74c020f14a263f3cc89fc141ae5f40d79c820c9"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "eea13f800f617115bf54f11c2f085a6aad8387f13beb50e63f0b4b0d97149676"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "1195ca062597304252b121a5bbbeb0735570a1477307a28b52ca147adda074cf"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "5e74f2bc92567d6f2b59d89701ef1b254d49346956eba7a4f26a79ace3b3ff1e"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_GoogleDataTransport.xcframework.zip",
      checksum: "458f2497737115d396814ef81b7a0778618276b593a142f3e7ac6f4d2438143c"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_GoogleMobileAds.xcframework.zip",
      checksum: "ec4fc457c2c191db7c69b135d054359598492020a504806b278ed8e2134cef63"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_GoogleSignIn.xcframework.zip",
      checksum: "53bf75b1b7a9edda40a646f0d2958eb3dddf19a88a915c8ff182cfdba3302f51"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_GoogleUtilities.xcframework.zip",
      checksum: "d174382ab5d790b49776b128c37ddc317fae450562416fc2e5cde07c0a8ec7af"
    ),
    .binaryTarget(
      name: "_Libuv-gRPC",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_Libuv-gRPC.xcframework.zip",
      checksum: "378e705e3537a0753fab7d6957f9f3be662215dc4c676540bba30c535fc78ec1"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_SwiftProtobuf.xcframework.zip",
      checksum: "217cba75f633caeddaf4e27cbb9ad818bc18d88a1cf79830e0d2f046403c9ba7"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "35bd57293f94f7b860db6625b64a3de0ac83abb82e10ab8ed10d16d1c31ceb52"
    ),
    .binaryTarget(
      name: "_abseil",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_abseil.xcframework.zip",
      checksum: "366e7b2f3e443668e3064501502b69155ac0d71384edc9f64e798a14888ec235"
    ),
    .binaryTarget(
      name: "_gRPC-C++",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_gRPC-C++.xcframework.zip",
      checksum: "b287a53e32f272d4b12bfc5b2e3137f22149657bbced18e247b23153aa8d2b21"
    ),
    .binaryTarget(
      name: "_gRPC-Core",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_gRPC-Core.xcframework.zip",
      checksum: "c35e80b6ab25bd15eb8466dfaaa3a54d71c3d4fed59cd49790e5f1e9960fce13"
    ),
    .binaryTarget(
      name: "_leveldb-library",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_leveldb-library.xcframework.zip",
      checksum: "8caa74755cf5d5409ec594e0ebcaa906e9a5577634c8bd981c9890e1a8d3e75f"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.4.0/_nanopb.xcframework.zip",
      checksum: "eee619ee5d62c9328d59c9173cac4be285c3d73fcd2800d4612446c0538994d6"
    )
  ]
)
    