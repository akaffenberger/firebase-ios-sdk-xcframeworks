// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Firebase",
  platforms: [.iOS(.v11), .macOS(.v10_12), .tvOS(.v12), .watchOS(.v7)],
  products: [
    .library(
      name: "FirebaseABTesting-aksdjaslkj",
      targets: ["FirebaseABTesting"]
    ),
    .library(
      name: "FirebaseAnalytics",
      targets: ["FirebaseAnalytics"]
    ),
    .library(
      name: "FirebaseAppCheck",
      targets: ["FirebaseAppCheck"]
    ),
    .library(
      name: "FirebaseAppDistribution",
      targets: ["FirebaseAppDistribution"]
    ),
    .library(
      name: "FirebaseAuth",
      targets: ["FirebaseAuth"]
    ),
    .library(
      name: "FirebaseCrashlytics",
      targets: ["FirebaseCrashlytics"]
    ),
    .library(
      name: "FirebaseDatabase",
      targets: ["FirebaseDatabase"]
    ),
    .library(
      name: "FirebaseDynamicLinks",
      targets: ["FirebaseDynamicLinks"]
    ),
    .library(
      name: "FirebaseFirestore",
      targets: ["FirebaseFirestore"]
    ),
    .library(
      name: "FirebaseFunctions",
      targets: ["FirebaseFunctions"]
    ),
    .library(
      name: "FirebaseInAppMessaging",
      targets: ["FirebaseInAppMessaging"]
    ),
    .library(
      name: "FirebaseMLModelDownloader",
      targets: ["FirebaseMLModelDownloader"]
    ),
    .library(
      name: "FirebaseMessaging",
      targets: ["FirebaseMessaging"]
    ),
    .library(
      name: "FirebasePerformance",
      targets: ["FirebasePerformance"]
    ),
    .library(
      name: "FirebaseRemoteConfig",
      targets: ["FirebaseRemoteConfig"]
    ),
    .library(
      name: "FirebaseStorage",
      targets: ["FirebaseStorage"]
    ),
    .library(
      name: "Google-Mobile-Ads-SDK",
      targets: ["Google-Mobile-Ads-SDK"]
    ),
    .library(
      name: "GoogleSignIn",
      targets: ["GoogleSignIn"]
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
      name: "FirebaseABTesting",
      dependencies: [
        "Firebase",
        "FirebaseAnalytics",
        "FirebaseABTesting-xcf"
      ]
    ),
    .target(
      name: "FirebaseAnalytics",
      dependencies: [
        "Firebase",
        "FirebaseAnalytics-xcf",
        "FirebaseCore-xcf",
        "FirebaseCoreDiagnostics-xcf",
        "FirebaseInstallations-xcf",
        "GoogleAppMeasurement-xcf",
        "GoogleAppMeasurementIdentitySupport-xcf",
        "GoogleDataTransport-xcf",
        "GoogleUtilities-xcf",
        "PromisesObjC-xcf",
        "nanopb-xcf"
      ]
    ),
    .target(
      name: "FirebaseAppCheck",
      dependencies: [
        "Firebase",
        "FirebaseAnalytics",
        "FirebaseAppCheck-xcf"
      ]
    ),
    .target(
      name: "FirebaseAppDistribution",
      dependencies: [
        "Firebase",
        "FirebaseAnalytics",
        .target(name: "FirebaseAppDistribution-xcf", condition: .when(platforms: [.iOS]))
      ]
    ),
    .target(
      name: "FirebaseAuth",
      dependencies: [
        "Firebase",
        "FirebaseAnalytics",
        "FirebaseAuth-xcf",
        "GTMSessionFetcher-xcf"
      ]
    ),
    .target(
      name: "FirebaseCrashlytics",
      dependencies: [
        "Firebase",
        "FirebaseAnalytics",
        "FirebaseCrashlytics-xcf"
      ]
    ),
    .target(
      name: "FirebaseDatabase",
      dependencies: [
        "Firebase",
        "FirebaseAnalytics",
        "FirebaseDatabase-xcf",
        "leveldb-library-xcf"
      ]
    ),
    .target(
      name: "FirebaseDynamicLinks",
      dependencies: [
        "Firebase",
        "FirebaseAnalytics",
        .target(name: "FirebaseDynamicLinks-xcf", condition: .when(platforms: [.iOS]))
      ]
    ),
    .target(
      name: "FirebaseFirestore",
      dependencies: [
        "Firebase",
        "FirebaseAnalytics",
        "BoringSSL-GRPC-xcf",
        "FirebaseFirestore-xcf",
        "abseil-xcf",
        "gRPC-C++-xcf",
        "gRPC-Core-xcf",
        "leveldb-library-xcf"
      ],
      resources: [
        .process("Resources/gRPCCertificates-Cpp.bundle")
      ]
    ),
    .target(
      name: "FirebaseFunctions",
      dependencies: [
        "Firebase",
        "FirebaseAnalytics",
        "FirebaseFunctions-xcf",
        "GTMSessionFetcher-xcf"
      ]
    ),
    .target(
      name: "FirebaseInAppMessaging",
      dependencies: [
        "Firebase",
        "FirebaseAnalytics",
        "FirebaseABTesting-xcf",
        .target(name: "FirebaseInAppMessaging-xcf", condition: .when(platforms: [.iOS]))
      ],
      resources: [
        .process("Resources/InAppMessagingDisplayResources.bundle")
      ]
    ),
    .target(
      name: "FirebaseMLModelDownloader",
      dependencies: [
        "Firebase",
        "FirebaseAnalytics",
        "FirebaseMLModelDownloader-xcf",
        "SwiftProtobuf-xcf"
      ]
    ),
    .target(
      name: "FirebaseMessaging",
      dependencies: [
        "Firebase",
        "FirebaseAnalytics",
        "FirebaseMessaging-xcf"
      ]
    ),
    .target(
      name: "FirebasePerformance",
      dependencies: [
        "Firebase",
        "FirebaseAnalytics",
        "FirebaseABTesting-xcf",
        .target(name: "FirebasePerformance-xcf", condition: .when(platforms: [.iOS, .tvOS])),
        "FirebaseRemoteConfig-xcf"
      ]
    ),
    .target(
      name: "FirebaseRemoteConfig",
      dependencies: [
        "Firebase",
        "FirebaseAnalytics",
        "FirebaseABTesting-xcf",
        "FirebaseRemoteConfig-xcf"
      ]
    ),
    .target(
      name: "FirebaseStorage",
      dependencies: [
        "Firebase",
        "FirebaseAnalytics",
        "FirebaseStorage-xcf",
        "GTMSessionFetcher-xcf"
      ]
    ),
    .target(
      name: "Google-Mobile-Ads-SDK",
      dependencies: [
        "Firebase",
        "FirebaseAnalytics",
        .target(name: "GoogleMobileAds-xcf", condition: .when(platforms: [.iOS])),
        .target(name: "UserMessagingPlatform-xcf", condition: .when(platforms: [.iOS]))
      ]
    ),
    .target(
      name: "GoogleSignIn",
      dependencies: [
        "Firebase",
        "FirebaseAnalytics",
        .target(name: "AppAuth-xcf", condition: .when(platforms: [.iOS])),
        .target(name: "GTMAppAuth-xcf", condition: .when(platforms: [.iOS])),
        "GTMSessionFetcher-xcf",
        .target(name: "GoogleSignIn-xcf", condition: .when(platforms: [.iOS]))
      ],
      resources: [
        .process("Resources/GoogleSignIn.bundle")
      ]
    ),
    .binaryTarget(
      name: "AppAuth-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/AppAuth-xcf.xcframework.zip",
      checksum: "ad689560c1b28e82e9652bded37275150ddc75277d6306beae0ef65f007df7a7"
    ),
    .binaryTarget(
      name: "BoringSSL-GRPC-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/BoringSSL-GRPC-xcf.xcframework.zip",
      checksum: "a8191039c4145fa980514f904c6505c215b0658aceb87a3a91a3dc7a24f7fbc0"
    ),
    .binaryTarget(
      name: "FirebaseABTesting-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseABTesting-xcf.xcframework.zip",
      checksum: "f17a1267e50a81fcde1a4c8e37ebbf2ba87e762ed6d7f5938ac1f309eb0f1ae9"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseAnalytics-xcf.xcframework.zip",
      checksum: "c7bb3771a0f744ff2cc8268e8673275b7bfa3cfa083520d8b671121480447da2"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseAppCheck-xcf.xcframework.zip",
      checksum: "e756bb3029714ad8596acad1523bd251020c05fad4569a40b42081c4c8b55d78"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseAppDistribution-xcf.xcframework.zip",
      checksum: "523a0ef37a6cd4e18a02063906116e64690584ee0fff4f85391537e8dcdb367b"
    ),
    .binaryTarget(
      name: "FirebaseAuth-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseAuth-xcf.xcframework.zip",
      checksum: "ba80949dccd6db237b271501e4e2b078337885f2d2e5c087ee760b6426110726"
    ),
    .binaryTarget(
      name: "FirebaseCore-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseCore-xcf.xcframework.zip",
      checksum: "745142bbfb62e6c38762b4e1f7bb848056c9ffb64d408d3026a0ab4a733b8cfd"
    ),
    .binaryTarget(
      name: "FirebaseCoreDiagnostics-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseCoreDiagnostics-xcf.xcframework.zip",
      checksum: "a6c7f6485746eca769fe32894e6176a5d9d24aab9a431d41c5175a9693c07bdd"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseCrashlytics-xcf.xcframework.zip",
      checksum: "08191eb83ecf6e1748f652b571183f759815babd9e710e699f3b3efb9091ba61"
    ),
    .binaryTarget(
      name: "FirebaseDatabase-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseDatabase-xcf.xcframework.zip",
      checksum: "47e7d54ae3af83302a3085dacaba11d499523f43bccf4ae463375353e357897e"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseDynamicLinks-xcf.xcframework.zip",
      checksum: "44b5b3195ae90705be2764aab61e77e095b6c1ec9465d0c10a498b4e0ef026bc"
    ),
    .binaryTarget(
      name: "FirebaseFirestore-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseFirestore-xcf.xcframework.zip",
      checksum: "4027cdffdc0435668933708c99537b9bd80da233cbccf5c9b5c1f3b307c696d3"
    ),
    .binaryTarget(
      name: "FirebaseFunctions-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseFunctions-xcf.xcframework.zip",
      checksum: "ce565838ed4738170472f765f0ad7ddcdc742d1d6a26ee56094ccd005c12e714"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseInAppMessaging-xcf.xcframework.zip",
      checksum: "eda141813ab21adf894f8b35d3845618b1a2a814a023afb74414b24adc8f78d5"
    ),
    .binaryTarget(
      name: "FirebaseInstallations-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseInstallations-xcf.xcframework.zip",
      checksum: "5046cca2ed843d9f5fee4c7284e87545942cc977b6e791eaf04151815db0f050"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseMLModelDownloader-xcf.xcframework.zip",
      checksum: "cb18b7193826a05a9a64fc195ff7d68786838270e9fb7fd284143cf74c936653"
    ),
    .binaryTarget(
      name: "FirebaseMessaging-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseMessaging-xcf.xcframework.zip",
      checksum: "1b710acd177807843a346426fc5d13243e20799ec72b50fbd207e8b8c7b276b4"
    ),
    .binaryTarget(
      name: "FirebasePerformance-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebasePerformance-xcf.xcframework.zip",
      checksum: "884484d91dd09622c0daaa00a208a895713abf6679f8fef80f00094fc3a65a74"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseRemoteConfig-xcf.xcframework.zip",
      checksum: "d0019cf598c609e1cb5d636b256014673444cdc3cb62c8dcb0e12739e60ea552"
    ),
    .binaryTarget(
      name: "FirebaseStorage-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseStorage-xcf.xcframework.zip",
      checksum: "05c91a6169b44b754c9885746a58ad94213de79de14f61b70241328040d21e12"
    ),
    .binaryTarget(
      name: "GTMAppAuth-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/GTMAppAuth-xcf.xcframework.zip",
      checksum: "e874eb7a0248d96d6320b256c7ebc2cc389f81773648b3c72687a56866f49f45"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/GTMSessionFetcher-xcf.xcframework.zip",
      checksum: "21f6f125d601b1f9baf4b91cdbe8f2d00e86787e125718897e8f781b96347e51"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/GoogleAppMeasurement-xcf.xcframework.zip",
      checksum: "5fc1bead8b1b29614bf8c3d2e1be75456c542d8b0f2da291414b84bf52a8a6f1"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/GoogleAppMeasurementIdentitySupport-xcf.xcframework.zip",
      checksum: "f727976f1a8bfa94f987de2474d105dc6d95a401b9676c1c40f05ec34318ba4f"
    ),
    .binaryTarget(
      name: "GoogleDataTransport-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/GoogleDataTransport-xcf.xcframework.zip",
      checksum: "994e225961c67648fd55ebc740fae909df3c93f384e66a5ff87b116bfd423cfa"
    ),
    .binaryTarget(
      name: "GoogleMobileAds-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/GoogleMobileAds-xcf.xcframework.zip",
      checksum: "a08f9a2bdc1bf99c435a78c94dc047383417b7f64d5749cbfac1419b159446fa"
    ),
    .binaryTarget(
      name: "GoogleSignIn-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/GoogleSignIn-xcf.xcframework.zip",
      checksum: "1b0c43d69606beb1520fefe1e3c5a6bbe32f11579d668cd87a5e7631d39508b1"
    ),
    .binaryTarget(
      name: "GoogleUtilities-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/GoogleUtilities-xcf.xcframework.zip",
      checksum: "d42a7bc6476c5a8efe859198e57bb88083d3d18190fc973680e148d7f1b3d2db"
    ),
    .binaryTarget(
      name: "PromisesObjC-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/PromisesObjC-xcf.xcframework.zip",
      checksum: "6d04605e73b005f05c6f516ca9f473dc4ea3929426bfd19a6a0c9e743be991fd"
    ),
    .binaryTarget(
      name: "SwiftProtobuf-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/SwiftProtobuf-xcf.xcframework.zip",
      checksum: "8707492ad5e6c9526c9a6e5bdcdcc078cd647eb3a4088273636b057499411e69"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/UserMessagingPlatform-xcf.xcframework.zip",
      checksum: "396b56714398e16dda6b3e83a89664acf26cfb697d98bd329cdfb8d8d2db8403"
    ),
    .binaryTarget(
      name: "abseil-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/abseil-xcf.xcframework.zip",
      checksum: "7975dd17323906af13fbf3ac93c86996eeffc52e7121bdf2e2580dc548810cb0"
    ),
    .binaryTarget(
      name: "gRPC-C++-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/gRPC-C++-xcf.xcframework.zip",
      checksum: "81d818af6c5bdeb3305b51e7c51c1ae207625fd36c53ce2dd59ee6f51f33fe73"
    ),
    .binaryTarget(
      name: "gRPC-Core-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/gRPC-Core-xcf.xcframework.zip",
      checksum: "59aaafcdd839ea280163c0c53a126f42251661776bfd316997ef1610a8b54160"
    ),
    .binaryTarget(
      name: "leveldb-library-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/leveldb-library-xcf.xcframework.zip",
      checksum: "ec89ace02ce89ee6a6386b4bf88070dc9107877b267e0349d9327b2b96f6ee9f"
    ),
    .binaryTarget(
      name: "nanopb-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/nanopb-xcf.xcframework.zip",
      checksum: "26d806e295b00cbb89f1ad6245fd5924f8b0f801a87b46b06992ab430a21c5c3"
    )
  ]
)
    
