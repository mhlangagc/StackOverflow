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
                                     alternativeStringPath: String? = nil,
                                     parameters: Parameters? = [:],
                                     headers: HTTPHeaders? = nil,
                                     method: HTTPMethod,
                                     selectedBaseURL: BaseURL = .restOfWorld,
                                     model: Model.Type,
                                     completion: @escaping (Error?, Model?) -> Void) {
        
        let urlPath = ""//URLCenter.shared.buildURL(withPath: URLRemotePath.limits.rawValue, selectedBaseURL: BaseURL.restOfWorld)
        
        guard let encodedURL: String = urlPath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: encodedURL) else {
            return
        }
        
        var request = URLRequest(url: url)
        let jsonBody = try? JSONSerialization.data(withJSONObject: limitParameters)
        
        request.httpMethod = method.rawValue
        request.addValue(HeaderKeys.Values.accept, forHTTPHeaderField: HeaderKeys.Name.accept)
        request.addValue(HeaderKeys.Values.contentType, forHTTPHeaderField: HeaderKeys.Name.contentType)
        request.addValue(HeaderKeys.Values.referer, forHTTPHeaderField: HeaderKeys.Name.referer)
        request.addValue("Bearer \(UserModel.accessToken)", forHTTPHeaderField: HeaderKeys.Name.authorization)
        request.httpBody = jsonBody
        
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
