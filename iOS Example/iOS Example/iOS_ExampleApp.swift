//
//  iOS_ExampleApp.swift
//  iOS Example
//
//  Created by Ashleigh Kaffenberger on 12/6/21.
//

import SwiftUI

@main
struct iOS_ExampleApp: App {
    @UIApplicationDelegateAdaptor var delegate: InAppMessagingAppDelegate
    
    var body: some Scene {
        WindowGroup {
            InAppMessageView()
        }
    }
}
