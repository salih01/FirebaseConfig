//
//  SettingsView.swift
//  FirebaseConfig
//
//  Created by Salih on 28.09.2023.
//

import SwiftUI

@MainActor
final class SettingsViewModel:ObservableObject {
    
    func signOut() throws{
        try AuthenticationManager.shared.signAuth()
    }
}


struct SettingsView: View {
    @StateObject private var viewModel = SettingsViewModel()
    @Binding var showSignInView:Bool
    var body: some View {
        List {
            Button("Log out") {
                Task {
                    do {
                        try viewModel.signOut()
                        showSignInView = true
                    } catch {
                        
                    }
                }
            }

        }
        .navigationBarTitle("Settings")
    }
}

#Preview {
    NavigationStack{
        SettingsView(showSignInView: .constant(false))
    }
}
