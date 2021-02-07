//
//  SearchNetworkProtocol.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import Foundation

protocol SearchNetworkProtocol: SearchNetworkController {
    func searchForAnswers(withQuery query: String,
                          always: @escaping (() -> Void),
                          onSuccess: @escaping (SearchResult) -> Void,
                          onError: @escaping (NetworkError) -> Void)
}
