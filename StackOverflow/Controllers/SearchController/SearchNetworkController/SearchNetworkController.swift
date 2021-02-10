//
//  SearchNetworkController.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import Foundation

final class SearchNetworkController: SearchNetworkProtocol, NetworkResponseHandlerProtocol {

    var defaultError: NetworkError = NetworkError.default
    static let shared = SearchNetworkController()
    typealias SearchCompletionResult = Result<[Question], NetworkError>
    
    func searchForAnswers(withQuery query: String,
                          always: @escaping (() -> Void),
                          onSuccess: @escaping (Questions) -> Void,
                          onError: @escaping (NetworkError) -> Void) {
        
        let parameters = SearchParameters(title: query,
                                          pageSize: "20",
                                          order: "desc",
                                          sort: "activity",
                                          site: "stackoverflow",
                                          filter:  "withbody")
        
        APIKit.shared.fetchData(forPath: query,
                                method: .get,
                                baseURL: .stackOverflow(parameters: parameters),
                                model: Questions.self) { (model, response, error) in
            
            self.handleResponse(response: model, error: error) { (result) in
                switch result {
                case .failure(let error):
                    onError(error)
                case .success(let searchResult):
                    onSuccess(searchResult)
                }
            }
        }

        always()
        
    }
}

