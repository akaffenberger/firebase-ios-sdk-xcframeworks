
// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Firebase",
  platforms: [.iOS(.v11), .macOS(.v10_12), .tvOS(.v12), .watchOS(.v7)],
  products: [
    .library(
      name: "FirebaseABTesting",
      targets: [
        "FirebaseABTesting-FirebaseABTesting"
      ]
    ),
    .library(
      name: "FirebaseAnalytics",
      targets: [
        "FirebaseAnalytics-FirebaseAnalytics",
        "FirebaseAnalytics-FirebaseCore",
        "FirebaseAnalytics-FirebaseCoreDiagnostics",
        "FirebaseAnalytics-FirebaseInstallations",
        "FirebaseAnalytics-GoogleAppMeasurement",
        "FirebaseAnalytics-GoogleAppMeasurementIdentitySupport",
        "FirebaseAnalytics-GoogleDataTransport",
        "FirebaseAnalytics-GoogleUtilities",
        "FirebaseAnalytics-PromisesObjC",
        "FirebaseAnalytics-nanopb"
      ]
    ),
    .library(
      name: "FirebaseAppCheck",
      targets: [
        "FirebaseAppCheck-FirebaseAppCheck"
      ]
    ),
    .library(
      name: "FirebaseAppDistribution",
      targets: [
        "FirebaseAppDistribution-FirebaseAppDistribution"
      ]
    ),
    .library(
      name: "FirebaseAuth",
      targets: [
        "FirebaseAuth-FirebaseAuth",
        "FirebaseAuth-GTMSessionFetcher"
      ]
    ),
    .library(
      name: "FirebaseCrashlytics",
      targets: [
        "FirebaseCrashlytics-FirebaseCrashlytics"
      ]
    ),
    .library(
      name: "FirebaseDatabase",
      targets: [
        "FirebaseDatabase-FirebaseDatabase",
        "FirebaseDatabase-leveldb-library"
      ]
    ),
    .library(
      name: "FirebaseDynamicLinks",
      targets: [
        "FirebaseDynamicLinks-FirebaseDynamicLinks"
      ]
    ),
    .library(
      name: "FirebaseFirestore",
      targets: [
        "FirebaseFirestore-BoringSSL-GRPC",
        "FirebaseFirestore-FirebaseFirestore",
        "FirebaseFirestore-abseil",
        "FirebaseFirestore-gRPC-C++",
        "FirebaseFirestore-gRPC-Core",
        "FirebaseFirestore-leveldb-library"
      ]
    ),
    .library(
      name: "FirebaseFunctions",
      targets: [
        "FirebaseFunctions-FirebaseFunctions",
        "FirebaseFunctions-GTMSessionFetcher"
      ]
    ),
    .library(
      name: "FirebaseInAppMessaging",
      targets: [
        "FirebaseInAppMessaging-FirebaseABTesting",
        "FirebaseInAppMessaging-FirebaseInAppMessaging"
      ]
    ),
    .library(
      name: "FirebaseMLModelDownloader",
      targets: [
        "FirebaseMLModelDownloader-FirebaseMLModelDownloader",
        "FirebaseMLModelDownloader-SwiftProtobuf"
      ]
    ),
    .library(
      name: "FirebaseMessaging",
      targets: [
        "FirebaseMessaging-FirebaseMessaging"
      ]
    ),
    .library(
      name: "FirebasePerformance",
      targets: [
        "FirebasePerformance-FirebaseABTesting",
        "FirebasePerformance-FirebasePerformance",
        "FirebasePerformance-FirebaseRemoteConfig"
      ]
    ),
    .library(
      name: "FirebaseRemoteConfig",
      targets: [
        "FirebaseRemoteConfig-FirebaseABTesting",
        "FirebaseRemoteConfig-FirebaseRemoteConfig"
      ]
    ),
    .library(
      name: "FirebaseStorage",
      targets: [
        "FirebaseStorage-FirebaseStorage",
        "FirebaseStorage-GTMSessionFetcher"
      ]
    ),
    .library(
      name: "Google-Mobile-Ads-SDK",
      targets: [
        "Google-Mobile-Ads-SDK-GoogleMobileAds",
        "Google-Mobile-Ads-SDK-UserMessagingPlatform"
      ]
    ),
    .library(
      name: "GoogleSignIn",
      targets: [
        "GoogleSignIn-AppAuth",
        "GoogleSignIn-GTMAppAuth",
        "GoogleSignIn-GTMSessionFetcher",
        "GoogleSignIn-GoogleSignIn"
      ]
    )
  ],
  dependencies: [
  ],
  targets: [
//    .binaryTarget(
//      name: "FirebaseABTesting-FirebaseABTesting",
//      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseABTesting-FirebaseABTesting.xcframework.zip",
//      checksum: "d563f6a77a57de2f8b13667560c37ad309002004f486141b4876e70dd1fc1e59"
//    ),
    .binaryTarget(
      name: "FirebaseAnalytics-FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseAnalytics-FirebaseAnalytics.xcframework.zip",
      checksum: "999186069bd11b39315a5122ed2b88f15a564523909146bf16527adef70a0f62"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics-FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseAnalytics-FirebaseCore.xcframework.zip",
      checksum: "124547e31d649d45e98f4f3ad6aa7d314f9fc73cf4522500f06ed62147ad239e"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics-FirebaseCoreDiagnostics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseAnalytics-FirebaseCoreDiagnostics.xcframework.zip",
      checksum: "9ab1374bc0e8dc0d4068a03bd3907c205d519c774d6345317bd5945c2672ddf5"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics-FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseAnalytics-FirebaseInstallations.xcframework.zip",
      checksum: "6e80b2c27bfb3eed8fdd49f9975f2185e225e64d1473c9f54a1ddc5049d37a8b"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics-GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseAnalytics-GoogleAppMeasurement.xcframework.zip",
      checksum: "1f9b725dd96df652238d50dc8c3b409aeb7217ceb9ffe2546cac6e3e5130d310"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics-GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseAnalytics-GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "ec64eb00d5e63af4cf08711e40e2898c76eca9be5be02039c2d57f3279c76919"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics-GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseAnalytics-GoogleDataTransport.xcframework.zip",
      checksum: "94ae0328c9ef6ba58fcea9f2379b0c613125bfd38b905cffbd84ff25031ee019"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics-GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseAnalytics-GoogleUtilities.xcframework.zip",
      checksum: "69835e9368194af3fc466fe2f11e0434b1459fde74f1b86c6b374c164c2ecd01"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics-PromisesObjC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseAnalytics-PromisesObjC.xcframework.zip",
      checksum: "80fe09f4cacf34ea394e850613420a9ff396863bcf908cb3eb98a2295e41cef4"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics-nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseAnalytics-nanopb.xcframework.zip",
      checksum: "6968f8c9df809f683397b92c29df9a01e4d3fe9680057c13c5b146852764101f"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck-FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseAppCheck-FirebaseAppCheck.xcframework.zip",
      checksum: "c90e53108c60b78d3090fce6dd6a991e418f2065f2ca5bf180384bd3abcd3861"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution-FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseAppDistribution-FirebaseAppDistribution.xcframework.zip",
      checksum: "682c633f11ce03d1712c0ef9e8a948b2211507514acc3de939cb9b22036a0e6e"
    ),
    .binaryTarget(
      name: "FirebaseAuth-FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseAuth-FirebaseAuth.xcframework.zip",
      checksum: "9d8f559f20291bef1d7dc6cb9f9b5e9e16f0631e4ac303416719059b5b8ca061"
    ),
    .binaryTarget(
      name: "FirebaseAuth-GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseAuth-GTMSessionFetcher.xcframework.zip",
      checksum: "72a922627623ab6dae6b6f163f3963e4e31c96f377a35a79245fd0d3d7578c80"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics-FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseCrashlytics-FirebaseCrashlytics.xcframework.zip",
      checksum: "4241b7641721c74e54c3d719db4af6b64cd5cc2f15d17a634aa393fa69fb8eb5"
    ),
    .binaryTarget(
      name: "FirebaseDatabase-FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseDatabase-FirebaseDatabase.xcframework.zip",
      checksum: "d68e34b0f8a4657ffaeda3a91e12c5a5785c9025c62e159c3543f50e5d12e5d2"
    ),
    .binaryTarget(
      name: "FirebaseDatabase-leveldb-library",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseDatabase-leveldb-library.xcframework.zip",
      checksum: "051fbe7903741ae421c3bfef8e52d74c7a895450b1b8664b3c98c331faebf046"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks-FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseDynamicLinks-FirebaseDynamicLinks.xcframework.zip",
      checksum: "d5e476d6f7d32a8a1fa39d6c17084996645ebd8452818da8dcc9253664bbbd13"
    ),
    .binaryTarget(
      name: "FirebaseFirestore-BoringSSL-GRPC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseFirestore-BoringSSL-GRPC.xcframework.zip",
      checksum: "7026c53a117967a3daaccb039d6d7e9238088b718dc0a06fe5463b0b7c72023b"
    ),
    .binaryTarget(
      name: "FirebaseFirestore-FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseFirestore-FirebaseFirestore.xcframework.zip",
      checksum: "3671cbde70e10cd243270c56f221427852b2b7334bcdcc0e7b80925d204eedb3"
    ),
    .binaryTarget(
      name: "FirebaseFirestore-abseil",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseFirestore-abseil.xcframework.zip",
      checksum: "59f6fbfc24ee1b45b4e0859c0d78b0163a9e778e9c4a0da8b83ea108758e6417"
    ),
    .binaryTarget(
      name: "FirebaseFirestore-gRPC-C++",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseFirestore-gRPC-C++.xcframework.zip",
      checksum: "cac7ab8f502fc4e156d9da4cfb57378b0ca0fc1241fff6f2fe76127d9eea137a"
    ),
    .binaryTarget(
      name: "FirebaseFirestore-gRPC-Core",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseFirestore-gRPC-Core.xcframework.zip",
      checksum: "791ff66120d384821905e703a965a6357f8e36981719d6926a0c40a4d9f88605"
    ),
    .binaryTarget(
      name: "FirebaseFirestore-leveldb-library",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseFirestore-leveldb-library.xcframework.zip",
      checksum: "86a4fc61d62050ad58328a1616925cf7ecb2d982ac2e89e3c822b96ef46068f5"
    ),
    .binaryTarget(
      name: "FirebaseFunctions-FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseFunctions-FirebaseFunctions.xcframework.zip",
      checksum: "383b65d40ce7d48c8c857ac8e4f8a7ca502eceda644029b8ac67f158d1bf1a36"
    ),
    .binaryTarget(
      name: "FirebaseFunctions-GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseFunctions-GTMSessionFetcher.xcframework.zip",
      checksum: "05bf8836cc021b85f158b1cd6c65c6be196f23863838b1e37fc89a3b148ba288"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging-FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseInAppMessaging-FirebaseABTesting.xcframework.zip",
      checksum: "78fe1800ef9697d6393058bdfb40b40a69607330705942011e47783bb4616479"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging-FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseInAppMessaging-FirebaseInAppMessaging.xcframework.zip",
      checksum: "b0117e4c9ca3578459eab502dc44df27143ba00a4947ac611b6b874fce7af30b"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader-FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseMLModelDownloader-FirebaseMLModelDownloader.xcframework.zip",
      checksum: "372724284a36ec6bc6f4c9e7482c448a41d4752855814a914c7034487d3c0b87"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader-SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseMLModelDownloader-SwiftProtobuf.xcframework.zip",
      checksum: "88aac249086c121e3029416e21b73bef151bc3b676301ce2ee8aa520d3bc29ae"
    ),
    .binaryTarget(
      name: "FirebaseMessaging-FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseMessaging-FirebaseMessaging.xcframework.zip",
      checksum: "7daa80ff8a9b88c78c9b3c182a39da377ed4b10bcba3a94556211ba5b5b55361"
    ),
    .binaryTarget(
      name: "FirebasePerformance-FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebasePerformance-FirebaseABTesting.xcframework.zip",
      checksum: "63e26c0ea8f6acc9687cdc85e8c67532af7ef6043ee055c68b737663be643e64"
    ),
    .binaryTarget(
      name: "FirebasePerformance-FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebasePerformance-FirebasePerformance.xcframework.zip",
      checksum: "0d975aea206d324f6df29bc879349066c748e0267422a5ff4d4a05a06707b75d"
    ),
    .binaryTarget(
      name: "FirebasePerformance-FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebasePerformance-FirebaseRemoteConfig.xcframework.zip",
      checksum: "9d8752774c67d101b311e2dd1a43aba366213adaa7d713f8df3aedeb77aa50b1"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig-FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseRemoteConfig-FirebaseABTesting.xcframework.zip",
      checksum: "4f61615f1971985da6f510dd71dea40f3cc81c347a59447d0d35e50a3af63a80"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig-FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseRemoteConfig-FirebaseRemoteConfig.xcframework.zip",
      checksum: "0c82883790ea03748e00cae61710be259ca4cc7355aa92df7540dde93821a6b2"
    ),
    .binaryTarget(
      name: "FirebaseStorage-FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseStorage-FirebaseStorage.xcframework.zip",
      checksum: "92474decaaa0232d54c3760f82f3e23903ef59fa3dbf7f6781a0648788ea5cf7"
    ),
    .binaryTarget(
      name: "FirebaseStorage-GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseStorage-GTMSessionFetcher.xcframework.zip",
      checksum: "2c477c68ff96473f90cb375022820dbdb8eee3415efec9e9ed6b9555faf1db3c"
    ),
    .binaryTarget(
      name: "Google-Mobile-Ads-SDK-GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/Google-Mobile-Ads-SDK-GoogleMobileAds.xcframework.zip",
      checksum: "adfb08ca125b3a50eb9b214f5b14c63195b1b62dc47a89d6fa5db82fc30f064b"
    ),
    .binaryTarget(
      name: "Google-Mobile-Ads-SDK-UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/Google-Mobile-Ads-SDK-UserMessagingPlatform.xcframework.zip",
      checksum: "dff4d739a7492f6e443adfe359317da257fdb81210621516e430def0c4a36d2e"
    ),
    .binaryTarget(
      name: "GoogleSignIn-AppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/GoogleSignIn-AppAuth.xcframework.zip",
      checksum: "a13839221c67708d5b1965e91f5e37441ba0469e5f5610ea982ccda920f5c33a"
    ),
    .binaryTarget(
      name: "GoogleSignIn-GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/GoogleSignIn-GTMAppAuth.xcframework.zip",
      checksum: "af3e9a21c5c161d834b0e8c2a508e7e7dd90df0e3144de413f1d4be972279431"
    ),
    .binaryTarget(
      name: "GoogleSignIn-GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/GoogleSignIn-GTMSessionFetcher.xcframework.zip",
      checksum: "71ad30acf3830854bc6267156c02d35e924586b2088086e73140cfb1747c8455"
    ),
    .binaryTarget(
      name: "GoogleSignIn-GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/GoogleSignIn-GoogleSignIn.xcframework.zip",
      checksum: "66cea65cf1a5249501d793eec93d41750d2dc6b50a124f4c72add35324332f07"
    )
  ]
)
