//
//  UITableViewCell.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import UIKit

extension UITableViewCell {
    public static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    public static var identifier: String {
        return String(describing: self)
    }
}
