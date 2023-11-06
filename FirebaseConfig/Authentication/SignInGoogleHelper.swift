//
//  SignInGoogleHelper.swift
//  FirebaseConfig
//
//  Created by Salih on 6.11.2023.
//

import Foundation
import GoogleSignIn
import GoogleSignInSwift

struct GoogleSignresultModel {
    let idToken:String
    let accessToken:String
}

final class SignInGoogleHelper {
    
    @MainActor
    func signIn() async throws -> GoogleSignresultModel {
        guard let topVC = Utilities.topViewController() else {
            throw URLError(.cannotFindHost)
        }
        
        let gidSignInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: topVC)
        guard let idToken:String = gidSignInResult.user.idToken?.tokenString else {
            throw URLError(.badServerResponse)
        }
        let accessToken:String = gidSignInResult.user.accessToken.tokenString
        // tokens
        let tokens = GoogleSignresultModel(idToken: idToken, accessToken: accessToken)
        
        return tokens
    }
    
}
