//
//  NetworkError.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import Foundation

enum NetworkError: Error {
    case `default`
    case statusCode
    case invalidURL
    case invalidCredentials
    case noData
    case network
    case noServiceRegistered
    case custom(String)
    
    static func map(_ error: Error) -> NetworkError {
        return (error as? NetworkError) ?? .custom(error.localizedDescription)
    }
}
