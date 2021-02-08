//
//  BaseNavigationController.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import Foundation
import UIKit

extension UIViewController {
    
    func nolineNavigationBar(backgroundColour: UIColor = Colour.primary,
                             tintColour: UIColor = Colour.white) {
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.tintColor = tintColour
        navigationController?.navigationBar.barTintColor = backgroundColour
        navigationController?.navigationBar.backgroundColor = backgroundColour
    }
    
    func setNavigationTitle(_ title:String, titleColour: UIColor = Colour.white) {
        let navBarTitleLabel = UILabel()
        navBarTitleLabel.textAlignment = .center
        navBarTitleLabel.text = title
        navBarTitleLabel.textColor = titleColour
        navBarTitleLabel.font = Font.semibold17
        self.navigationItem.titleView = navBarTitleLabel
    }
    
}
