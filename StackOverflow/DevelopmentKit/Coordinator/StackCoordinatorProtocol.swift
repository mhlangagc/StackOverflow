//
//  StackCoordinatorProtocol.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import Foundation
import UIKit

protocol StackCoordinatorProtocol: class {
    func showQuestionController(withQuestion question: Question, from viewController: UIViewController?)
}
