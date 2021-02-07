//
//  NetworkProtocol.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import Foundation

protocol NetworkProtocol: NetworkController {
    func fetchData<Model: Decodable>(forPath path: String,
                                     parameters: Parameters?,
                                     headers: HTTPHeaders?,
                                     method: HTTPMethod,
                                     selectedBaseURL: URLCenter,
                                     model: Model.Type,
                                     completion: @escaping (Error?, Model?) -> Void)
}
