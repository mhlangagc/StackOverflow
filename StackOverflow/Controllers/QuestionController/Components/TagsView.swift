//
//  TagsView.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/08.
//

import UIKit

final class TagsView: BaseView {
    
    var question: Question? {
        didSet {
            guard let question = question,
                  let tags = question.tags else { return }
            tagsLabel.text = tags.joined(separator: ", ")
        }
    }
    
    private lazy var tagsLabel: UILabel = {
        let label = UILabel()
        label.font = Font.bold10
        label.textColor = Colour.grey
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let topLineView: UIView = {
        let view = UIView()
        view.backgroundColor = Colour.lightGrey
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func configureView() {
        super.configureView()
        backgroundColor = Colour.white
        layoutView()
    }
    
    private func layoutView() {
        addSubview(tagsLabel)
        addSubview(topLineView)
        
        tagsLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: Layout.spacing18).isActive = true
        tagsLabel.centerYAnchor ->> centerYAnchor
        tagsLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -Layout.spacing18).isActive = true
        
        topLineView.leftAnchor ->> leftAnchor
        topLineView.rightAnchor ->> rightAnchor
        topLineView.topAnchor ->> topAnchor
        topLineView.height(0.8)
    }
}
