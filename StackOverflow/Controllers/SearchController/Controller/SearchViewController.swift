//
//  ViewController.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import UIKit

final class SearchViewController: BaseViewController {

    lazy var viewModel = SearchViewModel()
    
    lazy var searchResultsTableView: UITableView = {
         let tableView = UITableView(frame: .zero,
                                     style: UITableView.Style.plain)
         tableView.backgroundColor = Colour.pale
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
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
