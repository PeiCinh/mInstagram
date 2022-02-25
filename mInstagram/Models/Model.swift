//
//  Model.swift
//  mInstagram
//
//  Created by Huang YangChing on 2022/2/25.
//

import Foundation
enum Gender {
    case male, female, other
}
struct User{
    let username:String
    let bio:String
    let nane: (first: String,last: String)
    let birthDate :Date
    let gender: Gender
    let counts: UserCount
    let joinDate :Date
}

struct UserCount {
    let followers: Int
    let following:Int
    let posts:Int
}

public enum UserPostType{
    case photo,video
}

public struct UserPost{
    let identifier:String
    let postType:UserPostType
    let thumbnailImage:URL
    let caption:String?
    let likeCount: [PostLikes]
    let comments :[PostComment]
    let createDate:Date
    let taggeUser :[User]
}

struct PostLikes {
    let username : String
    let postIdentifier : String
}

struct CommentLike {
    let username : String
    let commentIdentifier : String
}

struct PostComment{
    let username:String
    let text:String
    let createDate:Date
    let likes: [CommentLike]
}
