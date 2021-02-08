//
//  NetworkController.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import Foundation

typealias Parameters = [String: Any]

final class APIKit: APIKitProtocol {
    
    static let shared = APIKit()
    
    func fetchData<Model: Decodable>(forPath path: String,
                                     parameters: Parameters? = [:],
                                     headers: HTTPHeaders? = nil,
                                     method: HTTPMethod,
                                     selectedBaseURL: URLCenter = .stackOverFlow,
                                     model: Model.Type,
                                     completion: @escaping (Model?, URLResponse?, Error?) -> Swift.Void) {
        
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
        
        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
           
            guard let data = data, error == nil else {
                completion(nil, response, error)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let responseData = try decoder.decode(Model.self, from: data)
                debugLog("Data Result from URL: \(url). Expected Model: \(model). Response: \(responseData)")
                completion(responseData, nil, nil)
            } catch let error as NSError {
                debugLog("Error Fetching Data from \(model). Error: \(error)")
                completion(nil, nil, error)
            }
        })
        task.resume()
        
    }
    
}
