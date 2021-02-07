//
//  HTTPHeader.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import Foundation

public struct HTTPHeader: Hashable {
    public let name: String
    public let value: String

    public init(name: String, value: String) {
        self.name = name
        self.value = value
    }
}

public struct HTTPHeaders {
    private var headers: [HTTPHeader] = []
    public init() {}

    public init(_ headers: [HTTPHeader]) {
        self.init()
        headers.forEach { update($0) }
    }
    
    public mutating func update(_ header: HTTPHeader) {
        guard let index = headers.index(of: header.name) else {
            headers.append(header)
            return
        }
        headers.replaceSubrange(index...index, with: [header])
    }
}

extension Array where Element == HTTPHeader {
    func index(of name: String) -> Int? {
        let lowercasedName = name.lowercased()
        return firstIndex { $0.name.lowercased() == lowercasedName }
    }
}
