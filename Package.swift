// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

// Copyright 2020 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import PackageDescription

let firebaseVersion = "8.10.0"

let package = Package(
  name: "Firebase",
  platforms: [.iOS(.v11), .macOS(.v10_12), .tvOS(.v12), .watchOS(.v7)],
  products: [
//    .library(
//      name: "FirebaseAnalytics",
//      targets: ["FirebaseAnalytics", "FirebaseCore"]
//    ),
//    .library(
//      name: "FirebaseAnalyticsWithoutAdIdSupport",
//      targets: ["FirebaseAnalyticsWithoutAdIdSupportTarget"]
//    ),
//    .library(
//      name: "FirebaseAnalyticsSwift-Beta",
//      targets: ["FirebaseAnalyticsSwiftTarget"]
//    ),
//    .library(
//      name: "FirebaseAuth",
//      targets: ["FirebaseAuth"]
//    ),
//    .library(
//      name: "FirebaseAppCheck",
//      targets: ["FirebaseAppCheck"]
//    ),
//    .library(
//      name: "FirebaseAppDistribution-Beta",
//      targets: ["FirebaseAppDistributionTarget"]
//    ),
//    .library(
//      name: "FirebaseAuthCombine-Community",
//      targets: ["FirebaseAuthCombineSwift"]
//    ),
//    .library(
//      name: "FirebaseFirestoreCombine-Community",
//      targets: ["FirebaseFirestoreCombineSwift"]
//    ),
//    .library(
//      name: "FirebaseFunctionsCombine-Community",
//      targets: ["FirebaseFunctionsCombineSwift"]
//    ),
//    .library(
//      name: "FirebaseStorageCombine-Community",
//      targets: ["FirebaseStorageCombineSwift"]
//    ),
//    .library(
//      name: "FirebaseCrashlytics",
//      targets: ["FirebaseCrashlytics"]
//    ),
//    .library(
//      name: "FirebaseDatabase",
//      targets: ["FirebaseDatabase"]
//    ),
//    .library(
//      name: "FirebaseDatabaseSwift-Beta",
//      targets: ["FirebaseDatabaseSwift"]
//    ),
//    .library(
//      name: "FirebaseDynamicLinks",
//      targets: ["FirebaseDynamicLinksTarget"]
//    ),
//    .library(
//      name: "FirebaseFirestore",
//      targets: ["FirebaseFirestoreTarget"]
//    ),
//    .library(
//      name: "FirebaseFirestoreSwift-Beta",
//      targets: ["FirebaseFirestoreSwiftTarget"]
//    ),
//    .library(
//      name: "FirebaseFunctions",
//      targets: ["FirebaseFunctions"]
//    ),
//    .library(
//      name: "FirebaseInAppMessaging-Beta",
//      targets: ["FirebaseInAppMessagingTarget"]
//    ),
//    .library(
//      name: "FirebaseInAppMessagingSwift-Beta",
//      targets: ["FirebaseInAppMessagingSwift"]
//    ),
//    .library(
//      name: "FirebaseInstallations",
//      targets: ["FirebaseInstallations"]
//    ),
//    .library(
//      name: "FirebaseMessaging",
//      targets: ["FirebaseMessaging"]
//    ),
//    .library(
//      name: "FirebaseMLModelDownloader",
//      targets: ["FirebaseMLModelDownloader"]
//    ),
//    .library(
//      name: "FirebasePerformance",
//      targets: ["FirebasePerformanceTarget"]
//    ),
//    .library(
//      name: "FirebaseRemoteConfig",
//      targets: ["FirebaseRemoteConfig"]
//    ),
//    .library(
//      name: "FirebaseStorage",
//      targets: ["FirebaseStorage"]
//    ),
//    .library(
//      name: "FirebaseStorageSwift-Beta",
//      targets: ["FirebaseStorageSwift"]
//    ),
  ],
  dependencies: [
  ],
  targets: [
    .binaryTarget(
      name: "FirebaseAnalytics",
      path: "FirebaseAnalytics/FirebaseAnalytics.xcframework"
    ),
    .binaryTarget(
      name: "FirebaseCore",
      path: "FirebaseAnalytics/FirebaseCore.xcframework"
    ),
  ]
)
