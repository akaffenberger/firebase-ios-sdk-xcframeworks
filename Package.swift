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
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_AppAuth.xcframework.zip",
      checksum: "5b5982e5e8a5450199ea29c8ea371739e6a903ce085616b05a65d2406629b892"
    ),
    .binaryTarget(
      name: "_BoringSSL-GRPC",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_BoringSSL-GRPC.xcframework.zip",
      checksum: "5afa1cb6cb0c17aee03b96b2b49ba4fa51ef7a915a07f4a1a942d1c9f58da221"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_FBLPromises.xcframework.zip",
      checksum: "9eeb94adef5c55ae473a3800770e9686e04d779d7d779dc4160cb21d60f81180"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_FirebaseABTesting.xcframework.zip",
      checksum: "0f998a53a6a2e8bd1e5c3fe3d7957851030056c90c37a849fa49acd989c196d6"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "7687f10e3bdc0054ef9dc42826617aab572a086052d4eb9d3f8cba88290cbf32"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "658937011475ef507593e69dd1c4928febdbc034fbc1b3f2e5ee2f3933ddcf45"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "0d9146d3f3d9b32453d586b75ea5620e69bcd62e98fc5f5accf12ce21ce9d494"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "06d141f45791d91d8670379f03afe3bc3b0aff832bbea11f289f5dc291902ba8"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "6d5f3207a7926d501cd0be11f56e5324ed3619bc4a904198cd454470d90451f6"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "3f72edb948157e4158d0a6682026209fd555eac8fad00c5492f50e07e18fdbbb"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_FirebaseAuth.xcframework.zip",
      checksum: "0e0a7ebe598f327cf4737f95893a927e38d2c6455e2f6298e33ab3430107f350"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "f10f3fad7f4a8fde35e90a29597af6801a28f6448893617b21102ddcd702db73"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_FirebaseCore.xcframework.zip",
      checksum: "0f2f35003d3075f0155f3c5951334e4baf26c002f5c21f0443ebba5bf295a8c0"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "a9073d98f1a1f1bdf350f13a9670f363588657014a84e206a4b1d2ffcbe289da"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "36c65ed09336d05171c9ac2f57218a8afbd1ee4546c05102e30cdfd13fcf5d27"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "3d6dfc78887e47ce73c9a17a8d356c5d6619fa4b7f5381c4f75af693795c3268"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_FirebaseDatabase.xcframework.zip",
      checksum: "b9b2119b2d32828c0b7630f30403d89fde93d8dfe37fd8bbd8d210b13c26f3df"
    ),
    .binaryTarget(
      name: "_FirebaseDatabaseSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_FirebaseDatabaseSwift.xcframework.zip",
      checksum: "76bea117d20eeedb8b9a41ffe24f7ef028f1bc7f57a4ad7bcdc37256b1772a65"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "b99e37636e5490cae5bda57901363fec4be792ca7255756a51e51e13110ad91c"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_FirebaseFirestore.xcframework.zip",
      checksum: "53b1994a664557c52b7d6aa30d93c01d2a367546ada69fa3371dc98fb082c756"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_FirebaseFirestoreSwift.xcframework.zip",
      checksum: "e5ffdb95b0836aa0560b517b59fd53966f92e2f7784290dc60be3ad3520252c1"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_FirebaseFunctions.xcframework.zip",
      checksum: "ee3ea803459f47c8b854ec675d1ec3dd35c390d1d748b33de4be37112e80495c"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "0effc5682c637978ec05a36042a5533492fe8cece83b6f177ade58ead551f38a"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessagingSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "5076f5104e46c376173a240f0f4fb4a37285a85322ce9f3d6d2b0bf0f4d59221"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_FirebaseInstallations.xcframework.zip",
      checksum: "848abb6f1f78fce6fd6e9d668429c616cb461df3890adbbbdde4449b57374e1c"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "c64a1beb8d57292a9cc2e0bed4973732ba9b76af16608e8cca15a9f5b69338b5"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_FirebaseMessaging.xcframework.zip",
      checksum: "7a6bc7f9bda8d35ef9021efbc3a5104f166d43cbc6aec935015f7ec62bc490ba"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "b15be2c7e585d2a6fcd499400555f59f25702d0d8f159828371ff8608ddccc59"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_FirebasePerformance.xcframework.zip",
      checksum: "fa7ed9f7f9cb9b246967c26bfdffc4807b57f5ed1446d95e962a54a7b8f3fbbd"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "954518217b7eb467962dc6c210cf6ab929f614874387a112d29d9a5f054c1efb"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "ea50c2a1c26b53d50a7a883270afbc1dca5ed8bf920282285b73d193a7bb9799"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "73ef71377dfd5fcdd95320c0f9e8e72d3874c4c74898e260f4140bdedda3a92c"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_FirebaseStorage.xcframework.zip",
      checksum: "e93ced1d1c978c02c9bbc7236074678adf21e1f39d12ea1909b4cdd2bf66a9d6"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_GTMAppAuth.xcframework.zip",
      checksum: "ff29afc3f9071999fafbf580266c24d74cae9bc6f7e42229689353895b095034"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "74e19bdf2a7a4df1089c38dc3b053f31e392509145d7d274d0954a8629710d75"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "66f40dbe47395c8eccbd3801cfbeab50fadf6421c1dd9fba6c1f74ce12d62cb3"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "76586d324a788a4ee6e5d19186cc99fc3109ca74ab7928a15e511f725cc62795"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "2a812d57782534384b379286430efcfb9fe7da142a6cdbdaa07d8efb0fe580ef"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_GoogleDataTransport.xcframework.zip",
      checksum: "46d17805bb2dc3783169cafefcbb86dc0bb636f2f98a5e1164495f5011a43f2b"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_GoogleMobileAds.xcframework.zip",
      checksum: "005e42a34d3c16dc23cf7d6260b4e44837d94c8113aa646debe1a407ce5a132d"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_GoogleSignIn.xcframework.zip",
      checksum: "04b9077b21decd71b535d08aa766673c61312ba7fba4ee8d98ce4233e1222f0d"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_GoogleUtilities.xcframework.zip",
      checksum: "2ede4b862b95955d8480970bc9c32d01b393c8db25fdca2b1343ab203cea5bc6"
    ),
    .binaryTarget(
      name: "_Libuv-gRPC",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_Libuv-gRPC.xcframework.zip",
      checksum: "78c2b74d55af9afe99fc93ff2dce4e2f385078a7bba31a53c6048d9fc4db80bf"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_SwiftProtobuf.xcframework.zip",
      checksum: "ca5af3e451d7d00ea51ffa298aefc137aa438386b64ec54fb4f5294e7a2e30a2"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "89553945e1ccef79a59a5cd3a47d290b23a0bd12c68fa2da79b11ed038262c2f"
    ),
    .binaryTarget(
      name: "_abseil",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_abseil.xcframework.zip",
      checksum: "ff46684827ab2b7f1726a5baee1f30e5e23abd6c80c6197458f1a4808b0ba852"
    ),
    .binaryTarget(
      name: "_gRPC-C++",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_gRPC-C++.xcframework.zip",
      checksum: "0e388c3257f4f08930a5e14172a76245e52e8dc8d1c5307f52c18caec2d30485"
    ),
    .binaryTarget(
      name: "_gRPC-Core",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_gRPC-Core.xcframework.zip",
      checksum: "3326d314374436d2f280282c4a5253c49bbe6b25ee213279330a69412a042b03"
    ),
    .binaryTarget(
      name: "_leveldb-library",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_leveldb-library.xcframework.zip",
      checksum: "0698fb8ef229b1206ad31f866221ac93cc93132018912499febb740c774abcc1"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.1.0/_nanopb.xcframework.zip",
      checksum: "78a808502b46e99bd8ff41af2b8b2944b5ee40dc6508aa513779c86bae428268"
    )
  ]
)
    