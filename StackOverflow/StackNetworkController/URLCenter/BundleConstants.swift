//
//  URLConstants.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import Foundation

public class BundleKey {
    static let `protocol`       = "BaseURLProtocol"
    static let stackOverflow    = "StackOverflow"
    static let appVersion       = "CFBundleShortVersionString"
}

enum BundleConstants {
    case `protocol`
    case stackOverFlow
    case version
    
    func fetchValue() -> String? {
        switch self {
        case .protocol:
            return Bundle.main.infoDictionary?[BundleKey.`protocol`] as? String
        case .stackOverFlow:
            return Bundle.main.infoDictionary?[BundleKey.stackOverflow] as? String
        case .version:
            return Bundle.main.infoDictionary?[BundleKey.appVersion] as? String
        }
    }
}
