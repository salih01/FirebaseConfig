//
//  AuthenticationView.swift
//  FirebaseConfig
//
//  Created by Salih on 26.09.2023.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift
import FirebaseAuth

struct GoogleSignresultModel {
    let idToken:String
    let accessToken:String
}


@MainActor
final class AuthenticationViewModel:ObservableObject {
    
    func signInGoogle() async throws {
        guard let topVC = Utilities.topViewController() else {
            throw URLError(.cannotFindHost)
        }
        
        let gidSignInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: topVC)
        
        guard let idToken:String = gidSignInResult.user.idToken?.tokenString else {
            throw URLError(.badServerResponse)
        }
        let accessToken:String = gidSignInResult.user.accessToken.tokenString
        
        

        
    }
}
struct AuthenticationView: View {
    
    @Binding var showSignInView:Bool
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

