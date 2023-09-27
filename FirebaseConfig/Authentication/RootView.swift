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
                AuthenticationView()
            }
        }
        .onAppear {
            
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
