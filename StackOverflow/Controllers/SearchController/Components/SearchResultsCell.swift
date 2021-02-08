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
                authorLabel.text = askedByText.replacingOccurrences(of: "%@", with: String(describing: owner))
            }
            
            if let isAnswered = question.isAnswered {
                questionAnsweredImageView.isHidden = !isAnswered
            }
            
            if let answerCount = question.answerCount {
                answerLabel.text = answerCount == 1 ? oneAnswerText : answersText.replacingOccurrences(of: "%@", with: String(describing: answerCount))
            }
            
            if let viewCount = question.viewCount {
                viewsLabel.text = viewCount == 1 ? oneViewText : viewsText.replacingOccurrences(of: "%@", with: String(describing: viewCount))
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
        
        voteAnswersViewStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -Layout.spacing32).isActive = true
        voteAnswersViewStackView.centerYAnchor ->> centerYAnchor
        voteAnswersViewStackView.width(Layout.spacing64)
        
        titleImageStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: Layout.spacing18).isActive = true
        titleImageStackView.topAnchor.constraint(equalTo: topAnchor, constant: Layout.spacing10).isActive = true
        titleImageStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Layout.spacing10).isActive = true
        titleImageStackView.rightAnchor.constraint(equalTo: voteAnswersViewStackView.leftAnchor, constant: -Layout.spacing18).isActive = true
    }
}

extension SearchResultsCell {
    var askedByText: String { Localizable.localized(key: "ASKED_BY")}
    var oneAnswerText: String { Localizable.localized(key: "ONE_ANSWER")}
    var answersText: String { Localizable.localized(key: "ANSWERS")}
    var oneVoteText: String { Localizable.localized(key: "ONE_VOTE")}
    var votesText: String { Localizable.localized(key: "VOTES")}
    var oneViewText: String { Localizable.localized(key: "ONE_VIEW")}
    var viewsText: String { Localizable.localized(key: "VIEWS")}
}
