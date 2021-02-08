//
//  SearchViewController+Search.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import UIKit

extension SearchViewController: UISearchBarDelegate, UITextFieldDelegate {
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        baseSearchBar.showsCancelButton = true
        baseTableView.backgroundView = nil
        return true
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        isSearching = true
        guard let query = searchBar.searchTextField.text,
              !query.isEmpty else { return }
        searchBar.searchTextField.resignFirstResponder()
        viewModel.searchWithQuery(query.lowercased().trimmed)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        baseSearchBar.showsCancelButton = false
        searchBar.searchTextField.resignFirstResponder()
        viewModel.searchResults.value?.removeAll()
        searchBar.searchTextField.text = nil
        isSearching = false
    }
    
}
