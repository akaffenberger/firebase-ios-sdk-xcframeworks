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
        "FirebaseABTesting"
      ],
      path: "Sources/FirebaseABTesting"
    ),
    .target(
      name: "FirebaseAnalyticsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalytics",
        "FirebaseCore",
        "FirebaseCoreDiagnostics",
        "FirebaseInstallations",
        "GoogleAppMeasurement",
        "GoogleAppMeasurementIdentitySupport",
        "GoogleDataTransport",
        "GoogleUtilities",
        "PromisesObjC",
        "nanopb"
      ],
      path: "Sources/FirebaseAnalytics"
    ),
    .target(
      name: "FirebaseAppCheckTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseAppCheck"
      ],
      path: "Sources/FirebaseAppCheck"
    ),
    .target(
      name: "FirebaseAppDistributionTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "FirebaseAppDistribution", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseAppDistribution"
    ),
    .target(
      name: "FirebaseAuthTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseAuth",
        "GTMSessionFetcher"
      ],
      path: "Sources/FirebaseAuth"
    ),
    .target(
      name: "FirebaseCrashlyticsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseCrashlytics"
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
        "FirebaseDatabase",
        "leveldb-library"
      ],
      path: "Sources/FirebaseDatabase"
    ),
    .target(
      name: "FirebaseDynamicLinksTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "FirebaseDynamicLinks", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseDynamicLinks"
    ),
    .target(
      name: "FirebaseFirestoreTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "BoringSSL-GRPC",
        "FirebaseFirestore",
        "abseil",
        "gRPC-Core",
        "gRPCC",
        "leveldb-library"
      ],
      path: "Sources/FirebaseFirestore",
      resources: [
        .process("Resources/gRPCCertificates-Cpp.bundle")
      ]
    ),
    .target(
      name: "FirebaseFunctionsTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseFunctions",
        "GTMSessionFetcher"
      ],
      path: "Sources/FirebaseFunctions"
    ),
    .target(
      name: "FirebaseInAppMessagingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseABTesting",
        .target(name: "FirebaseInAppMessaging", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/FirebaseInAppMessaging",
      resources: [
        .process("Resources/InAppMessagingDisplayResources.bundle")
      ]
    ),
    .target(
      name: "FirebaseMLModelDownloaderTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseMLModelDownloader",
        "SwiftProtobuf"
      ],
      path: "Sources/FirebaseMLModelDownloader"
    ),
    .target(
      name: "FirebaseMessagingTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseMessaging"
      ],
      path: "Sources/FirebaseMessaging"
    ),
    .target(
      name: "FirebasePerformanceTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseABTesting",
        .target(name: "FirebasePerformance", condition: .when(platforms: [.iOS, .tvOS])),
        "FirebaseRemoteConfig"
      ],
      path: "Sources/FirebasePerformance"
    ),
    .target(
      name: "FirebaseRemoteConfigTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseABTesting",
        "FirebaseRemoteConfig"
      ],
      path: "Sources/FirebaseRemoteConfig"
    ),
    .target(
      name: "FirebaseStorageTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        "FirebaseStorage",
        "GTMSessionFetcher"
      ],
      path: "Sources/FirebaseStorage"
    ),
    .target(
      name: "Google-Mobile-Ads-SDKTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "GoogleMobileAds", condition: .when(platforms: [.iOS])),
        .target(name: "UserMessagingPlatform", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/Google-Mobile-Ads-SDK"
    ),
    .target(
      name: "GoogleSignInTarget",
      dependencies: [
        "Firebase",
        "FirebaseAnalyticsTarget",
        .target(name: "AppAuth", condition: .when(platforms: [.iOS])),
        .target(name: "GTMAppAuth", condition: .when(platforms: [.iOS])),
        "GTMSessionFetcher",
        .target(name: "GoogleSignIn", condition: .when(platforms: [.iOS]))
      ],
      path: "Sources/GoogleSignIn",
      resources: [
        .process("Resources/GoogleSignIn.bundle")
      ]
    ),
    .binaryTarget(
      name: "AppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.2/AppAuth.xcframework.zip",
      checksum: "38453fb1a093fa290ea326778e5ef2111b47874ff9ab546334f1fea57dbdfe6b"
    ),
    .binaryTarget(
      name: "BoringSSL-GRPC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.2/BoringSSL-GRPC.xcframework.zip",
      checksum: "d147a36556751ea1cb88365485e1f2262dd3ea01e9b4c3fad13726f68867859a"
    ),
    .binaryTarget(
      name: "FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.2/FirebaseABTesting.xcframework.zip",
      checksum: "fbdb500429061f07363920c4c7d49c80ed806c058a5f9a52a675acae7f64c275"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.2/FirebaseAnalytics.xcframework.zip",
      checksum: "5cdbcaff9caf834659658668c13159826e4bc2d2024aef272ac301dc36a66869"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.2/FirebaseAppCheck.xcframework.zip",
      checksum: "6da45cdc9546b00ac887e3d54dc63d721af29cc13c95420b5d8fda1fc9c3aa7a"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.2/FirebaseAppDistribution.xcframework.zip",
      checksum: "256ab2409121df7523b459938d1ae4b0910930acf3125bbe5a611b3c2f596558"
    ),
    .binaryTarget(
      name: "FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.2/FirebaseAuth.xcframework.zip",
      checksum: "c2e658d04ca12c2ff5c50c553a94a9201a3a749b9f1f1818f2aad3eb92173e52"
    ),
    .binaryTarget(
      name: "FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.2/FirebaseCore.xcframework.zip",
      checksum: "941acdc1acf99462e131180d238a2daaa487286724f0426dc93130dfde0af441"
    ),
    .binaryTarget(
      name: "FirebaseCoreDiagnostics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.2/FirebaseCoreDiagnostics.xcframework.zip",
      checksum: "adb44f83121776f67134c2149126f707cc6beb79ac1ec07ff04e55a00cc17aad"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.2/FirebaseCrashlytics.xcframework.zip",
      checksum: "cb065aa1a0aa2de8ffb0fa733adfa475b6f5715cbd2fd0bd0ebc94741318840d"
    ),
    .binaryTarget(
      name: "FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.2/FirebaseDatabase.xcframework.zip",
      checksum: "07581324f4ae518554e64d9e676ff285f4170089b05a8319408830d1ef689e6f"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.2/FirebaseDynamicLinks.xcframework.zip",
      checksum: "4d0de58563a07d74231937918fde211f5195be24b6c663074b87582f05122acf"
    ),
    .binaryTarget(
      name: "FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.2/FirebaseFirestore.xcframework.zip",
      checksum: "e25630b9c4959041a4388b95a434191dfe504091f704fe5d0616710d05f3f4a3"
    ),
    .binaryTarget(
      name: "FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.2/FirebaseFunctions.xcframework.zip",
      checksum: "85a5f5bb22f03aec30969582b131817e1db3135ce9e8ca8cc2b9ba322d2c7049"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.2/FirebaseInAppMessaging.xcframework.zip",
      checksum: "4a8eeb1f26d04f6d2765f4c29d95a9648c0c00b2983c0ebb66ccece8c07708b1"
    ),
    .binaryTarget(
      name: "FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.2/FirebaseInstallations.xcframework.zip",
      checksum: "07c44430917e500f8f83d38ac0cf3ff6afa437d0e40cb59a564bb562bc5fd30f"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.2/FirebaseMLModelDownloader.xcframework.zip",
      checksum: "cccb17653d6a6eb461ad3be3f0510e2abb17a21e40c60e533b1866a7017fa64d"
    ),
    .binaryTarget(
      name: "FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.2/FirebaseMessaging.xcframework.zip",
      checksum: "bafd062d806aef14e0a52012387f2141b230c3c477af7f02eb5070bf006816ba"
    ),
    .binaryTarget(
      name: "FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.2/FirebasePerformance.xcframework.zip",
      checksum: "2b22a5c7673400441d262c4001bcfbf8fe9d4be5a075ac0d96a9d7c88f72f1c3"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.2/FirebaseRemoteConfig.xcframework.zip",
      checksum: "5cacafafd560500a88ae084afb4b5e4f88a68355701b3dbe0de33bfad885369d"
    ),
    .binaryTarget(
      name: "FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.2/FirebaseStorage.xcframework.zip",
      checksum: "88ebc2056e3c01cc88b03488bf1a4941b97b18215bc201448cf07b7bffcd8f7c"
    ),
    .binaryTarget(
      name: "GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.2/GTMAppAuth.xcframework.zip",
      checksum: "d27ed4b1ca9ec1b2d46fd3846e27106fc5bfcb7b22b93811e99e508a6fa13152"
    ),
    .binaryTarget(
      name: "GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.2/GTMSessionFetcher.xcframework.zip",
      checksum: "5165351bb71af4a3f3b1a836c00e5ed1fc2971c9369906c9f5b96f9ec7bdc477"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.2/GoogleAppMeasurement.xcframework.zip",
      checksum: "da088b73e986bb2df1c6334e1fc722477ba3070071cf1a7cef9dd612370a1679"
    ),
    .binaryTarget(
      name: "GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.2/GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "82bc916e1d3bec821653461c052d2900fd27dfa521be69d50c9b446347c08ad5"
    ),
    .binaryTarget(
      name: "GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.2/GoogleDataTransport.xcframework.zip",
      checksum: "da969ae314dd4a22051e1813b1a8441510eee6104e99bd883cb3e9e3e59ca974"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.2/GoogleMobileAds.xcframework.zip",
      checksum: "b949687760f4281ac3e43a9e8b9200d3e264b442a4ffeac785e43a29277ab345"
    ),
    .binaryTarget(
      name: "GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.2/GoogleSignIn.xcframework.zip",
      checksum: "eb3fee97cd4d479f029f9e63e4de539451522631ad6336299f03ee3644a27712"
    ),
    .binaryTarget(
      name: "GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.2/GoogleUtilities.xcframework.zip",
      checksum: "d87b796cc13a9762cf62699999e28a45784eab3d5c890e6e699746658a3644d9"
    ),
    .binaryTarget(
      name: "PromisesObjC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.2/PromisesObjC.xcframework.zip",
      checksum: "863152ee01d1881356c9febf3b4fb209e9f5a24866ea6bae69e345adb0a96ff6"
    ),
    .binaryTarget(
      name: "SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.2/SwiftProtobuf.xcframework.zip",
      checksum: "54ca6ba81a5a817130ec89d09fdeb0c4ddc8f0e746e15e3f12c86697e16d9b5d"
    ),
    .binaryTarget(
      name: "UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.2/UserMessagingPlatform.xcframework.zip",
      checksum: "ca4b6609f78a3a061ba0325a3f21d7dfde42c5ec731248a34bf847c51b5f3608"
    ),
    .binaryTarget(
      name: "abseil",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.2/abseil.xcframework.zip",
      checksum: "558ad0f669faae4cc2f16d7b943b256de7176cd80d1b0182a828bc99c90e6afa"
    ),
    .binaryTarget(
      name: "gRPC-Core",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.2/gRPC-Core.xcframework.zip",
      checksum: "164f77cc2691b14edc0b55d69e8c8be0fbee7b571d4f3303f58bc93798223607"
    ),
    .binaryTarget(
      name: "gRPCC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.2/gRPCC.xcframework.zip",
      checksum: "c985855d4a720c3281752f59ae1f88b77a7724b37c0581fc4b4772a7eb1e2978"
    ),
    .binaryTarget(
      name: "leveldb-library",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.2/leveldb-library.xcframework.zip",
      checksum: "c6741e2d9dcd6be00b389973dd7a222e4f2bc1ece7561f0d6e13e57d8f168f9e"
    ),
    .binaryTarget(
      name: "nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.2/nanopb.xcframework.zip",
      checksum: "b7a4345d2630875c3b22b90799ec995a2018655b9443b15a28ace87e20e3a837"
    )
  ]
)
    
