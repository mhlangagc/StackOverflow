//
//  BaseTableViewController.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import Foundation
import UIKit
import SafariServices
import SystemConfiguration

public class BaseTableViewController: BaseViewController {
    
    lazy var baseTableView: UITableView = {
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

    public override func viewDidLoad() {
        super.viewDidLoad()
        registerTableViewCells()
    }
    
    @objc func registerTableViewCells() {
        
    }

    func loadingAnimation() {
        self.view.addSubview(activityIndicatorView)
        activityIndicatorView.startAnimating()
        activityIndicatorView.centerXAnchor ->> view.centerXAnchor
        activityIndicatorView.centerYAnchor ->> view.centerYAnchor
        activityIndicatorView.height(30.0)
        activityIndicatorView.width(30.0)
    }
    
    func showAlertController(title: String, description: String) {
        AlertController.showAlert(presenter: self,
                                  title: title,
                                  message: description)
    }

}
