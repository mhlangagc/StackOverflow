//
//  ApplicationRouter.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import Foundation
import UIKit

final class ApplicationRouter {
    
    class func setupBaseRouting() -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        window.tintColor = Colour.primary
        window.rootViewController = UINavigationController(rootViewController: SearchViewController())
        return window
    }
}
