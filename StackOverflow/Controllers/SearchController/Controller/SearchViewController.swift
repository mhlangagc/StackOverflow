//
//  ViewController.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import UIKit

final class SearchViewController: BaseTableViewController {

    lazy var viewModel = SearchViewModel()
    var isSearching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindToViewModel()
        layoutViews()
        registerTableDelegates()
        registerSearchBarDelegates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nolineNavigationBar()
        navigationItem.titleView = baseSearchBar
    }
    
    func layoutViews() {
        view.addSubview(baseTableView)
        baseTableView.constrain(to: view)
    }
    
    func registerTableDelegates() {
        baseTableView.dataSource = self
        baseTableView.delegate = self
    }
    
    func registerSearchBarDelegates() {
        baseSearchBar.placeholder = searchBarPlaceHolderText
        baseSearchBar.delegate = self
        baseSearchBar.searchTextField.delegate = self
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
