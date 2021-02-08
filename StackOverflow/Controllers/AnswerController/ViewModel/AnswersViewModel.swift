//
//  AnswersViewModel.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/08.
//

import Foundation

final class AnswersViewModel: BaseViewModel {
    
    var question: Question
    
    var searchResults = Observable<[Question]>([])
    var errorBlock: ((NetworkError) -> Swift.Void)?
    
    init(question: Question) {
        self.question = question
    }
}
