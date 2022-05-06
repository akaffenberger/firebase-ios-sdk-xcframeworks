//
//  InAppMessageView.swift
//  iOS Example
//
//  Created by Ashleigh Kaffenberger on 5/6/22.
//

import SwiftUI
import Firebase

struct InAppMessageView: View {
    var body: some View {
        VStack(alignment: .center) {
            VStack(spacing: 0) {
                Text("In App Message")
                Text("(limited to once per day)")
            }
            .padding()
        
            Button("Trigger In App Message") {
                Analytics.logEvent("in_app_message", parameters: nil)
            }
            .padding()
        }
    }
}

struct InAppMessageView_Previews: PreviewProvider {
    static var previews: some View {
        InAppMessageView()
    }
}
