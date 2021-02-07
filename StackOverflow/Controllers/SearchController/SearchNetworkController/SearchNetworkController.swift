//
//  SearchNetworkController.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import Foundation

@frozen enum SearchParameters: String {
    case title
    case pageSize   = "20"
    case order      = "desc"
    case sort       = "activity"
    case site       = "stackoverflow"
    case filter     = "withbody"
}

final class SearchNetworkController: SearchNetworkProtocol, NetworkResponseHandlerProtocol {

    var defaultError: NetworkError = NetworkError.default
    static let shared = SearchNetworkController()
    typealias SearchCompletionResult = Result<[Question], NetworkError>
    
    func searchForAnswers(withQuery query: String,
                          always: @escaping (() -> Void),
                          onSuccess: @escaping (SearchResult) -> Void,
                          onError: @escaping (NetworkError) -> Void) {
        
        let parameters: Parameters = [SearchParameters.title.rawValue: query,
                                      SearchParameters.pageSize.rawValue: "20",
                                      SearchParameters.order.rawValue: "desc",
                                      SearchParameters.sort.rawValue: "activity",
                                      SearchParameters.site.rawValue: "stackoverflow",
                                      SearchParameters.filter.rawValue: "withbody"]
        
        APIKit.shared.fetchData(forPath: query,
                                parameters: parameters,
                                method: .POST,
                                model: SearchResult.self) { (error, model) in
            
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

