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
        try AuthenticationManager.shared.signOut()
    }
    
    func resetPassword() async throws{
        let authUser = try AuthenticationManager.shared.getAuthenticatedUser()
        guard let email = authUser.email else {
            
            throw  URLError(.fileDoesNotExist)
            return
        }
        try await AuthenticationManager.shared.resetPassword(email: email)
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
            
            Button("Reset Password") {
                Task {
                    do {
                        try viewModel
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
