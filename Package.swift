
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
        "FirebaseABTesting_FirebaseABTesting"
      ]
    ),
    .library(
      name: "FirebaseAnalytics",
      targets: [
        "FirebaseAnalytics_FirebaseAnalytics",
        "FirebaseAnalytics_FirebaseCore",
        "FirebaseAnalytics_FirebaseCoreDiagnostics",
        "FirebaseAnalytics_FirebaseInstallations",
        "FirebaseAnalytics_GoogleAppMeasurement",
        "FirebaseAnalytics_GoogleAppMeasurementIdentitySupport",
        "FirebaseAnalytics_GoogleDataTransport",
        "FirebaseAnalytics_GoogleUtilities",
        "FirebaseAnalytics_PromisesObjC",
        "FirebaseAnalytics_nanopb"
      ]
    ),
    .library(
      name: "FirebaseAppCheck",
      targets: [
        "FirebaseAppCheck_FirebaseAppCheck"
      ]
    ),
    .library(
      name: "FirebaseAppDistribution",
      targets: [
        "FirebaseAppDistribution_FirebaseAppDistribution"
      ]
    ),
    .library(
      name: "FirebaseAuth",
      targets: [
        "FirebaseAuth_FirebaseAuth",
        "FirebaseAuth_GTMSessionFetcher"
      ]
    ),
    .library(
      name: "FirebaseCrashlytics",
      targets: [
        "FirebaseCrashlytics_FirebaseCrashlytics"
      ]
    ),
    .library(
      name: "FirebaseDatabase",
      targets: [
        "FirebaseDatabase_FirebaseDatabase",
        "FirebaseDatabase_leveldb-library"
      ]
    ),
    .library(
      name: "FirebaseDynamicLinks",
      targets: [
        "FirebaseDynamicLinks_FirebaseDynamicLinks"
      ]
    ),
    .library(
      name: "FirebaseFirestore",
      targets: [
        "FirebaseFirestore_BoringSSL-GRPC",
        "FirebaseFirestore_FirebaseFirestore",
        "FirebaseFirestore_abseil",
        "FirebaseFirestore_gRPC-C++",
        "FirebaseFirestore_gRPC-Core",
        "FirebaseFirestore_leveldb-library"
      ]
    ),
    .library(
      name: "FirebaseFunctions",
      targets: [
        "FirebaseFunctions_FirebaseFunctions",
        "FirebaseFunctions_GTMSessionFetcher"
      ]
    ),
    .library(
      name: "FirebaseInAppMessaging",
      targets: [
        "FirebaseInAppMessaging_FirebaseABTesting",
        "FirebaseInAppMessaging_FirebaseInAppMessaging"
      ]
    ),
    .library(
      name: "FirebaseMLModelDownloader",
      targets: [
        "FirebaseMLModelDownloader_FirebaseMLModelDownloader",
        "FirebaseMLModelDownloader_SwiftProtobuf"
      ]
    ),
    .library(
      name: "FirebaseMessaging",
      targets: [
        "FirebaseMessaging_FirebaseMessaging"
      ]
    ),
    .library(
      name: "FirebasePerformance",
      targets: [
        "FirebasePerformance_FirebaseABTesting",
        "FirebasePerformance_FirebasePerformance",
        "FirebasePerformance_FirebaseRemoteConfig"
      ]
    ),
    .library(
      name: "FirebaseRemoteConfig",
      targets: [
        "FirebaseRemoteConfig_FirebaseABTesting",
        "FirebaseRemoteConfig_FirebaseRemoteConfig"
      ]
    ),
    .library(
      name: "FirebaseStorage",
      targets: [
        "FirebaseStorage_FirebaseStorage",
        "FirebaseStorage_GTMSessionFetcher"
      ]
    ),
    .library(
      name: "Google-Mobile-Ads-SDK",
      targets: [
        "Google-Mobile-Ads-SDK_GoogleMobileAds",
        "Google-Mobile-Ads-SDK_UserMessagingPlatform"
      ]
    ),
    .library(
      name: "GoogleSignIn",
      targets: [
        "GoogleSignIn_AppAuth",
        "GoogleSignIn_GTMAppAuth",
        "GoogleSignIn_GTMSessionFetcher",
        "GoogleSignIn_GoogleSignIn"
      ]
    )
  ],
  dependencies: [
  ],
  targets: [
    .binaryTarget(
      name: "FirebaseABTesting_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseABTesting_FirebaseABTesting.xcframework.zip",
      checksum: "4f2f30efad8e80c0962595f6f934fdad5d0fa701a3a8ee161cc0fc67dd95c749"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics_FirebaseAnalytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseAnalytics_FirebaseAnalytics.xcframework.zip",
      checksum: "2b7735ce46e80df58264d698f07602d862359eb75f61f641ab5827e856f3b505"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics_FirebaseCore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseAnalytics_FirebaseCore.xcframework.zip",
      checksum: "89d31fce1c76cd659fce1ec09e8cfecca175c0d11c124f5a3ed6a013c4adcbb9"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics_FirebaseCoreDiagnostics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseAnalytics_FirebaseCoreDiagnostics.xcframework.zip",
      checksum: "610b4823450cd8c1c743765e16c8ae75ed61dc240606d8fb6cd7ce45a00a9a22"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics_FirebaseInstallations",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseAnalytics_FirebaseInstallations.xcframework.zip",
      checksum: "f9b2809bad23fd0cf34ac90b115e2f860ea149ea1e12c5a1561201835b99be59"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics_GoogleAppMeasurement",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseAnalytics_GoogleAppMeasurement.xcframework.zip",
      checksum: "03d83aa04ba1127db45cabe6c2df2272b2e1964679ae42760d3dfe05cbffcd19"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseAnalytics_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "f125376d3ddf277902dc24cfa61730f3e43a478d629d89d576ce80aae21fca29"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics_GoogleDataTransport",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseAnalytics_GoogleDataTransport.xcframework.zip",
      checksum: "e94c6ac34c834a2965b03680278a5e79e5d81b99aafcd84188297883f36f004f"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics_GoogleUtilities",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseAnalytics_GoogleUtilities.xcframework.zip",
      checksum: "638edc98f4ba3e64297d3fdd41b1bfa1e77a960f330110d39bf748dacd9c86a7"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics_PromisesObjC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseAnalytics_PromisesObjC.xcframework.zip",
      checksum: "33d7f238f081ef19dbd82d0ddd56c408c96b6ab3efc2765a56efaf1717edfe57"
    ),
    .binaryTarget(
      name: "FirebaseAnalytics_nanopb",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseAnalytics_nanopb.xcframework.zip",
      checksum: "d73894539c6d766095c8a9ec2f65df6b19fd35bc617b64739f01a54665f49c26"
    ),
    .binaryTarget(
      name: "FirebaseAppCheck_FirebaseAppCheck",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseAppCheck_FirebaseAppCheck.xcframework.zip",
      checksum: "349313b41e9c15437f526fd9b64e7348ea71ea3a1a496798317cab1571f0fd1c"
    ),
    .binaryTarget(
      name: "FirebaseAppDistribution_FirebaseAppDistribution",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseAppDistribution_FirebaseAppDistribution.xcframework.zip",
      checksum: "faf8cae3dddd4624b2511a66c9d2e62bdc1a988a2d09d66e21c3bf2d79680693"
    ),
    .binaryTarget(
      name: "FirebaseAuth_FirebaseAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseAuth_FirebaseAuth.xcframework.zip",
      checksum: "85ec7d062daa0c78fcafcdbef2e531913429e287a31b6563aa16d7855fc06516"
    ),
    .binaryTarget(
      name: "FirebaseAuth_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseAuth_GTMSessionFetcher.xcframework.zip",
      checksum: "8d7fdd8b88ef81476335057b1497910935448704ab1e333bd0d68a543eb7826f"
    ),
    .binaryTarget(
      name: "FirebaseCrashlytics_FirebaseCrashlytics",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseCrashlytics_FirebaseCrashlytics.xcframework.zip",
      checksum: "873864580ef18301d8d2c3bb27a3ef7b7be4a7a6f923a9accd11937f06c9e51b"
    ),
    .binaryTarget(
      name: "FirebaseDatabase_FirebaseDatabase",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseDatabase_FirebaseDatabase.xcframework.zip",
      checksum: "1c4b3bb22e389dee28f6288a25f644b7da513d302e6924b3200d95a533f86080"
    ),
    .binaryTarget(
      name: "FirebaseDatabase_leveldb-library",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseDatabase_leveldb-library.xcframework.zip",
      checksum: "560633acb10dc29e066d4c0a92060d1c14c0d19e66257d08216f3aa4eae297af"
    ),
    .binaryTarget(
      name: "FirebaseDynamicLinks_FirebaseDynamicLinks",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseDynamicLinks_FirebaseDynamicLinks.xcframework.zip",
      checksum: "9ace03669b9b1c73d03899595f53b318235d4fd9eed855347a48a3effe412584"
    ),
    .binaryTarget(
      name: "FirebaseFirestore_BoringSSL-GRPC",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseFirestore_BoringSSL-GRPC.xcframework.zip",
      checksum: "1ae659f084d9bb6e49302d9c0aa6f88b99a36a7a9a3739356524ee2caa49b12b"
    ),
    .binaryTarget(
      name: "FirebaseFirestore_FirebaseFirestore",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseFirestore_FirebaseFirestore.xcframework.zip",
      checksum: "deb79dfac2a0f0177f88255ad99260d0f7590c355b9409979a27079e04effd4d"
    ),
    .binaryTarget(
      name: "FirebaseFirestore_abseil",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseFirestore_abseil.xcframework.zip",
      checksum: "6a72454062ed57534946edb9dddebca32f8544e165f522b812c163286f9ff23d"
    ),
    .binaryTarget(
      name: "FirebaseFirestore_gRPC-C++",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseFirestore_gRPC-C++.xcframework.zip",
      checksum: "336a1891eaaa22202c7eebe739dea756338b56f074d1cc5158e3de02796f9bf6"
    ),
    .binaryTarget(
      name: "FirebaseFirestore_gRPC-Core",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseFirestore_gRPC-Core.xcframework.zip",
      checksum: "03fd755512de516c0b7f76ee521663a547367ef7535d70c762aceb87aae900a2"
    ),
    .binaryTarget(
      name: "FirebaseFirestore_leveldb-library",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseFirestore_leveldb-library.xcframework.zip",
      checksum: "555c6ca7e7a4230eb16c4d4d1024e7ef1496a0fd0cc5849ef303d609ed084c69"
    ),
    .binaryTarget(
      name: "FirebaseFunctions_FirebaseFunctions",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseFunctions_FirebaseFunctions.xcframework.zip",
      checksum: "e4cbed38fd68a0871e6f0e7864ff8e2f985b727c1dbb6c90b7b8952a82791032"
    ),
    .binaryTarget(
      name: "FirebaseFunctions_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseFunctions_GTMSessionFetcher.xcframework.zip",
      checksum: "3eca9b9ac16951667680ae652e4361e7338826c147dacb7a66779aba025fdc95"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseInAppMessaging_FirebaseABTesting.xcframework.zip",
      checksum: "f92a3f0063cd9ab4305500086ba11eb12f75cbf107bd030a1dfbe084c882dc0a"
    ),
    .binaryTarget(
      name: "FirebaseInAppMessaging_FirebaseInAppMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseInAppMessaging_FirebaseInAppMessaging.xcframework.zip",
      checksum: "70c9b3573faf7cefaf65bb77dd8283e7c8550870016d9a32a17397e931756829"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader_FirebaseMLModelDownloader",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseMLModelDownloader_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "ffcf23db2d963063f33a4c0fcaed3e402d8e910f7614eb2c8ef59012d50e5653"
    ),
    .binaryTarget(
      name: "FirebaseMLModelDownloader_SwiftProtobuf",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseMLModelDownloader_SwiftProtobuf.xcframework.zip",
      checksum: "0efc08e1c7999a58e4c1cdeca193e21bfa24b301b67fe47f0f022a376f2a29d2"
    ),
    .binaryTarget(
      name: "FirebaseMessaging_FirebaseMessaging",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseMessaging_FirebaseMessaging.xcframework.zip",
      checksum: "63bae8a0db5af3ad15c113e702cddc4e5dc9c3a28bfc63f9ae085a89dbdb35a4"
    ),
    .binaryTarget(
      name: "FirebasePerformance_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebasePerformance_FirebaseABTesting.xcframework.zip",
      checksum: "8332cfd93d26534ea0adb068f0bd6d91ad2455fbb7ef267657edc5a9cb0ab668"
    ),
    .binaryTarget(
      name: "FirebasePerformance_FirebasePerformance",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebasePerformance_FirebasePerformance.xcframework.zip",
      checksum: "80f940e32a34f32010c3b56b465671de7e19e1c5305243e58afa7e47fed281bf"
    ),
    .binaryTarget(
      name: "FirebasePerformance_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebasePerformance_FirebaseRemoteConfig.xcframework.zip",
      checksum: "958a91607cfa2371b9c02e93abc2e612d95608a65f01bdd2762f3255fc3a339a"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig_FirebaseABTesting",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseRemoteConfig_FirebaseABTesting.xcframework.zip",
      checksum: "d04f973c8b1c9df5428f7ad6956b8275b415bd2aad799ac0f3ba7dd4a8d744ee"
    ),
    .binaryTarget(
      name: "FirebaseRemoteConfig_FirebaseRemoteConfig",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseRemoteConfig_FirebaseRemoteConfig.xcframework.zip",
      checksum: "91c780a6950f7d4047955fffc6c874939cbf9972fd87833b1dd8643217c1b770"
    ),
    .binaryTarget(
      name: "FirebaseStorage_FirebaseStorage",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseStorage_FirebaseStorage.xcframework.zip",
      checksum: "596e8812991ce7b6e156d65ca27de2444112aeee13546dd7ea923d7f68ac3dbf"
    ),
    .binaryTarget(
      name: "FirebaseStorage_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/FirebaseStorage_GTMSessionFetcher.xcframework.zip",
      checksum: "e0fe7dfae441adb01eebb7334e5a9ed414f249bb344c96023531741a1c723dd7"
    ),
    .binaryTarget(
      name: "Google-Mobile-Ads-SDK_GoogleMobileAds",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/Google-Mobile-Ads-SDK_GoogleMobileAds.xcframework.zip",
      checksum: "33481a92df4394bf1de10bae0c78f19d3ae06fadc88979866a888c65ad4f2be1"
    ),
    .binaryTarget(
      name: "Google-Mobile-Ads-SDK_UserMessagingPlatform",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/Google-Mobile-Ads-SDK_UserMessagingPlatform.xcframework.zip",
      checksum: "9db874d4568f0594fcfa8029623c05f977ba9fb52232a71d91aa7baeae61f608"
    ),
    .binaryTarget(
      name: "GoogleSignIn_AppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/GoogleSignIn_AppAuth.xcframework.zip",
      checksum: "cd8b853fc88cd9ed78ca48ce1c596830be060ded68785b2c8930b964c4bcb031"
    ),
    .binaryTarget(
      name: "GoogleSignIn_GTMAppAuth",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/GoogleSignIn_GTMAppAuth.xcframework.zip",
      checksum: "54633637a2f47b8dabe01cfa25d4da2f4ee6c3c546f09c145031e608c37b3c70"
    ),
    .binaryTarget(
      name: "GoogleSignIn_GTMSessionFetcher",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/GoogleSignIn_GTMSessionFetcher.xcframework.zip",
      checksum: "98ac9b9dadfd9a9bb125bb759a40f1c82fafaf206ae3337bb4d3a5e44cf7c005"
    ),
    .binaryTarget(
      name: "GoogleSignIn_GoogleSignIn",
      url: "https://github.com/akaffenberger/firebase-ios-sdk-xcframeworks/releases/download/8.10.0/GoogleSignIn_GoogleSignIn.xcframework.zip",
      checksum: "4d1b7301f24677914cefad2d6cf5d9e0c66733c6b1935a8ddbaf4f27da093366"
    )
  ]
)
