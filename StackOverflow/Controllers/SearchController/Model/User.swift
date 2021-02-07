//
//  User.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import Foundation

struct User: Codable {
    
    let userID: Int
    let userType: String
    let displayName: String
    let profileImageURL: String?
    let link: String?
    let reputation: Int
    
    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case userType = "user_type"
        case displayName = "display_name"
        case profileImageURL = "profile_image"
        case link, reputation
    }
}
