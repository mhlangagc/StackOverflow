//
//  BaseViewController.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import Foundation
import UIKit
import SafariServices
import SystemConfiguration

public class BaseViewController: UIViewController {
    
    lazy var coordinator = resolve(StackCoordinator.self)
    let generator = UINotificationFeedbackGenerator()
    
    // MARK: Reachability
    let reachability = SCNetworkReachabilityCreateWithName(nil, "https://stackoverflow.com/")
    
    lazy var activityIndicatorView: UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView()
        loader.style = UIActivityIndicatorView.Style.medium
        loader.hidesWhenStopped = true
        loader.translatesAutoresizingMaskIntoConstraints = false
        return loader
    }()
    
    lazy var baseSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.barStyle = .default
        searchBar.backgroundColor = Colour.primary
        searchBar.frame = .zero
        searchBar.scopeButtonTitles = nil
        searchBar.scopeBarBackgroundImage = nil
        searchBar.backgroundImage = UIImage()
        searchBar.setBackgroundImage(UIImage(named: "search-bar"),
                                     for: .bottom,
                                     barMetrics: .default)
        return searchBar
    }()

    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colour.pale
        checkNetworkReachability()
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
    
    @objc func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }

}

// MARK: Reachability
extension BaseViewController {
    
    fileprivate func checkNetworkReachability() {
        var flags = SCNetworkReachabilityFlags()
        
        guard let reachability = self.reachability else { return }
        SCNetworkReachabilityGetFlags(reachability, &flags)
        
        if (isNetworkReachable(with: flags)) {
            if flags.contains(.isWWAN) {
                // Network Reachable via Mobile Data
                return
            }
            //  Network Reachable via Wifi
        } else if (!isNetworkReachable(with: flags)) {
            self.showAlertController(title: "Network Unavailable",
                                     description: "Looks like you're offline. Please check your network and try again.")
            return
        }
    }
    
    fileprivate func isNetworkReachable(with flags: SCNetworkReachabilityFlags) -> Bool {
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        let canConnectAutomatically = flags.contains(.connectionOnDemand) || flags.contains(.connectionOnTraffic)
        let canConnectWithoutUserInteraction = canConnectAutomatically && !flags.contains(.interventionRequired)
        return isReachable && (!needsConnection || canConnectWithoutUserInteraction)
    }
    
    @objc func reachabilityChanged(note: Notification) {
        guard let reachability = note.object as? Reachability else { return }
        switch reachability.connection {
        case .wifi:
            debugLog("Reachable via WiFi")
        case .cellular:
            debugLog("Reachable via Cellular")
        case .none:
            debugLog("Network not reachable")
        }
    }
}

// MARK: Actions
extension BaseViewController {
    @objc func handleDismiss() {
        self.dismiss(animated: true, completion: nil)
    }
}
