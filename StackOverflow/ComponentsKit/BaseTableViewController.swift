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
        tableView.showsVerticalScrollIndicator = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy var stackOverflowSearchLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Layout.spacing18, weight: .semibold)
        label.textColor = Colour.grey
        label.textAlignment = .center
        return label
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
