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
        guard let query = searchBar.searchTextField.text,
              !query.isEmpty else { return }
        viewModel.searchWithQuery(query.lowercased())
        self.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        viewModel.searchResults.value?.removeAll()
        view.endEditing(true)
    }
    
}
