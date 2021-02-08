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
            titleLabel.text = question.title
            if let owner = question.owner?.displayName {
                authorLabel.text = "asked by " + owner
            }
            
            if let isAnswered = question.isAnswered {
                questionAnsweredImageView.isHidden = !isAnswered
            }
            
            if let answerCount = question.answerCount {
                answerLabel.text = answerCount == 1 ? "1 Answer" : "\(String(describing: answerCount)) Answers"
            }
            
            if let viewCount = question.viewCount {
                answerLabel.text = viewCount == 1 ? "1 View" : "\(String(describing: viewCount)) Views"
            }
        }
    }
    
    private lazy var questionAnsweredImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ic_answered")?.withTintColor(Colour.primary)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Font.regular14
        label.textColor = Colour.primary
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.font = Font.regular10
        label.textColor = Colour.grey
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var titleStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, authorLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading
        stackView.spacing = Layout.spacing8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var titleImageStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [questionAnsweredImageView, titleStackView])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.spacing = Layout.spacing12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var votesLabel: UILabel = {
        let label = UILabel()
        label.text = "0 Votes"
        label.font = Font.regular10
        label.textColor = Colour.grey
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var answerLabel: UILabel = {
        let label = UILabel()
        label.font = Font.regular10
        label.textColor = Colour.grey
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var viewsLabel: UILabel = {
        let label = UILabel()
        label.text = "10 Views"
        label.font = Font.regular10
        label.textColor = Colour.grey
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var voteAnswersViewStackView: UIStackView = {
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
        addSubview(titleImageStackView)
        
        voteAnswersViewStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -Layout.spacing40).isActive = true
        voteAnswersViewStackView.centerYAnchor ->> centerYAnchor
        voteAnswersViewStackView.width(Layout.spacing50)
        
        titleImageStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: Layout.spacing18).isActive = true
        titleImageStackView.topAnchor.constraint(equalTo: topAnchor, constant: Layout.spacing10).isActive = true
        titleImageStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Layout.spacing10).isActive = true
        titleImageStackView.rightAnchor ->> voteAnswersViewStackView.leftAnchor
    }
}
