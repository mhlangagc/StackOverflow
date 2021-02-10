//
//  ViewController.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import UIKit

final class SearchViewController: BaseTableViewController {

    lazy var viewModel = SearchViewModel()
    
    var isSearching = false {
        didSet {
            if isSearching {
                baseTableView.backgroundView = nil
                activityIndicatorView.startAnimating()
            } else {
                stackOverflowSearchLabel.text = stackOverFlowSearchText
                baseTableView.backgroundView = stackOverflowSearchLabel
                activityIndicatorView.stopAnimating()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindToViewModel()
        layoutViews()
        registerTableDelegates()
        registerSearchBarDelegates()
        setupEmptyTableView()
    }
    
    private func setupEmptyTableView() {
        stackOverflowSearchLabel.text = stackOverFlowSearchText
        baseTableView.backgroundView = stackOverflowSearchLabel
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nolineNavigationBar()
        edgesForExtendedLayout = .all
        extendedLayoutIncludesOpaqueBars.toggle()
        navigationItem.titleView = baseSearchBar
    }
    
    func layoutViews() {
        view.addSubview(baseTableView)
        baseTableView.constrain(to: view)
        loadingAnimation()
    }
    
    func registerTableDelegates() {
        baseTableView.dataSource = self
        baseTableView.delegate = self
    }
    
    func registerSearchBarDelegates() {
        baseSearchBar.placeholder = searchBarPlaceHolderText
        baseSearchBar.delegate = self
        baseSearchBar.searchTextField.delegate = self
        baseSearchBar.searchTextField.clearButtonMode = .never
    }
}

// MARK: Navigation
extension SearchViewController {
    func showQuestionController(with question: Question) {
        coordinator.showQuestionController(withQuestion: question, from: self.navigationController)
    }
}

// MARK: Localisation
extension SearchViewController {
    var searchBarPlaceHolderText: String { Localizable.localized(key: "SEARCH")}
    var stackOverFlowSearchText: String { Localizable.localized(key: "STACK_OVERFLOW_SEARCH")}
    var noResultsFoundText: String { Localizable.localized(key: "NO_RESULTS_FOUND")}
}
