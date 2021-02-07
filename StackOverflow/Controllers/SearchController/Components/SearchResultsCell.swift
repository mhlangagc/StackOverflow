//
//  SearchResultsCell.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import Foundation
import UIKit 

final class SearchResultsCell: BaseTableCell {
    
    var question: Question? {
        didSet {
            guard let question = question else { return }
        }
    }
    
    lazy var questionAnsweredImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "How to make a UITextField move up when keyboard is present?"
        label.font = Font.regular14
        label.textColor = Colour.primary
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.text = "asked by Nathan"
        label.font = Font.regular10
        label.textColor = Colour.grey
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var titleStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, authorLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading
        stackView.spacing = Layout.spacing8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var votesLabel: UILabel = {
        let label = UILabel()
        label.text = "0 Votes"
        label.font = Font.regular10
        label.textColor = Colour.grey
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var answerLabel: UILabel = {
        let label = UILabel()
        label.text = "2 Answers"
        label.font = Font.regular10
        label.textColor = Colour.grey
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var viewsLabel: UILabel = {
        let label = UILabel()
        label.text = "10 Views"
        label.font = Font.regular10
        label.textColor = Colour.grey
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var voteAnswersViewStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [votesLabel, answerLabel, viewsLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .leading
        stackView.spacing = Layout.spacing8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func configureView() {
        super.configureView()
        accessoryType = .disclosureIndicator
        layoutView()
    }
    
    private func layoutView() {
        addSubview(voteAnswersViewStackView)
        addSubview(titleStackView)
        
        voteAnswersViewStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -Layout.spacing40).isActive = true
        voteAnswersViewStackView.centerYAnchor ->> centerYAnchor
        
        titleStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: Layout.spacing18).isActive = true
        titleStackView.topAnchor.constraint(equalTo: topAnchor, constant: Layout.spacing10).isActive = true
        titleStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Layout.spacing10).isActive = true
        titleStackView.rightAnchor ->> voteAnswersViewStackView.leftAnchor
    }
}
