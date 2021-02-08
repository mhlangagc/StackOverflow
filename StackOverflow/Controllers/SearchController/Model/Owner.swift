//
//  User.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import Foundation

enum UserType: String, Codable {
    case registered = "registered"
}

struct Owner: Codable {
    var reputation, userID: Int?
    var userType: UserType?
    var acceptRate: Int?
    var profileImage: String?
    var displayName: String?
    var link: String?

    enum CodingKeys: String, CodingKey {
        case reputation
        case userID         = "user_id"
        case userType       = "user_type"
        case acceptRate     = "accept_rate"
        case profileImage   = "profile_image"
        case displayName    = "display_name"
        case link
    }
}
