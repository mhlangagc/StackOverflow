//
//  QuestionOwnerView.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/08.
//

import Foundation
import UIKit

final class QuestionOwnerView: BaseView {
    
    var question: Question? {
        didSet {
            guard let question = question,
                  let owner = question.owner,
                  let creationDate = question.creationDate else { return }
            
            ownerNameLabel.text = owner.displayName
            
            if let reputation = owner.reputation {
                reputationLabel.text = "\(String(describing: reputation))"
            }
            
            let questionDate = creationDate.dateFromInt().stringFromFormat(.dateMonthYear)
            let questionTime = creationDate.dateFromInt().stringFromFormat(.time24hr)
            questionDateLabel.text = askedAtText
                .replacingOccurrences(of: "%date", with: questionDate)
                .replacingOccurrences(of: "%time", with: questionTime)
            
            //  ImageDisplay
            if let link = owner.profileImage {
                ownerImageView.displayImage(fromLink: link)
            }
        }
    }
    
    private lazy var ownerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var ownerNameLabel: UILabel = {
        let label = UILabel()
        label.font = Font.regular10
        label.textColor = Colour.grey
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var reputationLabel: UILabel = {
        let label = UILabel()
        label.font = Font.semibold10
        label.textColor = Colour.grey
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var questionDateLabel: UILabel = {
        let label = UILabel()
        label.font = Font.regular10
        label.textColor = Colour.grey
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var ownerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [ownerNameLabel, reputationLabel, questionDateLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .leading
        stackView.spacing = Layout.spacing2
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var ownerImageStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [ownerImageView, ownerStackView])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.spacing = Layout.spacing10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let topLineView: UIView = {
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
        addSubview(ownerImageStackView)
        addSubview(topLineView)
        
        ownerImageView.width(Layout.spacing32)
        ownerImageView.height(Layout.spacing32)
        
        ownerImageStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: Layout.spacing18).isActive = true
        ownerImageStackView.centerYAnchor ->> centerYAnchor
        ownerImageStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -Layout.spacing18).isActive = true
        
        topLineView.leftAnchor ->> leftAnchor
        topLineView.rightAnchor ->> rightAnchor
        topLineView.topAnchor ->> topAnchor
        topLineView.height(0.8)
    }
}

extension QuestionOwnerView {
    var askedAtText: String { Localizable.localized(key: "ASKED_AT")}
}
