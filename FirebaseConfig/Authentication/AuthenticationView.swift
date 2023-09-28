//
//  AuthenticationView.swift
//  FirebaseConfig
//
//  Created by Salih on 26.09.2023.
//

import SwiftUI

struct AuthenticationView: View {
    var body: some View {

        VStack {
            NavigationLink {
                SignInEmailView()
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
            Spacer()
        }.navigationTitle("Sıgn In")
        
    }
}

#Preview {
    NavigationStack {
        AuthenticationView()
    }
}

