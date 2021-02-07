//
//  BaseTableViewCell.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import Foundation
import UIKit

public class BaseTableCell: UITableViewCell {

    var customBackgroundColorView = UIView()
    
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: reuseIdentifier)
        backgroundColor = Colour.white
        accessoryType = .none
        customBackgroundColorView.backgroundColor = Colour.pale
        self.selectedBackgroundView =  customBackgroundColorView
        configureView()
    }
    
    func configureView() {
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
