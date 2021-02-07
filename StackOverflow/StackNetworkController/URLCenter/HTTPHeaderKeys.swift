//
//  HTTPHeaderKeys.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import Foundation

@frozen enum HeaderKeys {
    
    enum Name {
        static let accept       = "Accept"
        static let contentType  = "Content-Type"
    }
    
    enum Values {
        static let accept       = "application/json"
        static let contentType  = "application/json"
    }
}
