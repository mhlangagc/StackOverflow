//
//  SearchViewController+Search.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import UIKit

extension SearchViewController: UISearchBarDelegate, UITextFieldDelegate {
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        isSearching = true
        return isSearching
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        isSearching = true
        self.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        viewModel.searchResults.value?.removeAll()
        baseTableView.isHidden = false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        isSearching = true

        if searchText.isEmpty {
            viewModel.searchResults.value?.removeAll()
            baseTableView.isHidden = false
            NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(self.searchForText), object: nil)
            return
        }
        
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(self.searchForText), object: nil)
        self.perform(#selector(self.searchForText), with: nil, afterDelay: 0.75)
    }
    
    @objc func searchForText() {
        guard let searchText = baseSearchBar.searchTextField.text else { return }
        viewModel.searchWithQuery(searchText.lowercased())
    }
    
}
