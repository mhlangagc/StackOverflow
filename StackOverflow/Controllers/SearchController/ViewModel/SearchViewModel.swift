//
//  SearchViewModel.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import Foundation

public class BaseViewModel {
    lazy var networkController = resolve(NetworkController.self)
}

final class SearchViewModel: BaseViewModel {
    
    var searchResults = Observable<[Product]>([])
    var errorBlock: ((ServiceError) -> Swift.Void)?
    
    func searchWithQuery(_ query: String) {
        
        if query.isEmpty { return }
        let loadFavouritesSemaphore = DispatchSemaphore(value: 0)
        
        networkController.searchForProducts(withQuery: query, always: {
            loadFavouritesSemaphore.signal()
        }, onSuccess: { (productResults) in
            self.productResults.value = productResults
            self.searchProtocol?.onFetchSearchResults()
        }) { (error) in
            self.errorBlock?(error)
        }

        loadFavouritesSemaphore.wait(timeout: .distantFuture)
    }
    
}
