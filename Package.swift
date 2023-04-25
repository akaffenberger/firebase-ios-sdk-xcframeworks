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
        "_FirebaseAppCheckInterop",
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
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_AppAuth.xcframework.zip",
      checksum: "4d1a232811dc2fcb7ebc0532e558fc961db90e2eb0550a7c9bf4e77e91424f05"
    ),
    .binaryTarget(
      name: "_BoringSSL-GRPC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_BoringSSL-GRPC.xcframework.zip",
      checksum: "82e2cc7f5e2bcbde2087bd46a5345b0dd5d08df2f1a45f4aecc44456dd1c4b48"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_FBLPromises.xcframework.zip",
      checksum: "09bc47c138f9c2d68620706577788ae260eacbf49930d7adfa4fb139aa8ecef1"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_FirebaseABTesting.xcframework.zip",
      checksum: "dc15d703e725c6e0793329bd217786ec88ff9cf6fc659e8a13d2d4787f7f5518"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "cebd66a145ee83fb5d57edf36a846f0c388c1a2395c04517c6c075d3defa10a7"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "d550fa6d3e5acb858ec88cc4eefa56073a517de137555cb19e73d77ce511f2ce"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "ea3f857fc3da8db2bb7cbcb7fbeb939a75cb2d015d4c80710951ce0e4cc761c0"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "59057bcf426c2cd38a5ffffe06a87782178c9a27ce6ddc6a92523696d7e23aea"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "309f805bac163781b537b11cc205cab2f86bc384e0622d0d1c8d724d9642c7e2"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "13b8c35e2288e48d3a58b7b1e156276d0d0195d15825058a7793a84d838a3bdd"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_FirebaseAuth.xcframework.zip",
      checksum: "9ba36c946cf3422f31f85c02ab260d7cccbe837bc525493bdecedeab13dc31b1"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "7a8000eeb40f3e626232e4967f12c5711a2bd5149aca81b7295b1fe4ceab8fa8"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_FirebaseCore.xcframework.zip",
      checksum: "bf640157d1f2f0ffa6499eb89e4b9e9a1404a5bb1f1434e81eb6aebeb5efdc2f"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "f063e832a3795c6ba0de60cc5f25a0346fd54454092a3b7761590ba83ae1a97d"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "3db9b2837db37e5c5f624c5afd67dfd94d3648185a3669680c7dfdd0e49dfe9c"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "fe7c8faf786fed6fea2d6b82ff2cbeb2796b8b66b384bb02a507f3a7ad429f23"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_FirebaseDatabase.xcframework.zip",
      checksum: "7d2b6102f336172b53d0a564409cb984ec563aa723796bf945174ab41fd44522"
    ),
    .binaryTarget(
      name: "_FirebaseDatabaseSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_FirebaseDatabaseSwift.xcframework.zip",
      checksum: "a9aafcfd8b7ab2f816a2881683b97c33ad4d2e862de67fb15b9985f64d3ce3e1"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "6a57fc3cb364b37b44b952a3a5124582cf0e56c5e29e9e84549a465b352f89cd"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_FirebaseFirestore.xcframework.zip",
      checksum: "0a3fad28803333b2c507fe7c826f60126779019c2fc553723140bd12d98fc1de"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_FirebaseFirestoreSwift.xcframework.zip",
      checksum: "3fd0a799204b470ef22631ad4f52f976b7755a55d3ea6e42c6638befee3515bc"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_FirebaseFunctions.xcframework.zip",
      checksum: "393c8879af476f56230085a8fd6893500ea38ec01571a1006dfeff46c13666bb"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "e8e1fc61bdb7725d104931d0e5eb81126ead290dd659f06dd9b82791f61c8b15"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessagingSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "ecb705244bd270d8ebd6519f32df2107ee1b4e39c24d1076f6eec5a0bb4f94cc"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_FirebaseInstallations.xcframework.zip",
      checksum: "9a93002784e20bf3666a311d34a842484d4ab70f4d2e7003ac9f79b3234bd0db"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "eae7fc0dde630ccfae4b0f4da13d33140621ca4f0bb3aaddd2200f00b41f4d01"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_FirebaseMessaging.xcframework.zip",
      checksum: "a42c7d638ecf7cf59fa83909c1000cacb1ed9a7e792e5226ad742e285f69bc63"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "8aa254b1606db0cec9447e3741bf60df274973dc7dc58e9bdbab10f93e405570"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_FirebasePerformance.xcframework.zip",
      checksum: "6f49d802c0aa155792eb7e0696bac43e40f2481b1912dc0350bb13fa8228f271"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "3f4422710bcfbf6cdbd542d750b95cc56826c148de0cf15e904811292a29faea"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "af25d71f30eebcd0de9e59eca3b44a6ff307f78053e941569a46d7fcccb9e80f"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_FirebaseSessions.xcframework.zip",
      checksum: "2cc610af0cd84815552914970b4fd2309ce3fe774f1b7f5180c17a64bd3cba80"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "19cfceeccea12be26bbd3c49e08604a014742f9bf3add0dbba02c3ae246bc7a8"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_FirebaseStorage.xcframework.zip",
      checksum: "a093b9492f20f7134e3b28c3ea5cd156587d7c1b69345deaefb4323c9509e1a1"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_GTMAppAuth.xcframework.zip",
      checksum: "cf972422c7099cbefd57b96181d2f4ef82e7941a0ff4e6116de46fea7354dc83"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "7fdb4da1df9d70f748a6302a98647dc2e74dbd02daae31b7d4a358db40eb827a"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "91b51c9e377417b5aadd729c0995a04b52de8e05a8233331e7a87eb8fcbf4512"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "64de88edebbe221843061f6c1fc9516949a48fd1d5617dcd358ff22fe179a5e9"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "0b355de835bec64c8fc2b199706b519b8a86d21909b31731e8ed78db0078cde0"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_GoogleDataTransport.xcframework.zip",
      checksum: "e3df043b0b5b4292c6f22b786ac134b9b03251082d46f509587cb80fa0d95d50"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_GoogleMobileAds.xcframework.zip",
      checksum: "40a5f08b435902fcca7d863a9ead58ec292a20e1e4ea22447e95bb73fa0f63f5"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_GoogleSignIn.xcframework.zip",
      checksum: "e2f214f455f1b56fc5b03707c09f950bdecef7c732e983eeb18c7a5d0667c4b5"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_GoogleUtilities.xcframework.zip",
      checksum: "81d689ef25d64476b685d8c4ac28c989d07b2298a0de2e1eb447fcfa8bac575f"
    ),
    .binaryTarget(
      name: "_Libuv-gRPC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_Libuv-gRPC.xcframework.zip",
      checksum: "50727df9631693c9f14eb99edbe62dfdad03d5e231ef4ad5361af95d7789043b"
    ),
    .binaryTarget(
      name: "_PromisesSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_PromisesSwift.xcframework.zip",
      checksum: "8b219f5c619b7c68d326c7fa3ff994cd011a48b09c4b8dbf992dfdd9b5851004"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_SwiftProtobuf.xcframework.zip",
      checksum: "7773a97c083a2ea717e2612c92aebcfaf3c14be65092dfef5ca3a1977f05cb45"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "1a7c73c0d7c14a2add4a7068a50a8ff0fe0610a97c8d271039a763fe6e2e6265"
    ),
    .binaryTarget(
      name: "_abseil",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_abseil.xcframework.zip",
      checksum: "2828366885399eb57cb5cc6695ada453cdb7c96f878ac724cce7640608c646a4"
    ),
    .binaryTarget(
      name: "_gRPC-C++",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_gRPC-C++.xcframework.zip",
      checksum: "6678d36f8466446f1e5533809e7703b9f9878fc12db91433c798a554b8e9439f"
    ),
    .binaryTarget(
      name: "_gRPC-Core",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_gRPC-Core.xcframework.zip",
      checksum: "44c8b94969f0893889f41844fe9121b1a83967d63e1448ba11d3452250f196da"
    ),
    .binaryTarget(
      name: "_leveldb-library",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_leveldb-library.xcframework.zip",
      checksum: "e78c18c7926bba41cf33be55d382a118b91e4518c19727e1e95136fd1f27c710"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.9.0/_nanopb.xcframework.zip",
      checksum: "2918a86db808995e4402ecca9e48aead0730cb2fc9006052e4869ecddb4a5583"
    )
  ]
)
    