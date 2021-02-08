//
//  QuestionView.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/08.
//

import UIKit

final class QuestionView: BaseView {
    
    var question: Question? {
        didSet {
            guard let question = question else { return }
            questionLabel.text = question.title
        }
    }
    
    private lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.font = Font.semibold17
        label.textColor = Colour.grey
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bottomLineView: UIView = {
        let view = UIView()
        view.backgroundColor = Colour.lightGrey
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func configureView() {
        super.configureView()
        backgroundColor = Colour.pale
        layoutView()
    }
    
    private func layoutView() {
        addSubview(questionLabel)
        addSubview(bottomLineView)
        
        questionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: Layout.spacing18).isActive = true
        questionLabel.centerYAnchor ->> centerYAnchor
        questionLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -Layout.spacing18).isActive = true
        
        bottomLineView.leftAnchor ->> leftAnchor
        bottomLineView.rightAnchor ->> rightAnchor
        bottomLineView.bottomAnchor ->> bottomAnchor
        bottomLineView.height(0.8)
    }
}
