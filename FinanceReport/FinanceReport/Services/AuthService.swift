//
//  AuthService.swift
//  FinanceReport
//
//  Created by Олег Попов on 21.03.2022.
//

import Foundation
import FirebaseAuth

class AuthService {
    
    static let shared = AuthService()
    
    private let auth = Auth.auth()
    
    private var currentUser : User? {
        return auth.currentUser
    }
    
    private init() {}
    
    func signUp(email: String?, password: String?, completion: @escaping(Result<User, Error>) -> Void) {
        
        guard let email = email else {
            completion(.failure(MyErrors.invalidEmail))
            return
        }
        
        guard let password = password else {
            completion(.failure(MyErrors.invalidPassword))
            return
        }
        
        auth.createUser(withEmail: email,
                        password: password) {
            result, error in
            
            if let result = result {
                completion(.success(result.user))
            } else if let error = error {
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }
}

enum MyErrors: Error {
    
case invalidEmail
case invalidPassword
}
