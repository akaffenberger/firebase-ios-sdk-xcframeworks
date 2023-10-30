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
        "_FirebaseAppCheckInterop",
        "_FirebaseCoreExtension",
        "_FirebaseFirestore",
        "_FirebaseFirestoreInternal",
        "_FirebaseFirestoreSwift",
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
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_AppAuth.xcframework.zip",
      checksum: "10f8e19dbee115306045893a4d79be2d2b13d8773e276977b341bd6edc4086b1"
    ),
    .binaryTarget(
      name: "_BoringSSL-GRPC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_BoringSSL-GRPC.xcframework.zip",
      checksum: "aca53a8219a67207f3fc9130f8fe9d95ee4f1a5b046cc7222d3bc0c33534c4bb"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_FBLPromises.xcframework.zip",
      checksum: "6ab5c4315a35f28fd52e2a3032c507fe64199659266e297909715119e6498c2b"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_FirebaseABTesting.xcframework.zip",
      checksum: "91955f079e7458dc9a21ae3182036eefe993a4d8d78397ced148648c4e2113f8"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "2071e1cc5b42dd8c6ce1f53807bf2dbc3f587d75c09e5955920a73fe75f0e3d8"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "134af8cec37b764c16aa8047ae5ba7093aab795e0830d0d75a927d2369c7507c"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "8a0afa832eef0ece118dbb73446eb58c9f324a9ac19cacac41ff6084d7c1ecca"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "568e2c7d45ded4d6e27d08f109c99d999aca9d8cee7f9a9feb5469a314ef5ee8"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "eddfae1ae6392c9c540cb3dd9d25eae6022dcc5f1931033165d2b5a723cdd437"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "3495243c8f9ba48af6f4eb4498bbd87409c3a11278e587104c54e3d6c755409e"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_FirebaseAuth.xcframework.zip",
      checksum: "a0d87ce728795192b789849cae58a6c58ce42eb40ade25ed534cb973f96cf782"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "5285286b4d39346f7da6e57533dc4c579c5846101ad68cb8c31a2ec4622881bb"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_FirebaseCore.xcframework.zip",
      checksum: "e1a499015152d00f7602e275b4b73f2a3256863040f9ca2378af6ad9021323a7"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "9cd097794c6a6d48e7b9d780ea37225ffa3c0cbb26a85791b9931ec06221f259"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "053cbbc6708d2cb386f7866819ee1ef02a683e6b90efeb48c61250eccc6caa8a"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "30fa78e99237a43a9e826fa0acfe8eb390af0634612deddc2a0cf4f4b4a5366c"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_FirebaseDatabase.xcframework.zip",
      checksum: "3ac9d42fd95dd16f8b37da13be1c363e584bcddba1572e34ef27d95fb033e75e"
    ),
    .binaryTarget(
      name: "_FirebaseDatabaseSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_FirebaseDatabaseSwift.xcframework.zip",
      checksum: "84c4694d9c42331e1ac726f32e8c5cfff2595207eb3f3e90fafe1939e2317ad2"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "a80957739716f7f8ba9b129f363c51845e6f2e247dfbb110f0c182c37caa0c0e"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_FirebaseFirestore.xcframework.zip",
      checksum: "a2cf60cf0762fba92c46367432bb0ba78f2e64ca622ef2e4f782a9f12cc886f0"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_FirebaseFirestoreInternal.xcframework.zip",
      checksum: "8d2f3fdae2897b160ab5d8e948f526455f8cfab6284ad4b02906451698f92313"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_FirebaseFirestoreSwift.xcframework.zip",
      checksum: "c8f5081cbe6592677726179177ed0b5f85da4a4f9676934dba54fd663d96cc40"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_FirebaseFunctions.xcframework.zip",
      checksum: "b0604f8f22ad90231dce2e818270faa5cac6eb99f56e637dc951e22f54d5d268"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "2a6621449415d2eae72f03e23cb5d665090b8e28f1073851ee9d4459951a6553"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessagingSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "538de62685cba756a4d45028f322e4cb1eea97c3636efadfedfe69fb090eb642"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_FirebaseInstallations.xcframework.zip",
      checksum: "1487add4087f59210b2061526014e646cf369bbd23530244831ac54b35a92447"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "537b8f6d1d5143a782d8fdf012d1b731839b82337a27ecfe40164ae703557f49"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_FirebaseMessaging.xcframework.zip",
      checksum: "0be146237ebf5a7bb89fa737553197ba1d1146168e18b09e91f5d7dd1eaed7eb"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "5e49bfd709b4d3536089a53b5e707eb3f563d23f946bb6e742484835e0805604"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_FirebasePerformance.xcframework.zip",
      checksum: "bc4d78e193dafb4c16fb23704b7f5be5430e186e4e1d9aeb8f035cfee22e8615"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "853bef23901ad79472372df66c4e9213117a1bd8e056270e88f003f2f6df23bc"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "37bea34b65f5e32add888fe787993d17964fb0f72fcc5fbcda63c1a1887e43a8"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_FirebaseSessions.xcframework.zip",
      checksum: "f479bac4d3539b4c7eb78b756b29b9ace52f70ab76447adc0b963be5e5b5d3d8"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "1269f9f9d5985ff35dc31d25f79c40e3fe43348a0a057008b67e4fcca88cd76a"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_FirebaseStorage.xcframework.zip",
      checksum: "39e3e3cdba15ad7ed35573b018ae37ac2c079f778ad84030c35870a93b9f7c21"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_GTMAppAuth.xcframework.zip",
      checksum: "133755c722af136ae52a7c5bbbfb8f6e30f0aeb69607fd05e307ecf9cddb1f17"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "379a86f6a4b702f999e9073eec38313d9f18148ce442b651bde879377ea53d7b"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "8bced3c70d10b143c2e141572d7e0d2e4d854de0b0b4cc735dee384b8a5d08ef"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "ed265ad52b344bb19cb0725e55b9d21f3f80541086b8fcfca0a799f313a174d7"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "d33a90129c8870bcbd27c8ce0052f03275b029f14fd082d18ded138b8074f305"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_GoogleDataTransport.xcframework.zip",
      checksum: "4bd55691142027ac20161190ee567675af422b9455c17b834e0b94f2389057b1"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_GoogleMobileAds.xcframework.zip",
      checksum: "716f68fb4bbcb7903393fec497796c6abff27af2b7054aadd8ee27aab79a3275"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_GoogleSignIn.xcframework.zip",
      checksum: "b6dd09a1db2b815ffcc0eae0b69161fafdbf7c4f90709775288aec8ef434d06a"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_GoogleUtilities.xcframework.zip",
      checksum: "a0d8d4d6c3a2aab9b889c728eb1a2d5a2c0380f5d9954f80bb37a2f668bb90c0"
    ),
    .binaryTarget(
      name: "_PromisesSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_PromisesSwift.xcframework.zip",
      checksum: "f856c7929a7074b87c7fd69a16ed7e93d13d7b39c0352badf460209057d86df5"
    ),
    .binaryTarget(
      name: "_RecaptchaInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_RecaptchaInterop.xcframework.zip",
      checksum: "bc29453335d3bbca0079de7573a37ed5100f4ee1876065af089731980167b54c"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_SwiftProtobuf.xcframework.zip",
      checksum: "d56fa5b84789be47c92f19d1f83414c56a3a6f3ad9440bd5435ed4eaa8e02970"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "ffe13d7a398e68c5d5f1ae89eba5114d463de0fdaac14a527b7aca1758e35994"
    ),
    .binaryTarget(
      name: "_abseil",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_abseil.xcframework.zip",
      checksum: "b376ffa58de6f17e5a90216562db11666c2aa8cc4c23c5ae8cfa9d5bf10a2100"
    ),
    .binaryTarget(
      name: "_gRPC-C++",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_gRPC-C++.xcframework.zip",
      checksum: "f3fbf965fed99d57c10b9c4ba5642b904d008a2def9a6ad838456fc86612cc0f"
    ),
    .binaryTarget(
      name: "_gRPC-Core",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_gRPC-Core.xcframework.zip",
      checksum: "2b22ce20bc86a452740d6ada71e468d554554bc659a1d8d1c534f7f820acf77a"
    ),
    .binaryTarget(
      name: "_leveldb-library",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_leveldb-library.xcframework.zip",
      checksum: "ba3217c7f3dcac7334d7075f03c894820115c56c0c1cd7a6bab04e52c463d6fd"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.17.0/_nanopb.xcframework.zip",
      checksum: "565453a517d05b75239223fd580ccb3f987c25c95df8c861bb4e65ea11645d33"
    )
  ]
)
    