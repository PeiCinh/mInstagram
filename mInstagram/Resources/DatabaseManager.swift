//
//  DatabaseManager.swift
//  mInstagram
//
//  Created by Huang YangChing on 2022/2/11.
//

import FirebaseDatabase

public class DatabaseManager{
    static let shared = DatabaseManager()
    
    private let database = Database.database(url: "https://instagram-bc3cb-default-rtdb.asia-southeast1.firebasedatabase.app").reference()
    
    ///Check if username and email is available
    ///- Parameters
    ///         - email: String representing email
    ///         - username: String representing username
    public func canCreateNewUser(with email:String,username:String,completion:(Bool)->Void){
        completion(true)
    }
    
    ///Inserts new user data to database
    ///- Parameters
    ///         - email: String representing email
    ///         - username: String representing username
    ///         - completion: async callvack for result if database entry succeeded
    public func inserNewUser(with email:String, username:String,completion: @escaping (Bool)->Void){
        let key = email.safeDatabaseKey()
        database.child(key).setValue(["username":username],withCompletionBlock: { error,_ in
            if error == nil{
                //succeeded
                completion(true)
                return
            }else{
                completion(false)
                return
            }
        })
    }
    
    //MARK: - Private
}
