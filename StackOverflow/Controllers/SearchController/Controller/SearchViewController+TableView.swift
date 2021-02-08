//
//  SearchViewController+TableView.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import UIKit
 
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.searchResults.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Layout.spacing4
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return Layout.spacing4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let searchCell = tableView.dequeueReusableCell(withIdentifier: SearchResultsCell.identifier, for: indexPath) as? SearchResultsCell,
              let question = viewModel.searchResults.value else {
            return UITableViewCell()
        }
        searchCell.question = question[indexPath.section]
        return searchCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let question = viewModel.searchResults.value else { return }
        showQuestionController(with: question[indexPath.section])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Layout.spacing80
    }
}
