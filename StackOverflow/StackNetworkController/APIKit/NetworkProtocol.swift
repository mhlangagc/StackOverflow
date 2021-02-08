//
//  NetworkProtocol.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import Foundation

protocol APIKitProtocol: APIKit {
    func fetchData<Model: Decodable>(forPath path: String,
                                     parameters: Parameters?,
                                     headers: HTTPHeaders?,
                                     method: HTTPMethod,
                                     baseURL: BaseURL,
                                     model: Model.Type,
                                     completion: @escaping (Model?, URLResponse?, Error?) -> Void)
}
