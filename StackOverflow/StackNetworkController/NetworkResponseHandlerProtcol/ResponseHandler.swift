//
//  ResponseHandler.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import Foundation

protocol NetworkResponseHandlerProtocol: class {
    var defaultError: NetworkError { get }
}

extension NetworkResponseHandlerProtocol {
    
    func handleResponse<T: Codable, Error>(response: T?,
                                           error: Error?,
                                           completion: @escaping(Result<T, NetworkError>) -> Void) {
        
        if error != nil || response == nil {
            completion(.failure(error as? NetworkError ?? self.defaultError))
        } else if let response = response {
            completion(.success(response))
        } else {
            completion(.failure(self.defaultError))
        }
    }
    
    func handleResponse<T: Codable, Error>(response: T?,
                                           error: Error?,
                                           onSuccess: @escaping (T) -> Void,
                                           onError: @escaping (NetworkError) -> Void) {
        
        if error != nil || response == nil {
            onError(error as? NetworkError ?? self.defaultError)
        } else if let response = response {
            onSuccess(response)
        } else {
            onError(self.defaultError)
        }
    }
}
