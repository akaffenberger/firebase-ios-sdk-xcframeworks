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
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_AppAuth.xcframework.zip",
      checksum: "7cc37581bca6433e2626482fdce3e72f09964dd9626d22bfe7d16c3cc28c09dc"
    ),
    .binaryTarget(
      name: "_BoringSSL-GRPC",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_BoringSSL-GRPC.xcframework.zip",
      checksum: "ba326adc41d30307b9a5c543ded18ba9583e20583aa44d06d4aa8f11bf6a2ff8"
    ),
    .binaryTarget(
      name: "_FBLPromises",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_FBLPromises.xcframework.zip",
      checksum: "f5810e18a6efa77327ccadd892387fcbacba239b65e6f8052e0d29434a66ceef"
    ),
    .binaryTarget(
      name: "_FirebaseABTesting",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_FirebaseABTesting.xcframework.zip",
      checksum: "eff01036c8875e0ed53f5cd7b4861b2833a0b289994f72cf210a50b92a47956c"
    ),
    .binaryTarget(
      name: "_FirebaseAnalytics",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_FirebaseAnalytics.xcframework.zip",
      checksum: "12822f437a2d0c4fff978c6926c9d8bf7c42f4ddedbded68db474b509a546d07"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsOnDeviceConversion",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_FirebaseAnalyticsOnDeviceConversion.xcframework.zip",
      checksum: "cf6a5e5b5df17c4dc6b69219836edf95d137e9058de8ba0dcde4b05e8eaa3c3a"
    ),
    .binaryTarget(
      name: "_FirebaseAnalyticsSwift",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_FirebaseAnalyticsSwift.xcframework.zip",
      checksum: "161a4b13f75b74ae813b0c1195710ac040e1dbdd2d31f32b901657926aabed0c"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheck",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_FirebaseAppCheck.xcframework.zip",
      checksum: "e89b1280ec8e0f26d9f71bc036db9f1a9ed61a53fc2859784a70d4c89dd950a4"
    ),
    .binaryTarget(
      name: "_FirebaseAppCheckInterop",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_FirebaseAppCheckInterop.xcframework.zip",
      checksum: "e74b937e9ba810c60d79f155128b7a7d3339d0b6cb96cd85f0507534abaece7e"
    ),
    .binaryTarget(
      name: "_FirebaseAppDistribution",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_FirebaseAppDistribution.xcframework.zip",
      checksum: "73a27c898cf0ab8451fbffb73cb9f7ca8a3cbcd8adb86d0d7d7aacfaf3f4a99b"
    ),
    .binaryTarget(
      name: "_FirebaseAuth",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_FirebaseAuth.xcframework.zip",
      checksum: "0a1fa66d1af1966dc8198af7977ddb3765c066d1fb6998b74b5aad2c1d8833ed"
    ),
    .binaryTarget(
      name: "_FirebaseAuthInterop",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_FirebaseAuthInterop.xcframework.zip",
      checksum: "b9f20d770f9817165942692ddcfde6fd8da1f09acd725a1681241c19540673ff"
    ),
    .binaryTarget(
      name: "_FirebaseCore",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_FirebaseCore.xcframework.zip",
      checksum: "b567b25122fd4bcfd9848b6ac9f5f3ae36e1515678f218418ef94335d100d56c"
    ),
    .binaryTarget(
      name: "_FirebaseCoreExtension",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_FirebaseCoreExtension.xcframework.zip",
      checksum: "7b7e926255370fe19a7de761ae4b06ddb71851b80bd831e5a440422702c85786"
    ),
    .binaryTarget(
      name: "_FirebaseCoreInternal",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_FirebaseCoreInternal.xcframework.zip",
      checksum: "856892c3f4219431a56dae60a6dc0f35e39abe2890ccd7eb136792f9361afd96"
    ),
    .binaryTarget(
      name: "_FirebaseCrashlytics",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_FirebaseCrashlytics.xcframework.zip",
      checksum: "5f317ab41f201d38b16c4fdf81511edaa14cc413c37173bddbb77d06861f5060"
    ),
    .binaryTarget(
      name: "_FirebaseDatabase",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_FirebaseDatabase.xcframework.zip",
      checksum: "c417b89a4ebf3812a3b4487f3acac917f7131a51d25c06e4759676b2252d259b"
    ),
    .binaryTarget(
      name: "_FirebaseDatabaseSwift",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_FirebaseDatabaseSwift.xcframework.zip",
      checksum: "7d675a9f0021b38769ee58dae1d0708b02e5fea650e897ee275c8a010f59031c"
    ),
    .binaryTarget(
      name: "_FirebaseDynamicLinks",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_FirebaseDynamicLinks.xcframework.zip",
      checksum: "3261f5969c94f7d0a5f08995f4e49dab6dfbf045944a8c0bf5eb91a56f19daa6"
    ),
    .binaryTarget(
      name: "_FirebaseFirestore",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_FirebaseFirestore.xcframework.zip",
      checksum: "5f80f341b49b9927968fb6b9d620625e0b725f6b56816a15568259fdfdaf89d7"
    ),
    .binaryTarget(
      name: "_FirebaseFirestoreSwift",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_FirebaseFirestoreSwift.xcframework.zip",
      checksum: "70a923ec7e779435695480b129721314556fd50a31f0b1e8e2e48d0aace8af46"
    ),
    .binaryTarget(
      name: "_FirebaseFunctions",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_FirebaseFunctions.xcframework.zip",
      checksum: "6f15d3e11e640daf5c0780a69d30af00b3208446523e36e7ce6a47d6cf129eeb"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessaging",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_FirebaseInAppMessaging.xcframework.zip",
      checksum: "93619228629c1df336671e150828d3c16bf0efea91961559336cc7b8fd2712d2"
    ),
    .binaryTarget(
      name: "_FirebaseInAppMessagingSwift",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_FirebaseInAppMessagingSwift.xcframework.zip",
      checksum: "d951658ec251e3c6fc30e65bc3fddb7b85e096aeed900496703429687166ddc3"
    ),
    .binaryTarget(
      name: "_FirebaseInstallations",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_FirebaseInstallations.xcframework.zip",
      checksum: "19e17834d63deb168d884e2620e9df3cb22b6b88b57b594dae4983cad70c5775"
    ),
    .binaryTarget(
      name: "_FirebaseMLModelDownloader",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_FirebaseMLModelDownloader.xcframework.zip",
      checksum: "55273b28343ca36a44f58589b896cb6023bfbe233bf8034c0b1ff8ccc8203fb8"
    ),
    .binaryTarget(
      name: "_FirebaseMessaging",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_FirebaseMessaging.xcframework.zip",
      checksum: "dfbf2f8121f1c91790d96b54a1e091704ead2e5b49a4490d27140e865790072e"
    ),
    .binaryTarget(
      name: "_FirebaseMessagingInterop",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_FirebaseMessagingInterop.xcframework.zip",
      checksum: "fb987d734f643ddb296561199a6c2224f4e286194150534056504919153a281a"
    ),
    .binaryTarget(
      name: "_FirebasePerformance",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_FirebasePerformance.xcframework.zip",
      checksum: "1c71c6baee2053d925fd28eb125600401147de7c26164096f55644c729b54c99"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfig",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_FirebaseRemoteConfig.xcframework.zip",
      checksum: "10e88465c3aa2cbcab71f60111ae7436aa8d310698ec1abd78ec22a4daaa723b"
    ),
    .binaryTarget(
      name: "_FirebaseRemoteConfigSwift",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_FirebaseRemoteConfigSwift.xcframework.zip",
      checksum: "228ea6bc19ee0837b6bf9f1d4f696af2ae8d917db26280e50d1d2dc906762765"
    ),
    .binaryTarget(
      name: "_FirebaseSessions",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_FirebaseSessions.xcframework.zip",
      checksum: "2d23ea2ff12cd7810670cf4ea8f71a6e03c6d87ba295347334c2b3f70e89d845"
    ),
    .binaryTarget(
      name: "_FirebaseSharedSwift",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_FirebaseSharedSwift.xcframework.zip",
      checksum: "a73c613261c1e0f238a8bc716b6dee0c0cbfbf8a43c7a0a2e3751ab622da93f5"
    ),
    .binaryTarget(
      name: "_FirebaseStorage",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_FirebaseStorage.xcframework.zip",
      checksum: "313ebb95f0df5bb9c7ab40bfcf04e9a86ea7fc45e57dacbb1800fcd17c4f4c55"
    ),
    .binaryTarget(
      name: "_GTMAppAuth",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_GTMAppAuth.xcframework.zip",
      checksum: "0f26e2f9aa448a7493c0afd132a6728cef046bc59ea7528f2e29493bd6f8ea75"
    ),
    .binaryTarget(
      name: "_GTMSessionFetcher",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_GTMSessionFetcher.xcframework.zip",
      checksum: "1b89f0409ff4dad0d73ebcbbca886a98378fe2ecaeaafc87b0b75f55a26ae331"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurement",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_GoogleAppMeasurement.xcframework.zip",
      checksum: "ef48ca8c20ef9e349e0a96c2ae17dadb8fb0be785ae20c0081a47f54790c032d"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementIdentitySupport",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_GoogleAppMeasurementIdentitySupport.xcframework.zip",
      checksum: "51379bd72a1034179e08b12fc2bae9e901b68f64aa594100afec3defddd4b0b4"
    ),
    .binaryTarget(
      name: "_GoogleAppMeasurementOnDeviceConversion",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_GoogleAppMeasurementOnDeviceConversion.xcframework.zip",
      checksum: "8ff1fbf83c6b53bbbe11b061f0978daa3c1a19fa335165c6f0d12ed0d3df4f54"
    ),
    .binaryTarget(
      name: "_GoogleDataTransport",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_GoogleDataTransport.xcframework.zip",
      checksum: "91e6b92b025089a7e04378772867744a6c0e8ad436959f9ef5e3d1d9cac92ad3"
    ),
    .binaryTarget(
      name: "_GoogleMobileAds",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_GoogleMobileAds.xcframework.zip",
      checksum: "b8e0d3399609f17fbe75c60dda456b2be75350b631224dc7dbdb4eca2660672b"
    ),
    .binaryTarget(
      name: "_GoogleSignIn",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_GoogleSignIn.xcframework.zip",
      checksum: "22afdbf694ea3b296c6cf5af2d91e3433385e7bef5cc0071b148927006fb61bf"
    ),
    .binaryTarget(
      name: "_GoogleUtilities",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_GoogleUtilities.xcframework.zip",
      checksum: "a7a840b78e1a07b98253108dfbf07cc3622c4eb4b7b71d13905b68cfe2caec00"
    ),
    .binaryTarget(
      name: "_PromisesSwift",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_PromisesSwift.xcframework.zip",
      checksum: "2ad9e90a51476255ba4f99e0bb24692dab4c41419256b31ce57582c0363c19bd"
    ),
    .binaryTarget(
      name: "_SwiftProtobuf",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_SwiftProtobuf.xcframework.zip",
      checksum: "99dadebe433a6bc3ee6f91e8e794c0eec8ac46e664528fa301ace76b929dabe8"
    ),
    .binaryTarget(
      name: "_UserMessagingPlatform",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_UserMessagingPlatform.xcframework.zip",
      checksum: "49ab856562f177af8741c70cae6edfc7573527bdaab52cb05e6f5b5c5b6058f6"
    ),
    .binaryTarget(
      name: "_abseil",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_abseil.xcframework.zip",
      checksum: "a89eba123f4e0bbbe0a8140f43f621472529feb5dcedd9f6e8bd329fc554256f"
    ),
    .binaryTarget(
      name: "_gRPC-C++",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_gRPC-C++.xcframework.zip",
      checksum: "8f9d0c32627c8050fc46bccaddc2fb52f0bcd01eddbe61aec568551922dd69f6"
    ),
    .binaryTarget(
      name: "_gRPC-Core",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_gRPC-Core.xcframework.zip",
      checksum: "d285d8722aab6ba57217bf6adb1336a66dbf0ca74ea01284f783b7e62b36be7c"
    ),
    .binaryTarget(
      name: "_leveldb-library",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_leveldb-library.xcframework.zip",
      checksum: "e327316333a419da25631fa897cf07c3d00feabdb3877dbdb07103d00bfd3381"
    ),
    .binaryTarget(
      name: "_nanopb",
      url: "https://github.com/Q42/firebase-ios-sdk-xcframeworks/releases/download/10.10.0/_nanopb.xcframework.zip",
      checksum: "21bb5bf6a957e8fe0705b86f60544dddcf2cc517a488ffa9ee7bfc2e93a224e4"
    )
  ]
)
    