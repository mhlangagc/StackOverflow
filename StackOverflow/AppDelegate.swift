//
//  AppDelegate.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        StackDependencyManager.registerDefaults()
        window = ApplicationRouter.setupBaseRouting()
        return true
    }
}

