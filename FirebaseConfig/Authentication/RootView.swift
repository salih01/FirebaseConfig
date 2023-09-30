//
//  RootView.swift
//  FirebaseConfig
//
//  Created by Salih on 26.09.2023.
//

import SwiftUI

struct RootView: View {
    @State private var showSignInView:Bool = false
    
    var body: some View {
        ZStack {
            NavigationStack {
                SettingsView(showSignInView: $showSignInView)
            }
        }
        .onAppear {
            let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
            self.showSignInView = authUser == nil ? true : false
        }
        .fullScreenCover(isPresented: $showSignInView, content: {
            NavigationStack {
                AuthenticationView()
                
            }
        })
    }
}

#Preview {
    RootView()
}
