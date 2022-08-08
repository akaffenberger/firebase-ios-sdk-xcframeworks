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
        .target(name: "_GoogleSignIn", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/GoogleSignIn",
      exclude: [
        "Resources"
      ]
    ),
    .binaryTarget(
      name: "_AppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_AppAuth.xcframework.zip",
      checksum: "556875d429d9e13a65df0614857225c9f34fcb0e1ea592a49a33a394b8f91c54"
    ),
    .binaryTarget(
      name: "_BoringSSL-GRPC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_BoringSSL-GRPC.xcframework.zip",
      checksum: "0b64ff9127b4a48b2cefb88948c7c7a08ea1054bab0a3b94314224853bc93b95"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_FirebaseABTesting.xcframework.zip",
      checksum: "b779dd57ca9ad0a98a7f9141f0877590d4c76c0360c00f192e13b17b251df3ba"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_FirebaseAnalytics.xcframework.zip",
      checksum: "58f22c78a0c211109d7a83f52c40413d1d74c05d43efa6baaf58a5edeff12851"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "84254162782f13f4082ae6c705a045c5511446599dd2e5baf62b93f82a979b09"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "704490ee5726b364d06db2ef28df430895ab846ec71b812cc4abf6e2467e7742"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_FirebaseAppCheck.xcframework.zip",
      checksum: "338cb2d5ed06f7b80e116292a1ceb0228768f7e4a2d3c8838980b35ad3e7cabf"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "a3719158394277791a95ccc8927cf1eab09bbd8b71cfd8beb1c8727a39f01a19"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_FirebaseAppDistribution.xcframework.zip",
      checksum: "2a38eb798318244484e366062eb77b3b47fcdb950978047eb67ba392fb6c81c8"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_FirebaseAuth.xcframework.zip",
      checksum: "47a4501424539d477243de69fba25f9b82efbb7ce7bcfaa9fe00eb75d42d75a9"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_FirebaseAuthInterop.xcframework.zip",
      checksum: "4a196aaaf6f09320ba96c5112093a918445096270ed627d80fe7a206b20719c6"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_FirebaseCore.xcframework.zip",
      checksum: "e338cf529a034aab82bbe9bdc819beb512617db0a00cf6d642b046ab32d9fdfa"
    ),
    .binaryTarget(
      name: "_FirebaseCoreDiagnostics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_FirebaseCoreDiagnostics.xcframework.zip",
      checksum: "1fe03ee9f5a04879d78db8082ae23d7de578d95a839ecbee9806c58d0ec77e88"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_FirebaseCoreExtension.xcframework.zip",
      checksum: "f40195ecbb2e9ef86d8566fc2705233776e203fa1b0fd897eb1700b57dda4d49"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_FirebaseCoreInternal.xcframework.zip",
      checksum: "3b3753ee4c62bf5b41e924f60ccab807ecf30645aa40de9106dcab38fab8f8a3"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_FirebaseCrashlytics.xcframework.zip",
      checksum: "c3245934886d58ac73b0621f2378fd8a8c39752392ea26c01a9c5faed6cc1b3c"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_FirebaseDatabase.xcframework.zip",
      checksum: "2b6461b8a37dbf5125d8aeba266b99fe65749c00538003f387708df9936618c6"
    ),
    .binaryTarget(
      name: "_FirebaseDatabaseSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_FirebaseDatabaseSwift.xcframework.zip",
      checksum: "db832c6dcb38982648eb380153916646b08c500e486b4cab50c867624d74c26b"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "53e269cbe3819c85d8dec144211d62a4f6a0ceba76619407843635111948d175"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_FirebaseFirestore.xcframework.zip",
      checksum: "c01fce8e1a326918e1359fc4822c8d4516d3e81d740008f48910bb4b88b1302a"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_FirebaseFirestoreSwift.xcframework.zip",
      checksum: "6d9d629f8e42dd23df5a5eeef61a071de860484cc106e7dec09167d7bb4eec58"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_FirebaseFunctions.xcframework.zip",
      checksum: "a1bfb8423046129524a92417c3287352e4e58413325447fb1c9a3c775b4710eb"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "9eba11fd01ebfbfef5a6944073baef0fe7dd4c51233b7f552bdd24c699a16992"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessagingSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "a550caa8681fed441804d40dc71105d370cb63d363f798b8b87444587dff93ed"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_FirebaseInstallations.xcframework.zip",
      checksum: "3b9d9bff1c7f2b2f3f17ae1a316fada3dbaede1aec3ee0e5ca5129b54daabb37"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "0da44822421e3010928ecddfa4b057377927068d6e9ded5733f53304a6ffa9d8"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_FirebaseMessaging.xcframework.zip",
      checksum: "599213ab6f3a1058a75034cbf87f7101493f13f1e2c457ec78c938210b571510"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "910f17cc772186a7c4b0655729977f0a78cec44de4320c7883f2e8adb75d1cbb"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_FirebasePerformance.xcframework.zip",
      checksum: "90ebef7b618ba6e00ac1f687c8db178df888c44a6d5625eedb82c6a68d58bdfc"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "ec422dea37151d6d508a9e60408609f9b198ffa2d5ccf5cf2e6d08cd11ecca62"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "c40d50897e1e39ecfc6e87679cf62e8e1e950424a07e90fae60fed623eeb4b56"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_FirebaseSharedSwift.xcframework.zip",
      checksum: "478adb4027b74b6d06449f93a98f7cad732cb5fd51225a3c49ffd371172af0bd"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_FirebaseStorage.xcframework.zip",
      checksum: "515478abf86f7a54c88cfd11eb916d3a2f42bde89b75a38d26f7282e9fe09846"
    ),
    .binaryTarget(
      name: "_FirebaseStorageInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_FirebaseStorageInternal.xcframework.zip",
      checksum: "3f5ba1f6e3cb3305f550e59fdb7c562b60f2a16100254d8e2f40d800aef5b9d4"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_GTMAppAuth.xcframework.zip",
      checksum: "eba0644e0b6b25ecb0397f441e653c9bfc6b618339a26fd4253702444f86b6d4"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_GTMSessionFetcher.xcframework.zip",
      checksum: "5338151efd123dd53064369abb537a284b51ac53e0214dd6ad77cccfcf2e9c17"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_GoogleAppMeasurement.xcframework.zip",
      checksum: "5105ac97969a9371bebc6703aa66b4c553634df516c023660acf08645243113b"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "061171ce869f54de81e18e9b1d67dc6a752d5fb5729dbe081d99f98326e625d9"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "a264a2de56836c8661d4d165f1f1cbc21db4ac219536a4c7008fd364d12a5753"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_GoogleDataTransport.xcframework.zip",
      checksum: "e8f64770318cd0a7bfbd339fc6950c0ac822c372f85680b8e26f4380f3b10be0"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_GoogleMobileAds.xcframework.zip",
      checksum: "90d871efe266d71ec66a2dda795bddc045b800569b4f083d95828de874ab1caa"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_GoogleSignIn.xcframework.zip",
      checksum: "bedabb86c12ed6bde1d5d7a795d9ba07c820eb77386c1c93bea35fd3f8173512"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_GoogleUtilities.xcframework.zip",
      checksum: "a7bec7404d06c220cacc27682bd3f2fe627028bb9a0ddd26f3ded902848d49ef"
    ),
    .binaryTarget(
      name: "_Libuv-gRPC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_Libuv-gRPC.xcframework.zip",
      checksum: "bc6fac1b805ed7f524137eba55bcf73c568b88e5b33886747fffec0bb1ad2a7b"
    ),
    .binaryTarget(
      name: "_PromisesObjC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_PromisesObjC.xcframework.zip",
      checksum: "c23381e2d50ae223ad28833e0dfefb1871a867bf91729f4707ab16a3680d95fb"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_SwiftProtobuf.xcframework.zip",
      checksum: "d55083d78f0c820f69f1bac7080ca233e021264e663fda50f3cc619cd67a4ff1"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_UserMessagingPlatform.xcframework.zip",
      checksum: "3dca5c146881023264e022ff95d400df14538b8eb47b4e607944942eeb89d873"
    ),
    .binaryTarget(
      name: "_abseil",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_abseil.xcframework.zip",
      checksum: "8757ed0b7b08b0d93dd2a9c4bc6ad8d84825384b65c459d49a85a778a3a00183"
    ),
    .binaryTarget(
      name: "_gRPC-C++",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_gRPC-C++.xcframework.zip",
      checksum: "1efdaa7573f4efbabe94e761814caf094f6b1235afc365a4bc181e06c84bd8cc"
    ),
    .binaryTarget(
      name: "_gRPC-Core",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_gRPC-Core.xcframework.zip",
      checksum: "c46c9c363e6e14fca4997565a26f396319103d6330cfd4fd8c601592b2781dbf"
    ),
    .binaryTarget(
      name: "_leveldb-library",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_leveldb-library.xcframework.zip",
      checksum: "b01ae6b010e49391c4a2cf1c8e62a642cf30bd3696fe08c209c3113f5a924413"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.4.1/_nanopb.xcframework.zip",
      checksum: "0e5dd8e954cacd3e74a9bbbba9572fa402bab951e1acd8d6e140b3a5f11d3b47"
    )
  ]
)
    