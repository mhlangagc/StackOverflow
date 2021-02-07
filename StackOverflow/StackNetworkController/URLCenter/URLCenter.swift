//
//  URLCenter.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import Foundation

@frozen enum URLCenter {
    case stackOverFlow
    
    public func buildURL(urlPath: String) -> String {
        switch self {
        case .stackOverFlow:
            guard let `protocol` = BundleConstants.protocol.fetchValue(),
                  let uri = BundleConstants.stackOverFlow.fetchValue() else {
                return ""
            }
            return "\(`protocol`)://\(uri)/\(urlPath)"
        }
        
    }
}
