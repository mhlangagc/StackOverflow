//
//  SearchViewController+Network.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import Foundation

extension SearchViewController  {
    
    func bindToViewModel() {
        viewModel.searchResults.addAndNotify(observer: self, completionHandler: { [weak self] (_) in
            dispatchOnMainThread {
                guard let self = self else { return }
                self.isSearching = false
                self.baseTableView.backgroundView = nil
                self.baseTableView.reloadData()
            }
        })

        viewModel.errorBlock = { error in
            dispatchOnMainThread {
                debugLog("Error: \(String(describing: error))")
            }
        }
    }
}
