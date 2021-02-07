//
//  URLCenter.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import Foundation

@frozen enum BaseURL {
    case stackOverFlow(urlPath: String)
    
    public func buildURL() -> String {
        switch self {
        case .stackOverFlow(let urlPath):
            guard let `protocol` = BundleConstants.protocol.fetchValue(),
                  let uri = BundleConstants.stackOverFlow.fetchValue() else {
                return ""
            }
            return "\(`protocol`)://\(uri)/\(urlPath)"
        }
        
    }
}
