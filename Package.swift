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
        "_FirebaseCoreDiagnostics",
        "_FirebaseCoreInternal",
        "_FirebaseInstallations",
        "_GoogleAppMeasurement",
        "_GoogleAppMeasurementIdentitySupport",
        "_GoogleDataTransport",
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
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_AppAuth.xcframework.zip",
      checksum: "c2b92604ecb78d33e7c4e9c92391dae6203b316592d4cd4b2496debc49f73ea2"
    ),
    .binaryTarget(
      name: "_BoringSSL-GRPC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_BoringSSL-GRPC.xcframework.zip",
      checksum: "0168dddd356fcbe11965ca911fff5e99328704a646726227e32a53951782c44e"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_FBLPromises.xcframework.zip",
      checksum: "d38242a43ca7380cfe570ff4d7989f1bc259e08359755ddcd0fec8d763ddd273"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_FirebaseABTesting.xcframework.zip",
      checksum: "032d3e713875e66d35eafe4d8e9d03183a8210d63845da1fc0de580c1f8600b1"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "a767adb50744249ac6fdd106f5e4802b7cb422366811ea60512fc553610986f5"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "0c605d42c47076bf5005d4bc3465fb74b0002c811fbde6c69b6dbfa3f794cfb4"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "81077bece87b46ae327d1e7b94e3220b4ef69cf0364e4676268c7425ee1b987b"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "8cfedc9be387255968436ca3b7f94e60c5f682fa29a53803347e20ef20837ed7"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "237b90c00ba63c2d512fc2934f113bfd1fb96c166d7c88dfba46e181f0ab1467"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "9a24b2fd6399e4feb98dfeb63d0dd192dc5890e0a655478e241e5914b2c48b95"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_FirebaseAuth.xcframework.zip",
      checksum: "5c49e29b456160131eca16e7df2bb81c8121075c3dd7cce0e3a59e611d4978b9"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "32c58b0250aba5626154e3aa2761ac7cf776fdc9f44eb3c981907bf48d0792b3"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_FirebaseCore.xcframework.zip",
      checksum: "210dbd53be518ff0327fbbb61f4be239ef279c9069efba32ad3dc89bb8b4519d"
    ),
    .binaryTarget(
      name: "_FirebaseCoreDiagnostics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_FirebaseCoreDiagnostics.xcframework.zip",
      checksum: "91981d4a7de3552cd2163370d42943a4f725b156dcca92e9d73d3b98bde5aa9c"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "85dc0238cf41c8b56fa886f9ec1a251777239d7371e2b4d2e996042d2146b6d6"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "e20577b3b477ee40255374ec7d3bb5c2a87211d888610c5e1ac0a32ae757163a"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "1f12596638965f0fd3e0159c8e01a35c73a13f28e6fbe58ab5a5658cab257c8d"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_FirebaseDatabase.xcframework.zip",
      checksum: "03d7ff0443ec5ac5ba09705d09c699c3398b5e6e5e67175d8dc26692429753a3"
    ),
    .binaryTarget(
      name: "_FirebaseDatabaseSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_FirebaseDatabaseSwift.xcframework.zip",
      checksum: "e372a7f8c3024dafae4f1c4be23b8ef5cf220181a3a6b600be7682b8d271967a"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "4aacd3eacecc0d8123ae0dd60299385234cb01a0c10506a784eaf2e231cc0d58"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_FirebaseFirestore.xcframework.zip",
      checksum: "666c7c08b3e30052eae9936d43bcab06fffbea66aeea08a84f60b692f99de417"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_FirebaseFirestoreSwift.xcframework.zip",
      checksum: "c0359deae49cd4542592a9da46d69ec11cc416e16f299669f104153da7b3cdb3"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_FirebaseFunctions.xcframework.zip",
      checksum: "052406a2616f7fabdcb71b7ddd73675bf112ff308d8d3f558a9b255e9ca3fa1c"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "c2ea1b9dec57a34d507ddc73a16716ce278d0167659654c56650c5bb5d0d90fb"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessagingSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "98d3145b79cc71fd6bda7c6756edfdea64f3c0e2dbe44b5f30f390369de09f68"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_FirebaseInstallations.xcframework.zip",
      checksum: "1821652697bb6bb2339c3b6f3fb34a7d17b9e3ada59d6080a3abb6869af4af4e"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "a3a59eb8ff9f30adaaebc6a9297febfe6c4537972e6097dfa79ec9991c744158"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_FirebaseMessaging.xcframework.zip",
      checksum: "7e184e84a07cba8d162690654169342410f5ec2c4b61380e05126db47af83163"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "d1762d6c3ecc91f0c79b9eb26bc26373630c196bc986ff8b9d1d4a02890d16b9"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_FirebasePerformance.xcframework.zip",
      checksum: "13baceb188a2ab13dfa21a37312eaa61ef1089a3dad3a87ef34e111965dab4e7"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "680f402821d32b6971ef42ae8c621a5571bbcc42f06a686b2dd8a9fe5a361639"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "c17146914ce0ae6ef7d91d1fadc654030e61b9c995259fc9d35fa83be721a87e"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "5660f522606e753f979e47bb1ccb95ba77035d1098584d716d4046559769e747"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_FirebaseStorage.xcframework.zip",
      checksum: "b6ed31459c52a63ca3efb5b4f7511b4643cea2ff9c36f59f55afa2bf68ae1b37"
    ),
    .binaryTarget(
      name: "_FirebaseStorageInternal",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_FirebaseStorageInternal.xcframework.zip",
      checksum: "5255ce3f541f17fbd04fead1ca4af4ece66478a2e45bfbc9dbf8deb50fe966fb"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_GTMAppAuth.xcframework.zip",
      checksum: "a7b8f6f715af34df88af87cc63216120b86d6d008dc4c836fda858a3bb8d315e"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "bfd3f03f6d8e316301406b778b9db4845b627bd65ebd83ef005880d7297003bd"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "edec48cca0097d4c7215c68339bfc87ee928f64be540ebe31d2059f0e9a3ea16"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "4aab966800395516467f9365e786fbfce660444271c45324c34a1ec70828a399"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "962f1789a29bef86998b35903c8f698f55355bc2487f592e0ab1503a003856fc"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_GoogleDataTransport.xcframework.zip",
      checksum: "35026b89b5942fe28e17c8a720615e14d2231c7d5897144fd14be931a7cfd986"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_GoogleMobileAds.xcframework.zip",
      checksum: "cf915382b7781dd1c24711b5e2072cf0c4679d77964f5083a98cd7e890c5a481"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_GoogleSignIn.xcframework.zip",
      checksum: "6ad70c9d152204b4298f58f3e4a232b4847dfd5b49e08d8a806c59608c07c7dd"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_GoogleUtilities.xcframework.zip",
      checksum: "d806832705a0a139347f1f83f1c9e25242982fc4ce52b34320062d05c0f05185"
    ),
    .binaryTarget(
      name: "_Libuv-gRPC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_Libuv-gRPC.xcframework.zip",
      checksum: "4bc30f291bd7a96ed6da95633bf0e961c9e25cd22c33dff87b962ce3121ce1b2"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_SwiftProtobuf.xcframework.zip",
      checksum: "ef02abec4ea79cd9b1f78fe5e4dfdfb5d8f558183225efa53abe6ee22a6e19ca"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "4dd1701cf5b48a09484be2695c09ad402f64e435a83fee584b93734251fb3c5c"
    ),
    .binaryTarget(
      name: "_abseil",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_abseil.xcframework.zip",
      checksum: "7ac57db3421506821a9925d99da732b0b83ea5a798fa1389d570ede45cc94dc6"
    ),
    .binaryTarget(
      name: "_gRPC-C++",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_gRPC-C++.xcframework.zip",
      checksum: "074ac52b1dbcafdab481c36a11fb325263796f16bf8850521b7c78670576bca8"
    ),
    .binaryTarget(
      name: "_gRPC-Core",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_gRPC-Core.xcframework.zip",
      checksum: "39027ede62a6d756915f2faaa2db424b9e1f3bc459f01896b84414a621221ab9"
    ),
    .binaryTarget(
      name: "_leveldb-library",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_leveldb-library.xcframework.zip",
      checksum: "d42a328954b807d7dad2ebe65aa837f3e70ed09a6840e44cb415a772cf158726"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/9.6.0/_nanopb.xcframework.zip",
      checksum: "b262a2f99ba1ec3a33c992b8b9cca3cee6f8d5ddba9294d60de8e3be574c3864"
    )
  ]
)
    