//
//  SearchResultModel.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import Foundation

struct Questions: Codable {
    var items: [Question]?
    var hasMore: Bool?
    var quotaMax, quotaRemaining: Int?

    enum CodingKeys: String, CodingKey {
        case items
        case hasMore = "has_more"
        case quotaMax = "quota_max"
        case quotaRemaining = "quota_remaining"
    }
}
