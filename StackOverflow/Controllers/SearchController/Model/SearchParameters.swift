//
//  SearchParameters.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/08.
//

import Foundation

struct SearchParameters: Codable {
    var title: String
    var pageSize: String
    var order: String
    var sort: String
    var site: String
    var filter: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case pageSize   = "user_id"
        case order      = "user_type"
        case sort       = "accept_rate"
        case site       = "profile_image"
        case filter     = "display_name"
    }
}
