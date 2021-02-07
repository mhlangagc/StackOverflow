//
//  SearchViewModel.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import Foundation

final class SearchViewModel {
    
    var productResults = Observable<[Product]>([])
    var departments = Observable<[DepartmentModel]>([])
    var errorBlock: ((ServiceError) -> Swift.Void)?
    
    var searchProtocol: SearchMasterController?
    var searchResultsErrorBlock: ((ServiceError) -> Swift.Void)?
    
    private lazy var networkController: FirebaseNetworkController = FirebaseNetworkControllerImplementation.shared
    private lazy var oneBoxNetworkController = resolve(OneBoxNetworkController.self)
    
    func searchWithQuery(_ query: String) {
        
        if query.isEmpty { return }
        let loadFavouritesSemaphore = DispatchSemaphore(value: 0)
        
        networkController.searchForProducts(withQuery: query, always: {
            loadFavouritesSemaphore.signal()
        }, onSuccess: { (productResults) in
            self.productResults.value = productResults
            self.searchProtocol?.onFetchSearchResults()
        }) { (error) in
            self.searchResultsErrorBlock?(error)
        }

        loadFavouritesSemaphore.wait(timeout: .distantFuture)
    }
    
}
