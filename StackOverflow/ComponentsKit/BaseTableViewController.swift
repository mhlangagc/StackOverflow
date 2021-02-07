//
//  BaseTableViewController.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import UIKit

protocol BaseTableViewProtocol {
    func registerTableViewCells()
    func registerDelegates()
}

public class BaseTableViewController: BaseViewController {
    
    lazy var baseTableView: UITableView = {
         let tableView = UITableView(frame: .zero,
                                     style: UITableView.Style.plain)
         tableView.backgroundColor = Colour.pale
        tableView.separatorStyle = .singleLine
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    public override func viewDidLoad() {
        super.viewDidLoad()
    }
}
