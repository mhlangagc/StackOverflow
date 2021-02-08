//
//  URLCenter.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import Foundation

enum BaseURL {
    case stackOverflow(parameters: SearchParameters)
}


final class URLCenter {
    
    static let shared = URLCenter()
    
    func buildURL(withPath path: String,
                  baseURL: BaseURL) -> String {
        
        switch baseURL {
        case .stackOverflow(let parameters):
            guard let `protocol` = BundleConstants.protocol.fetchValue(),
                  let url = BundleConstants.site.fetchValue(),
                  let apiVersion = BundleConstants.version.fetchValue()else {
                return ""
            }
            return "\(`protocol`)://\(url)/\(apiVersion)/questions?pagesize=\(parameters.pageSize)&order=\(parameters.order)&sort=\(parameters.sort)&tagged=\(path)&site=\(parameters.site)&filter=\(parameters.filter)"
        }
    }
}
