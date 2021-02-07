//
//  URLCenter.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import Foundation

final class URLCenter {
    
    public class var shared: URLCenter {
        struct Static {
            static let instance = URLCenter()
        }
        return Static.instance
    }

}
