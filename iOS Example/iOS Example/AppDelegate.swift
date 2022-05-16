//
//  AppDelegate.swift
//  iOS Example
//
//  Created by Ashleigh Kaffenberger on 5/16/22.
//

import Foundation
import Firebase
import FirebaseInAppMessaging
import FirebaseDynamicLinks

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseOptions.defaultOptions()?.deepLinkURLScheme = "example"
        FirebaseApp.configure()
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        let dynamicLink = DynamicLinks.dynamicLinks().dynamicLink(fromCustomSchemeURL: url)

        if dynamicLink != nil {
          if dynamicLink?.url != nil {
            // Handle the deep link. For example, show the deep-linked content,
            // apply a promotional offer to the user's account or show customized onboarding view.
            // ...
          } else {
            // Dynamic link has empty deep link. This situation will happens if
            // Firebase Dynamic Links iOS SDK tried to retrieve pending dynamic link,
            // but pending link is not available for this device/App combination.
            // At this point you may display default onboarding view.
          }
          return true
        }
        return false
    }
}
