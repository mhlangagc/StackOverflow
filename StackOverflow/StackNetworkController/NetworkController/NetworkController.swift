//
//  NetworkController.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import Foundation

typealias Parameters = [String: Any]

final class NetworkController: NetworkProtocol {
    
    static let shared = NetworkController()
    
    func fetchData<Model: Decodable>(forPath path: String,
                                     parameters: Parameters? = [:],
                                     headers: HTTPHeaders? = nil,
                                     method: HTTPMethod,
                                     selectedBaseURL: URLCenter = .stackOverFlow,
                                     model: Model.Type,
                                     completion: @escaping (Error?, Model?) -> Void) {
        
        let urlPath = selectedBaseURL.buildURL(urlPath: path)
        guard let encodedURL: String = urlPath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: encodedURL) else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.addValue(HeaderKeys.Values.accept, forHTTPHeaderField: HeaderKeys.Name.accept)
        request.addValue(HeaderKeys.Values.contentType, forHTTPHeaderField: HeaderKeys.Name.contentType)
        
        if let parameters = parameters {
            if !parameters.isEmpty {
                let jsonBody = try? JSONSerialization.data(withJSONObject: parameters)
                request.httpBody = jsonBody
            }
        }
        
        
        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { _, _, error in
            
            if let err = error {
                let failure = Failure(error: err)
                completion(.failure(failure))
                return
            }
            completion(.success(true))
        })
        task.resume()
        
    }
    
}
