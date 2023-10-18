//
//  SignInEmailView.swift
//  FirebaseConfig
//
//  Created by Salih on 26.09.2023.
//

import SwiftUI

final class SignInEmailViewModel:ObservableObject {
    @Published var email = ""
    @Published var pasword = ""
    
    func signUp(){
        guard  !email.isEmpty,!pasword.isEmpty else {
            print("No email or no password found")
            return
        }
    }
    
    func signIn() async throws {
        guard !email.isEmpty, !pasword.isEmpty else {
            print("Error Empty tf")
            return
        }
        let returnedUserData = try await AuthenticationManager.shared.createUser(email: email, password: pasword)

    }
}

struct SignInEmailView: View {
   @StateObject private var viewModel = SignInEmailViewModel()
    @Binding var showSignInView:Bool
    var body: some View {
        
        VStack {
            TextField("Email", text: $viewModel.email)
                .padding()
                .background(Color.gray.opacity(0.5))
                .cornerRadius(15)
            SecureField("Pasword",text: $viewModel.pasword)
                .padding()
                .background(Color.gray.opacity(0.5))
                .cornerRadius(15)
            
                
            Button(action: {
                Task {
                    do {
                        try await viewModel.signUp()
                        showSignInView = false
                        return
                    } catch {
                        print(error)
                    }
                    do {
                        try await viewModel.signIn()
                        showSignInView = false
                        return
                    } catch {
                        print(error)
                    }
                }
            }, label: {
                Text("Sign In")
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .cornerRadius(15)
            })
            
        }
        .padding()
        .navigationTitle("Sıgn In with Email")
        
    }
}

#Preview {
    NavigationStack {
        SignInEmailView(showSignInView: .constant(false))
            
    }
}
