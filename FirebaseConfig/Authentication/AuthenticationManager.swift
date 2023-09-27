//
//  AuthenticationManager.swift
//  FirebaseConfig
//
//  Created by Salih on 26.09.2023.
//

import Foundation
import Firebase
import FirebaseAuth
struct AuthDataResultModel {
    let uid:String?
    let email:String?
    let photoURL:String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.photoURL = user.photoURL?.absoluteString
    }
}


final class AuthenticationManager {
    
    static let shared = AuthenticationManager()
    private init(){}
    
    func getAuthenticatedUser(){
        
    }
    // MARK: - create User
    func createUser(email:String,password:String) async throws -> AuthDataResultModel{
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthDataResultModel(user: authDataResult.user)
    }
    
}
