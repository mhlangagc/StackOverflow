//
//  SearchViewModel.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import Foundation

public class BaseViewModel {
    lazy var networkController = resolve(SearchNetworkController.self)
}

final class SearchViewModel: BaseViewModel {
    
    var searchResults = Observable<[Question]>([])
    var errorBlock: ((NetworkError) -> Swift.Void)?
    
    func searchWithQuery(_ query: String) {
        
        if query.isEmpty { return }
        let loadSearchResultsSemaphore = DispatchSemaphore(value: 0)
        
        networkController.searchForAnswers(withQuery: query, always: {
            loadSearchResultsSemaphore.signal()
        }, onSuccess: { (searchResults) in
            self.searchResults.value = searchResults.questions
        }) { (error) in
            self.errorBlock?(error)
        }

        loadSearchResultsSemaphore.wait(timeout: .distantFuture)
    }
    
}
