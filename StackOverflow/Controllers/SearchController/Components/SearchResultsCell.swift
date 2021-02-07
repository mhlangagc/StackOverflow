//
//  SearchResultsCell.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import Foundation
import UIKit 

final class SearchResultsCell: BaseTableCell {
    
    var question: Question? {
        didSet {
            guard let question = question else { return }
        }
    }
    
    override func configureView() {
        super.configureView()
    }
}
