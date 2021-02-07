//
//  ViewController.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import UIKit

final class SearchViewController: BaseTableViewController, BaseTableViewProtocol {

    lazy var viewModel = SearchViewModel()
    var isSearching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindToViewModel()
        layoutViews()
        registerSearchBarDelegates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nolineNavigationBar()
        navigationItem.searchController = baseSearchController
    }
    
    func layoutViews() {
        view.addSubview(baseTableView)
        baseTableView.constrain(to: view)
    }
    
    @objc func registerTableViewCells() {
        baseTableView.register(SearchResultsCell.self,
                               forCellReuseIdentifier: SearchResultsCell.identifier)
    }
    
    func registerDelegates() {
        baseTableView.dataSource = self
        baseTableView.delegate = self
    }
    
    func registerSearchBarDelegates() {
        baseSearchController.searchBar.placeholder = searchBarPlaceHolderText
        baseSearchController.searchBar.delegate = self
        baseSearchController.searchBar.searchTextField.delegate = self
        baseSearchController.searchResultsUpdater = self
    }
}

// MARK: Navigation
extension SearchViewController {
    func showQuestionController(with question: Question) {
        coordinator.showQuestionController(withQuestion: question, from: self)
    }
}

// MARK: Localisation
extension SearchViewController {
    var searchBarPlaceHolderText: String { Localizable.localized(key: "Search")}
}
