//
//  StorageManager.swift
//  mInstagram
//
//  Created by Huang YangChing on 2022/2/11.
//

import FirebaseStorage
import Foundation

public class StorageManager{
    static let shared = StorageManager()
    
    private let bucket = Storage.storage().reference()
    
    public enum IGStorageManageError : Error{
        case FailedToDownload
    }
    //MARK: - Public
    
    public func uploadUserPhotoPost(model:UserPost,completion: @escaping(Result<URL,Error>) -> Void){
        
    }
    
    
    public func downloadImage(with reference:String, completion: @escaping (Result<URL,IGStorageManageError   >) -> Void){
        bucket.child(reference).downloadURL(completion: {url,error in
            guard let url = url,error == nil else {
                completion(.failure(.FailedToDownload))
                return
            }
            completion(.success(url))
        })
    }
}

public enum UserPostType{
    case photo,video
}
public struct UserPost{
    let postType:UserPostType
    
}
