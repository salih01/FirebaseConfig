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
    
    func signIn() {
        guard !email.isEmpty, !pasword.isEmpty else {
            print("Error Empty tf")
            return
        }
        Task {
            do {
                let result = try await AuthenticationManager.shared.createUser(email: email, password: pasword)
                print("kullanıcı oluşturulurken alınan hata --->\(result)")

            } catch {
                print("Hatalı işlem")
            }
        }
    }
}

struct SignInEmailView: View {
   @StateObject private var viewModel = SignInEmailViewModel()
    
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
                viewModel.signIn()
            }, label: {
                Text("Sign In")
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .cornerRadius(15)
            })
            
        }
        .padding()
        .navigationTitle("Sıgn In with Email")
        
    }
}

#Preview {
    NavigationStack {
        SignInEmailView()
            
    }
}
