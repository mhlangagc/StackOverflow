//
//  URLConstants.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import Foundation

public class BundleKey {
    static let `protocol`       = "BaseURLProtocol"
    static let site             = "stackExchangeSite"
    static let version          = "StackOverFlowVersion"
}

enum BundleConstants {
    case `protocol`
    case site
    case version
    
    func fetchValue() -> String? {
        switch self {
        case .protocol:
            return Bundle.main.infoDictionary?[BundleKey.`protocol`] as? String
        case .site:
            return Bundle.main.infoDictionary?[BundleKey.site] as? String
        case .version:
            return Bundle.main.infoDictionary?[BundleKey.version] as? String
        }
    }
}
