//
//  SignInView.swift
//  iOS Example
//
//  Created by Ashleigh Kaffenberger on 6/10/22.
//

import SwiftUI
import GoogleSignIn

struct SignInView: View {
    var body: some View {
        GoogleSignInButton()
    }
}

struct GoogleSignInButton: UIViewRepresentable {
    @Environment(\.colorScheme) var colorScheme

    func makeUIView(context: Context) -> GIDSignInButton {
        return GIDSignInButton()
    }

    func updateUIView(_ uiView: GIDSignInButton, context: Context) {
        switch colorScheme {
            case .dark:
                uiView.colorScheme = .dark
            case .light:
                uiView.colorScheme = .light
            @unknown default:
                fatalError()
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
            .preferredColorScheme(.light)
    }
}
