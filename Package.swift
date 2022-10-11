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
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_AppAuth.xcframework.zip",
      checksum: "09e3331dc69bdf8354f800baa036faa2f4d5ee971ce8508b45476bdb58b88516"
    ),
    .binaryTarget(
      name: "_BoringSSL-GRPC",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_BoringSSL-GRPC.xcframework.zip",
      checksum: "2e67a6bb19ed1b484a09fa26f5563b25cc71d50a71beaf9ef1956abae8d138ac"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_FBLPromises.xcframework.zip",
      checksum: "2c840bade85665b95980efdc542933ff300c1ebe6c62ea249ac63562c1334da3"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_FirebaseABTesting.xcframework.zip",
      checksum: "c835e5d3eeb7451963e9e00154e8285e8046a38257ec79f4c408513b78f856e2"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "397972e3f9f84379e105fb3abeff7d9d5a8ef49f46b9d330af020cda781f501a"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "90126dd821d5feca56a71fe17f19abbfcc7d30d091d291176281cbb84550ebb0"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "f4166146f872983bbf0457d2b5704c5681a682b250e717572893f1c7b9a85f31"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "8e013ad6006b03d77099f258d25802d884cefbf8a44b7b867f13433c474e00ea"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "a34809447a514543bc8f9617de13b3666533be432a31651e7a044d604a3eafb2"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "003420deecf46642fa5a16ec9a44b96baf57affc3deaa8ff70e67058126371d8"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_FirebaseAuth.xcframework.zip",
      checksum: "20c5e5ea987dcf3ec53784f166fc002d436039d7316a2f18c17547b73db5b73d"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "6d3b6b7e368684805bfebcc791f497d47e26cbbadd3c5e5f406fdd214555af83"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_FirebaseCore.xcframework.zip",
      checksum: "1bb8ac7de6c545c1988291231778c7a197c1966cd2c3b2ea13f14923583e9ccc"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "58e34e7745f988fb73353cbf6d34393d3b23b93dcece64d7db6b0f9b460e1591"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "b4abaa860aeba203c3fa01f55d5ca6f868534382036842a031f4bc77940fc5e1"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "70c8c166497381ac3c140454c198b71060172548254d32d9dfd1995bc48d9ac7"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_FirebaseDatabase.xcframework.zip",
      checksum: "882f8d906a909f5aec37e96b359f733e3898f09098de48f9a404930f46cba67e"
    ),
    .binaryTarget(
      name: "_FirebaseDatabaseSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_FirebaseDatabaseSwift.xcframework.zip",
      checksum: "7afceea012bb84a2ce196f20ddd81a9415f156408299f9fafbb9efc20e8bd3ab"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "f44d1be41c595ea6aec19aae172543b7a13c1008eca5d57991f7349b8ecdcd0e"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_FirebaseFirestore.xcframework.zip",
      checksum: "72c68cf68f154e50f398d18682eb88efa5ca526c1dfddc51a6942a68740822d8"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_FirebaseFirestoreSwift.xcframework.zip",
      checksum: "ba2330a6751ab4f574269d34c72d3e4d66716c229a9b7e915b3260454b51fb2a"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_FirebaseFunctions.xcframework.zip",
      checksum: "9bc850476ef3456fbc5fc2413714851fb14c17de5bbfc25fe55caced767b9d5d"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "8b3a080884238829d4d51e336bdbeef0925a4d6072623212749a6429412545f7"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessagingSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "6579e1ff062456fd0026f3f6da788a623281ea5b7f263b9bdfcbaabbac17136c"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_FirebaseInstallations.xcframework.zip",
      checksum: "907123c1fe09a9ff46bc83a47028d8b538b7806bfa9ccf555ad3fc660fc41151"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "5f9b7cd4c86173e19bf4a06d05ab2484c1dae1bddcb93deb745fa6731e058492"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_FirebaseMessaging.xcframework.zip",
      checksum: "20a134693cf66b3aaf58e7b9b55c85b38a17fbcf54d2588995577ffbd1c34a2a"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "eda27786747f9e77cd7ed3785350adb17ad16a82b58ecfd401f0ef69c4b1699c"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_FirebasePerformance.xcframework.zip",
      checksum: "673ac5078ddebd86311684b2ad0c59a812ec3d6c7e73ae992fb50b8343a2c8bf"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "50515627d7c32629b46f15fc5eb24124bf02ff8d8afb1c9c883472256a4807d3"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "c4d29bf32705ddc2ac1d1a3062729a53a2753e00d79bca1815759c8833aa766c"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "d886a6efdde2e136945ccffd939dd0432302bd6ef8a9ce041758060525ff5825"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_FirebaseStorage.xcframework.zip",
      checksum: "4306ec0422e9be24871bc07a50035e7aa660e6bdd7e3066a9d25b3d4792de9af"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_GTMAppAuth.xcframework.zip",
      checksum: "95b651e1e92e65d86e939693faa1c28e34c966dd478981e6fc35e12ea8e2af16"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "9bd2e99a0291fcd2d5ff748291e10e593fa4b39228dba60859c7987183cdb50b"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "376eb7792b2a11f25fa46e1d0fab11339d82fd5d0d9c15ef6c01c31f8bdb06b7"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "ed00decf3b42fb9427c81ab4c964e6293455985ed31c6530826c87163bce8058"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "f7804e6429574cbc565ae924de2a6e126dbf09dbf92f816dc11f7672962a4b4d"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_GoogleDataTransport.xcframework.zip",
      checksum: "f2da3136325243e38f13fbaffc7e72a5d6566c205dee10ee0672f45de8338f11"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_GoogleMobileAds.xcframework.zip",
      checksum: "3ba9616bfbc656304bfaff49a13adb8d585b068a8742209ce84e87cb6dd900c7"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_GoogleSignIn.xcframework.zip",
      checksum: "f6c8b54f8a2290724e8492f1eeed0492bf0594b732f512820d65036580b4ac2b"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_GoogleUtilities.xcframework.zip",
      checksum: "f72680d24ec1c6c1e83a0a2ba9667ad2de136d951d05af0dc2d2fa377896a07f"
    ),
    .binaryTarget(
      name: "_Libuv-gRPC",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_Libuv-gRPC.xcframework.zip",
      checksum: "43c35623cbf4d3eff778bd55ecc7624d98656438fa76d821077a19313e26fe30"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_SwiftProtobuf.xcframework.zip",
      checksum: "e90f07a4d23997eeb5ec742b8cd755cfe0a9ab5f5ff0c7edd618fc459472036b"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "446638296847be1365bae76ef5b3db9c8dd94db4cb1d4d60805d3cfb0582cacb"
    ),
    .binaryTarget(
      name: "_abseil",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_abseil.xcframework.zip",
      checksum: "52f135fc7a60f8baa6e156c5f8171fd1656abe9af51e1c36714ca3d8f846d994"
    ),
    .binaryTarget(
      name: "_gRPC-C++",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_gRPC-C++.xcframework.zip",
      checksum: "56cb999953a7575b5651eb2e04926ea6dfd8f0b9881748bd93f144b8ae8f2599"
    ),
    .binaryTarget(
      name: "_gRPC-Core",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_gRPC-Core.xcframework.zip",
      checksum: "4593031580926f73e71587cd7684ff77d8ef1a815ee4a8f88246e4885b988189"
    ),
    .binaryTarget(
      name: "_leveldb-library",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_leveldb-library.xcframework.zip",
      checksum: "ffa13bdbaec96b28d2f2688846f469569c6c02a86e9fb622280d88da3535368a"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/afresh-technologies/firebase-ios-sdk-xcframeworks/releases/download/10.0.0/_nanopb.xcframework.zip",
      checksum: "500c49a973953536bf50e78735d5f5c7750933ab96310bc0d93d433fdcfd3d58"
    )
  ]
)
    