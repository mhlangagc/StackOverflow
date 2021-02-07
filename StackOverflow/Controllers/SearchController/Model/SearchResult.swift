//
//  SearchResultModel.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import Foundation

struct SearchResult: Codable {
    let questions: [Question]
    let hasMore: Bool

    enum CodingKeys: String, CodingKey {
        case questions = "items"
        case hasMore = "has_more"
    }
}
