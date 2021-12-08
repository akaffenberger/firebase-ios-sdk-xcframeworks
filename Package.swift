// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Firebase",
  platforms: [.iOS(.v11), .macOS(.v10_12), .tvOS(.v12), .watchOS(.v7)],
  products: [
    .library(
      name: "FirebaseABTesting",
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
        "FirebaseAppDistribution-xcf"
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
        "FirebaseDynamicLinks-xcf"
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
        "FirebaseInAppMessaging-xcf"
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
        "FirebasePerformance-xcf",
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
        "GoogleMobileAds-xcf",
        "UserMessagingPlatform-xcf"
      ]
    ),
    .target(
      name: "GoogleSignIn",
      dependencies: [
        "Firebase",
        "FirebaseAnalytics",
        "AppAuth-xcf",
        "GTMAppAuth-xcf",
        "GTMSessionFetcher-xcf",
        "GoogleSignIn-xcf"
      ],
      resources: [
        .process("Resources/GoogleSignIn.bundle")
      ]
    ),
    .binaryTarget(
      name: "AppAuth-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/AppAuth-xcf.xcframework.zip",
      checksum: "42a1c13d27d77a00e334e5db7a697782ea02ce1d9d8703f0dddfb4b0b14f6267"
    ),
    .binaryTarget(
      name: "BoringSSL-GRPC-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/BoringSSL-GRPC-xcf.xcframework.zip",
      checksum: "ab7347d62764c02fac5988aaf71b2aaa835ba7596bda81f632c1d6b8bc31a227"
    ),
    .binaryTarget(
      name: "FirebaseABTesting-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseABTesting-xcf.xcframework.zip",
      checksum: "75e3292a1f40dcff07052a7ff8e445f758a56681577bd488dc5317a0eb0b128a"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseAnalytics-xcf.xcframework.zip",
      checksum: "17a8bb55db2cb4ad28616ca4981b6afe2001230000107f12e3f68b4875cd8492"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseAppCheck-xcf.xcframework.zip",
      checksum: "37fd95ad33c69a20c9fe3fea36b24b82be6917a1bbf23c65648268344acc4722"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseAppDistribution-xcf.xcframework.zip",
      checksum: "4d86eb16ac2fcfe190c692e2ebabf2d75b91d363d1332dcb1ff5cf5c2429a6b4"
    ),
    .binaryTarget(
      name: "FirebaseAuth-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseAuth-xcf.xcframework.zip",
      checksum: "dd5825dbffc299f2c1137bc7f39bb0f8f6ac0c9358189ec74f617aef1e172a54"
    ),
    .binaryTarget(
      name: "FirebaseCore-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseCore-xcf.xcframework.zip",
      checksum: "f63805d59cdd37ab0bab2536deeeebb52887663ca78d678088dffcef8eee66af"
    ),
    .binaryTarget(
      name: "FirebaseCoreDiagnostics-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseCoreDiagnostics-xcf.xcframework.zip",
      checksum: "cb2025181ed8ee284433b5403fde3eec33f80c3503c7b39f5c84cf94db08885e"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseCrashlytics-xcf.xcframework.zip",
      checksum: "7704b2a1121b43950d577f65426562f19e6ac2132c46784321775451f074cc19"
    ),
    .binaryTarget(
      name: "FirebaseDatabase-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseDatabase-xcf.xcframework.zip",
      checksum: "6e5c56587315323316227c41a2900670c11dc84b662a194a604523064b85aede"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseDynamicLinks-xcf.xcframework.zip",
      checksum: "452affcaa905a175b3b089953369ff9ba67ba547fd9f50ac43f208bb69e9b154"
    ),
    .binaryTarget(
      name: "FirebaseFirestore-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseFirestore-xcf.xcframework.zip",
      checksum: "8e3424cabb7962009a25e5a0e4547371afea837d00ddc5981efff150f5aef4b0"
    ),
    .binaryTarget(
      name: "FirebaseFunctions-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseFunctions-xcf.xcframework.zip",
      checksum: "596fe37c1e37b0a55a81ca98f18d4c58e91226ce6c009d7fd2a2b1ba5de62e6f"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseInAppMessaging-xcf.xcframework.zip",
      checksum: "a1385fabc3ebd6cb6e2441c71df5ee128756ca2b7da53f2d13ccdbe2e77de01c"
    ),
    .binaryTarget(
      name: "FirebaseInstallations-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseInstallations-xcf.xcframework.zip",
      checksum: "1e80548b42ee4a4f6783228b5b461a57531d57182f9167951c60e434a49cfc33"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseMLModelDownloader-xcf.xcframework.zip",
      checksum: "b1f8cd2bc644f8f833e1fb5fe474bd0429923850a3e9dc670934c2e93b74c415"
    ),
    .binaryTarget(
      name: "FirebaseMessaging-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseMessaging-xcf.xcframework.zip",
      checksum: "c63db58f851f31993d6e93c9a43cc58fe5a021304d070253c7c23cae2790f077"
    ),
    .binaryTarget(
      name: "FirebasePerformance-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebasePerformance-xcf.xcframework.zip",
      checksum: "9b6a285a8b236d8bcfb015ba2e0f7908d7f6adcded77f882bdc9e2b4c108ec45"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseRemoteConfig-xcf.xcframework.zip",
      checksum: "c092955dd5072cd4c0b34f9979567cd704901e2e1e2b1d674f27f83a77381118"
    ),
    .binaryTarget(
      name: "FirebaseStorage-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseStorage-xcf.xcframework.zip",
      checksum: "f9dedd389d47545e45c9f9bb8755ebcdc78e1923f929160f5b32251afe0fc2e2"
    ),
    .binaryTarget(
      name: "GTMAppAuth-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/GTMAppAuth-xcf.xcframework.zip",
      checksum: "f0babdfc0e773dd5e5c9faff42bb588981fade6983dc4c6a21df0c3cced06f25"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/GTMSessionFetcher-xcf.xcframework.zip",
      checksum: "ccd3bdbc76154e9724f9aa41304c3d2203f0bfe55738faee5f90cf8f595c64b5"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/GoogleAppMeasurement-xcf.xcframework.zip",
      checksum: "c8d43f838fad90eb0b9d237398c021dea0eae2ea3fe01f3d69eb110e5a7f8f95"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/GoogleAppMeasurementIdentitySupport-xcf.xcframework.zip",
      checksum: "9486ae436690f96ed72b3875f9d91e8fb3e73cd8eebdd3501bdd33286f931116"
    ),
    .binaryTarget(
      name: "GoogleDataTransport-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/GoogleDataTransport-xcf.xcframework.zip",
      checksum: "4e6152bbc6acf71cf57c432b4bd2fe05cd619ef18029475029830162d2221d0e"
    ),
    .binaryTarget(
      name: "GoogleMobileAds-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/GoogleMobileAds-xcf.xcframework.zip",
      checksum: "6b5555c0fa8fb1168b47b97e5df7028f8eae1e6e03fd1a40a6c99098e539982e"
    ),
    .binaryTarget(
      name: "GoogleSignIn-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/GoogleSignIn-xcf.xcframework.zip",
      checksum: "5993b018b860582a569ae7935e1a430f51602813b4adf99c381a7af9a8b8c418"
    ),
    .binaryTarget(
      name: "GoogleUtilities-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/GoogleUtilities-xcf.xcframework.zip",
      checksum: "d9e807d99aaaa6e5d3d6ecb01ced94aca6abcd9c44c7dc1592fabe958acd79aa"
    ),
    .binaryTarget(
      name: "PromisesObjC-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/PromisesObjC-xcf.xcframework.zip",
      checksum: "2525a19055ce0833cddeaaa2494779c4d42e97ba25be7b27ae8fc831cc24f329"
    ),
    .binaryTarget(
      name: "SwiftProtobuf-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/SwiftProtobuf-xcf.xcframework.zip",
      checksum: "7b0ca8b74f0090e82fa7ab775925150f8e80918fcb48e4a0a2283406f39dd416"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/UserMessagingPlatform-xcf.xcframework.zip",
      checksum: "5c7a2dc9c22ae21c9c25aba1e1af6da41e482d6f0e1b8ec31286d50b1dc19ee3"
    ),
    .binaryTarget(
      name: "abseil-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/abseil-xcf.xcframework.zip",
      checksum: "09c0e2de4313e998e5dbeb84301c4bc20070273fcb6cc02b986098eecb69a482"
    ),
    .binaryTarget(
      name: "gRPC-C++-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/gRPC-C++-xcf.xcframework.zip",
      checksum: "2865f7c6739e903b4c9dbd2860be29da4b17073c48b0d686595560908fc877cb"
    ),
    .binaryTarget(
      name: "gRPC-Core-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/gRPC-Core-xcf.xcframework.zip",
      checksum: "e35cdcaa742e9135d303b002e0a6721c9b1a426cd57eb4932348575cf043ae57"
    ),
    .binaryTarget(
      name: "leveldb-library-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/leveldb-library-xcf.xcframework.zip",
      checksum: "f508d77d558311f0d7e2b8a768fd172593613b591e3246d5a2de2fce9bb8857c"
    ),
    .binaryTarget(
      name: "nanopb-xcf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/nanopb-xcf.xcframework.zip",
      checksum: "4e28b5b039b76d03d558e9ce8a71e953139eeaf3e0fd94ffed6874836c51dd80"
    )
  ]
)
    