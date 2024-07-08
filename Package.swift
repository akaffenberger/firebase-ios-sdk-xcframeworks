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
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_AppAuth.xcframework.zip",
      checksum: "18da7ddd3d766a8c9e237c46b03ecc613cb0a83b1ac175e054dfd3f096e2c081"
    ),
    .binaryTarget(
      name: "_AppCheckCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_AppCheckCore.xcframework.zip",
      checksum: "51fee9ce75bd241c8e84dbe605fe6e639490fa799bce681deda5e486c658a05e"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FBLPromises.xcframework.zip",
      checksum: "0b3e13b490c8657f8bb8c288ddd5f37b7f8a4accc1db06902dd5aed6cf4218dc"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseABTesting.xcframework.zip",
      checksum: "45b47f5582327f902fc45b26b1e5385a1fd9010bc7833daa0ac56ce2792b8b2e"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "d773e084a3c8841d8d83c324b994ba5aefd688bcfffb376d576be514459699eb"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "4d843bbda376e798ff5be6c4785eba89d954b9c3761baadf11cbe374825078d6"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "5ad32fc6bcdd0a06db15fffbcfd21be35d6d3f3aec4f70e6874d6b51c3b6d623"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "71cd1f6915464787a069e7967ef123670252a89b31404dce19e60c0cfbb4339a"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "4763deb3e05dc7a5fa836d7bdfbcaef5aedaf065c3e0211871ed416e2fcdeeaa"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseAuth.xcframework.zip",
      checksum: "2dcb9344631b1f079324325328191961d0e9060c616d4aa49deb9d112d03b274"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "d887c35c0872daadd5116e762453c9885c66bc352cd791e8ea0b9ce482ab6d47"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseCore.xcframework.zip",
      checksum: "5e36153f7e6d750168e48f774bced692fb90e047513a79791579e28e7bf062ad"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "a60344b9ee3943e875be93614c47593ddf50e69609aa8df21c07d42df634a889"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "f74bfef992ad39c60cc0804d916ed788eb86e0c894eb163c61f6a1c0aa5ddc84"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "18ce1aaac697e8f161c3319c906e484687003673d45bbe94b249256114994953"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseDatabase.xcframework.zip",
      checksum: "0881308bc069540c4cac4f78c189a11fa03d2f3a67960dcbf200e01a42365680"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "2af5a576cadc7a4bfc07e2be80cfda7498b1c1d7b342bd0595e53c280cb6b697"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseFirestore.xcframework.zip",
      checksum: "6a1ec3174fca11cc2f017acfe5ea35263b7659deafb00e5e43f375bf8bc8c3dc"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "c2557c3d2f35bb11bddf1d96374700cd2ae2c87a6794fe58431066574a3be7c6"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseFunctions.xcframework.zip",
      checksum: "0fdc9fadde2f0b6997c21ca37335a07f247c6148f8eacea1a58cacd0230adae8"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "00e3a426556d75e49fd3c730c5ae8e72c23fb64104cdca28a181a71e1302f5cb"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseInstallations.xcframework.zip",
      checksum: "884132a22b737600c15aec7d85ef6f4727c9f11fab2fc73d2d82ca26ad24b629"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "868e0ab667241e1ac7565b6e747f382e00b057e166c47d695e9ee9df5c2a82ba"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseMessaging.xcframework.zip",
      checksum: "ce1c082127cb12ff36402609fbb77687c7630339ff89aab500a6789a6a784bad"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "7bcf5780f5d361669c60d26c1a5f444b1d9fd1f57fcd9640ad1bbc997e9311b2"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebasePerformance.xcframework.zip",
      checksum: "a4ffa78b1c337c89e9a9dd34707f18c7d536c17491b112015270b65ecab4389c"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "5c112c80e61e9a74e386dcd42ce28e136c5e04d1284bf7ee7f9fe9535a337118"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseRemoteConfigInterop.xcframework.zip",
      checksum: "fb386282ab25cb143156da9daabe2e1ab7cb3c519d9d61a555303b4cdd23ea33"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseSessions.xcframework.zip",
      checksum: "e942b5d6e3fad62c025e2eb07323cb35272b4e48c1998eb011d006d7468b3e17"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "821ae088c02fff39228d0bff01c63eed756612f261655e596c397423570e9e21"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_FirebaseStorage.xcframework.zip",
      checksum: "3c2bdfe167011c013dadd9b02e4344882ea03ef9d06030a82bab640300d8d8b4"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_GTMAppAuth.xcframework.zip",
      checksum: "c93cb808a8421b8a8d309faccae5ee4c0202b0eae922c1ad4ee387e5d6a5d9f6"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "5a1334ea1441084cf042f36c8628f9265a37f48330afc31597536f8a4d387f8d"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "5d26944420db550d725643fe9b7e53392bdbc7289b168ea495e05531178d3f06"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "69541f33f8d5c5d6e04517cb8ec181358487622c66148b117e0c7c061a305487"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "b9bddb77b834f4cf2583199ca170153378d4c7d469ee47f4f36a80713863489b"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_GoogleDataTransport.xcframework.zip",
      checksum: "d0e4b0971e120e8117e2bde31f2f998ffe29b0a119451c7b613d10834a66b4d8"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_GoogleMobileAds.xcframework.zip",
      checksum: "4207160c677ac2cdf191aa12923247b2b6a93b6e3d4e50c804c36526d434e24a"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_GoogleSignIn.xcframework.zip",
      checksum: "f5e0068112d83f03ae6ef83037e75b79a71973bf5fb0890d04bf5ab3a8b3d133"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_GoogleUtilities.xcframework.zip",
      checksum: "d72d80e0fc413d1d805dd50011e5b31b651bc0749ce949de493dc4004623e2fa"
    ),
    .binaryTarget(
      name: "_Promises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_Promises.xcframework.zip",
      checksum: "ee622c25c116637ba16fe4771b7837f12c9bedbafff4e6bc45f6d568b4e72a6f"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_RecaptchaInterop.xcframework.zip",
      checksum: "a6ef13416ce7adc14788d15c104de44b82dfac5338553294dcaa1fc493cb8c2b"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_SwiftProtobuf.xcframework.zip",
      checksum: "9bdf0a8ea91c86e5875cca7adf5d04b41023dc34547ce068ce4e7b27915263c8"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "06fa9ef321bce6ae7a0fa5e852fd92246c8bd0612cae5ce39fd1d4f9ae79ca33"
    ),
    .binaryTarget(
      name: "_absl",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_absl.xcframework.zip",
      checksum: "8ddfaecf27ecaf7a6b383e801ac991fa058e1e44c7f2a5916ea2a721616c1e20"
    ),
    .binaryTarget(
      name: "_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_grpc.xcframework.zip",
      checksum: "12cac73375e351ca027d7b8b7131e064844de4ccd6b76e4d4466ea140bd71b32"
    ),
    .binaryTarget(
      name: "_grpcpp",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_grpcpp.xcframework.zip",
      checksum: "2c5bf86bbfda727843e3635ce2c8984413b44b2cf1e13b1bb394156fe9607505"
    ),
    .binaryTarget(
      name: "_leveldb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_leveldb.xcframework.zip",
      checksum: "bc7a48e1fa76585a031578cf90e4ba759cfec78735bcdcccbe10c2778246c623"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_nanopb.xcframework.zip",
      checksum: "52a402b8ea50c10baf69dcabf021aab03ab2b0c70d20ea1e7845156450d51dbd"
    ),
    .binaryTarget(
      name: "_openssl_grpc",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.29.0/_openssl_grpc.xcframework.zip",
      checksum: "2b10a658709fce7eae4bf6a26ca6abeffaaa90bfcba0358fce56edf7cb2d997e"
    )
  ]
)
    