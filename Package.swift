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
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_AppAuth.xcframework.zip",
      checksum: "1fa589f690a74d044bd7cde9b3a897c2dd36ab8e27d45ed98ee5321a876f6608"
    ),
    .binaryTarget(
      name: "_BoringSSL-GRPC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_BoringSSL-GRPC.xcframework.zip",
      checksum: "f2c358f770de2d92df87d9758f621e46cb84034f04cc53e03ae36de2130a77dd"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_FBLPromises.xcframework.zip",
      checksum: "91a845c3071ac7c614e9042f72e247c4c2f0e2fc46c23e6712e1ddb3fffd9f9a"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_FirebaseABTesting.xcframework.zip",
      checksum: "009a19982e1a5ab7c5b92256287087678dd5f8d1db4a5420897dd9cbfe2673ca"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "a4294ae0a627f96729a9ec41ee7d31961d5d1c45756f8a5cb414df83f54ba3ed"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "2cacbeb6ad50a2f0db25fea57506030838e7f1ff83c922f0e238b8872fef45da"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "eb54abbc77211dccaae3c001aea0d9f162fdbffdd4f999d41951b3c72faff9b8"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "af61d0c4f76a2c95254671c623d8f7161e1b1976dd21e113255d224c28d85973"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "63fd5bc3eb2d885af00b172875580485ff54e625bb8ce62c7896d37430204105"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "07c161ebece30804d44ac18f736931c58bf4f5f522eaebd9fd7834d11a8d566f"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_FirebaseAuth.xcframework.zip",
      checksum: "286d7c4273c214fee908737bd5a3f330f92cb4d8511df2f1487eb1a898b4ae72"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "94dba8d25939558e1bd6e8803765223c6b0a459f7fa8aabe112a2fb784a457d0"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_FirebaseCore.xcframework.zip",
      checksum: "2cbc610a619ef6ebe758492728ee885b59b4f33b208f3eff0b0ae663f8373ca9"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "ba0e9165479626671205860b62b607a0f0c0c578dd0d64fc2830738eb69b3c0a"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "4cb192d1f665111f479f1de2fd1324d762ecc7dc9263366f12a1378d16fedab9"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "16ad7e33bba9e50ab7309f3b11a5c11d2110f52ca29c91b3c61018441c525c32"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_FirebaseDatabase.xcframework.zip",
      checksum: "42e7db339b83fc4e01cd50f6ac877f5804844b6f98dd102edf4bde669cfa6b91"
    ),
    .binaryTarget(
      name: "_FirebaseDatabaseSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_FirebaseDatabaseSwift.xcframework.zip",
      checksum: "1454d975db9761984dec2d95255f6b1c38f12c2eca55ceed566c6e5d8fa19e12"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "271b1fa06179106f3a7541790a176d799f5c86ff6d00d676add53064334bf228"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_FirebaseFirestore.xcframework.zip",
      checksum: "b33cd46aea9e6a675619aeb63e048cdbcad7c7ae265e2f6f272b36d437e88d0d"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_FirebaseFirestoreSwift.xcframework.zip",
      checksum: "b3d6cf87cef0993435441a42ca7631ff7a79bc31c237aa306ac3ae5ee051690f"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_FirebaseFunctions.xcframework.zip",
      checksum: "31da446d1325937a0231217663122fe359b2d8b42676f21eb33201dfc350d598"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "a5438dbfa607c0f83928214d15638629667a438792a3b602e0d52326a3a2d389"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessagingSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "3fca8ab15f527d9db28a9975f98cd45231291c52936f2a5f7554d5c116cb9e88"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_FirebaseInstallations.xcframework.zip",
      checksum: "da48b17c5c1b7dfbb0e281cead9b56e473b515a471288dc20ab1209f36781803"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "8435e7cabf6be75cd2f8c7b87d56cad8966cd926faeabe16c4f35f4e182e9754"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_FirebaseMessaging.xcframework.zip",
      checksum: "9288ddd0dbb18f429a957e01fb0108c57ae97ecd1ada04365029d6cb98691311"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "fa50f3d72712fc782234b6f07799823d902e6d6c4df1bf48515b12be6e1334c9"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_FirebasePerformance.xcframework.zip",
      checksum: "00e4d840880f23950a1e4524e6829619c7cea71ca0b2ce9f3d88a8d223183f11"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "073e529c4e9c7132a7a2f303ab92c5228bd1b2268e548373bdf0ceb7762d9b33"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "3b5b92f240ee8d1f6e01b6f1cd0471fa33bdb11cf7c2f51618b3577be0169666"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_FirebaseSessions.xcframework.zip",
      checksum: "bd280e8a34b366c7048459be012469b725884bd230f5424771dc639829be9052"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "5c590679356517ab4c3ec096352a41d17f5e250bb3c2b0f845bd06ae90a40903"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_FirebaseStorage.xcframework.zip",
      checksum: "d595a5608d7283089e227af49091a40d2287a23c7a8a0bd424198f7c094c85e9"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_GTMAppAuth.xcframework.zip",
      checksum: "72c77cd35c369b17c66d85ed9e24b23cf0c26e216aca31e601450f8f95385495"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "59545ef0b76e8051b3c7f3316e1264209ceb0c4f526020a09c124a0f57813d74"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "52f35c3e9d1d51c431ba63eb73b6025c085ab6939bb4a3f41566de144a7c6366"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "199a2de9bface2573b821547687706e2153db3826c4aaa5de02f90311022ecac"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "52c905116720a73c5ba4166607ff459dada322640d372a28382166160f82112d"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_GoogleDataTransport.xcframework.zip",
      checksum: "33137458534924f22e50523a6cca67775c5e0fa1f8ac1de4963e65daa519844c"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_GoogleMobileAds.xcframework.zip",
      checksum: "c4af7c7d11dfd658ad8a9b2d0c0abb549679b0fbcf03c1991438299a5c67cc94"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_GoogleSignIn.xcframework.zip",
      checksum: "f4fb807ed7181c3ba202959e638ba7f3ef596f6376ed980af668733b31b1d492"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_GoogleUtilities.xcframework.zip",
      checksum: "afc511d01ef0be8b3c9b4923e4e3efea14fa77cd95ba955c163b795566399718"
    ),
    .binaryTarget(
      name: "_PromisesSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_PromisesSwift.xcframework.zip",
      checksum: "15a0e0d7054ac669e27d1765122669e16ebdbf2c70da8158292637375a754121"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_SwiftProtobuf.xcframework.zip",
      checksum: "76756b76f6af8ca92a2ee3a2346a506a7a9afcc2d6b61426dc198f4182cd82d7"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "a9d788ef7539a26833ec0b1adbb1565393a52b202dd8dd36f6e8bdea2e2f0ab4"
    ),
    .binaryTarget(
      name: "_abseil",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_abseil.xcframework.zip",
      checksum: "937ce5f4be6c885d1e66d22537b98887d3be45302c7f0f2b506a259bf71e3c9d"
    ),
    .binaryTarget(
      name: "_gRPC-C++",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_gRPC-C++.xcframework.zip",
      checksum: "a23945e461b520ce3f4ea4a5141f71a19fa19858869149c12ab60bc485320bcb"
    ),
    .binaryTarget(
      name: "_gRPC-Core",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_gRPC-Core.xcframework.zip",
      checksum: "7f033822855752f49ac49a5b1d4829ecb2470c484aa370b2a15509836b595485"
    ),
    .binaryTarget(
      name: "_leveldb-library",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_leveldb-library.xcframework.zip",
      checksum: "1c954dc415d9d7e5e570c0ade44ee763513838ed7146cb2045d5570fb098b1cf"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/10.11.0/_nanopb.xcframework.zip",
      checksum: "2ee82e3e50512a47f8ae3687239d53a06618d04ed78c5cdfbfc521554b061cbf"
    )
  ]
)
    