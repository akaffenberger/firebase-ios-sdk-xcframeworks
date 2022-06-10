//
//  iOS_ExampleApp.swift
//  iOS Example
//
//  Created by Ashleigh Kaffenberger on 12/6/21.
//

import SwiftUI

@main
struct iOS_ExampleApp: App {
    @UIApplicationDelegateAdaptor var delegate: AppDelegate
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                List {
                    NavigationLink("Firestore") {
                        FirestoreView()
                            .navigationTitle("Firestore")
                    }
                    
                    NavigationLink("In App Messaging") {
                        InAppMessageView()
                            .navigationTitle("In App Messaging")
                    }
                    
                    NavigationLink("Google Sign In") {
                        SignInView()
                            .navigationTitle("Google Sign In")
                    }
                }
                .navigationBarHidden(true)
                .navigationViewStyle(.stack)
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
