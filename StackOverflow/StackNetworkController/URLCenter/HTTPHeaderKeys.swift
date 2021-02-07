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
        static let productID    = "x-productid"
        static let regionCode   = "X-Region-Code"
        static let authorization = "authorization"
        static let userToken    = "X-UserToken"
        static let xKey         = "x-Key"
        static let userName     = "x-username"
        static let refreshUserToken = "X-RefreshUserToken"
    }
    
    enum Values {
        static let accept       = "application/json"
        static let contentType  = "application/json"
    }
}

@frozen enum ParameterKeys {
    static let userToken    = "userToken"
    static let refreshToken = "refreshToken"
    static let accessToken  = "accessToken"
}
