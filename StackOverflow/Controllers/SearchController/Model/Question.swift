//
//  Question.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import Foundation

struct Question: Codable {
    
    var id: Int
    var owner: User
    var title: String
    var body: String
    let tags: [String]?
    var isAnswered: Bool
    var viewCount: Int
    var answerCount: Int
    var votes: Int
    var dateCreated: Date
    var lastEditDate: Date?
    var lastActivityDate: Date?
    
    enum CodingKeys: String, CodingKey {
        case id             = "question_id"
        case owner, title, body
        case tags
        case isAnswered     = "is_answered"
        case viewCount      = "view_count"
        case answerCount    = "answer_count"
        case votes          = "score"
        case dateCreated    = "creation_date"
        case lastEditDate   = "last_edit_date"
        case lastActivityDate = "last_activity_date"
    }
}
