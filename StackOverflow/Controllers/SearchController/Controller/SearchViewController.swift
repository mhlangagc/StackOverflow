//
//  ViewController.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import UIKit

final class SearchViewController: BaseViewController {

    lazy var viewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindToViewModel()
        layoutViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nolineNavigationBar()
    }
    
    func layoutViews() {
        view.addSubview(searchResultsTableView)
        searchResultsTableView.constrain(to: view)
    }
    
    override func registerTableViewCells() {
        super.registerTableViewCells()
        searchResultsTableView.register(SearchResultsCell.self,
                                        forCellReuseIdentifier: SearchResultsCell.identifier)
    }
}

// MARK: Navigation
extension SearchViewController {
    func showQuestionController(with question: Question) {
        coordinator.showQuestionController(withQuestion: question, from: self)
    }
}
