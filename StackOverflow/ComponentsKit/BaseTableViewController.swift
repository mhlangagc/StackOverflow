//
//  BaseTableViewController.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import UIKit

protocol BaseTableViewProtocol {
    func registerTableViewCells()
}

public class BaseTableViewController: BaseViewController, BaseTableViewProtocol {
    
    lazy var baseTableView: UITableView = {
        let tableView = UITableView(frame: .zero,
                                     style: .grouped)
        tableView.backgroundColor = Colour.pale
        tableView.separatorStyle = .singleLine
        tableView.keyboardDismissMode = .interactive
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    public override func viewDidLoad() {
        super.viewDidLoad()
        registerTableViewCells()
    }
    
    func registerTableViewCells() {
        baseTableView.register(SearchResultsCell.self,
                               forCellReuseIdentifier: SearchResultsCell.identifier)
    }
}
