//
//  URLPath.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import Foundation

enum URLPath {
    case search(searchQuery: String)
    
    func buildURL() -> String {
        switch self {
        case .search(let searchQuery):
            return "\(searchQuery)"
        }
    }
}
