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
        view.backgroundColor = Colour.pale
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nolineNavigationBar()
    }

}

