//
//  AuthManager.swift
//  mInstagram
//
//  Created by Huang YangChing on 2022/2/11.
//

import FirebaseAuth

public class AuthManager{
    static let shared = AuthManager()
    
    //MARK: - Public
    public func registerNewUser(username:String, email:String, password:String, completion: @escaping (Bool) -> Void){
        /*
         - Check if username is available
         - Check if email is available
         - Create account
         - 
         */
        DatabaseManager.shared.canCreateNewUser(with: email, username: username){ canCreate in
            if canCreate{
                /*
                 - Create account
                 - Insert account to database
                 */
                Auth.auth().createUser(withEmail: email, password: password){result,error in
                    guard error == nil, result != nil else{
                        completion(false)
                        return
                    }
                    
                    DatabaseManager.shared.inserNewUser(with: email, username: username){inserted in
                        if inserted{
                            completion(true)
                            return
                        }else{
                            completion(false)
                            return
                        }
                    }
                }
            }else{
                completion(false)
            }
        }
    }
    
    public func loginUser(username: String?, email:String?,password:String,completion: @escaping(Bool) -> Void){
        if let email = email {
            // email log in
            Auth.auth().signIn(withEmail: email, password: password){ authResult, error in
                guard authResult != nil,error == nil else{
                    completion(false)
                    return
                }
                completion(true)
            }
        }
        else if let username = username {
            // username log in
            print(username)
        }
    }
}

