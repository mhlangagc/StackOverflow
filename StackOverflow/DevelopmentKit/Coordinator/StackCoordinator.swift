//
//  StackCoordinator.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import Foundation
import UIKit

final class StackCoordinator: StackCoordinatorProtocol {
    
    public static let shared = StackCoordinator()
    
    func showQuestionController(withQuestion question: Question, from navigationControler: UINavigationController?) {
        let questionController = QuestionViewController(question: question)
        navigationControler?.pushViewController(questionController, animated: true)
    }
    
}
