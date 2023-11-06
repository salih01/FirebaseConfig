//
//  AuthenticationView.swift
//  FirebaseConfig
//
//  Created by Salih on 26.09.2023.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift


@MainActor
final class AuthenticationViewModel:ObservableObject {
    
    func signInGoogle() async throws {
        let helper = SignInGoogleHelper()
        let tokens = try await helper.signIn()
        try await AuthenticationManager.shared.signInWithGoogle(tokens: tokens)

        
    }
}
struct AuthenticationView: View {
    
    @Binding var showSignInView:Bool
    @StateObject private var viewModel = AuthenticationViewModel()
    var body: some View {

        VStack {
            NavigationLink {
                SignInEmailView(showSignInView: $showSignInView)
            } label: {
                Text("Sign In")
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .cornerRadius(15)
                    .padding(10)
                
            }
            GoogleSignInButton(viewModel: GoogleSignInButtonViewModel(scheme: .dark,style: .standard,state: .normal)) {
                Task {
                    do {
                        try await viewModel.signInGoogle()
                        showSignInView = false
                    } catch {
                        print(error.localizedDescription)
                    }
                }
                
            }
            .padding()
            Spacer()
        }.navigationTitle("Sıgn In")
        
    }
}

#Preview {
    NavigationStack {
        AuthenticationView(showSignInView: .constant(false))
    }
}

