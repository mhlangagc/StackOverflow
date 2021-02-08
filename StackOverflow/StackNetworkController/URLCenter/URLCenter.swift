//
//  URLCenter.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import Foundation

enum BaseURL: String {
    case stackOverflow
}

final class URLCenter {
    
    static let shared = URLCenter()
    
    public func buildURL(withPath urlPath: String,
                         baseURL: BaseURL) -> String {
        
        switch baseURL {
        case .stackOverflow:
            guard let `protocol` = BundleConstants.protocol.fetchValue(),
                  let uri = BundleConstants.site.fetchValue() else {
                return ""
            }
            return "/2.2/questions?pagesize=20&order=desc&sort=activity&tagged=swift&site=stackoverflow"
            return "\(`protocol`)://\(uri)/\(urlPath)"
        }
        
    }
}
