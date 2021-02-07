//
//  SearchResultsCell.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import Foundation
import UIKit 

final class SearchResultsCell: BaseTableCell {
    
    lazy var questionAnsweredImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Font.regular14
        label.textColor = Colour.primary
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.font = Font.regular10
        label.textColor = Colour.grey
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var votesLabel: UILabel = {
        let label = UILabel()
        label.font = Font.regular10
        label.textColor = Colour.grey
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var answerLabel: UILabel = {
        let label = UILabel()
        label.font = Font.regular10
        label.textColor = Colour.grey
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var viewsLabel: UILabel = {
        let label = UILabel()
        label.font = Font.regular10
        label.textColor = Colour.grey
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var disclosureIndicatorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var question: Question? {
        didSet {
            guard let question = question else { return }
        }
    }
    
    override func configureView() {
        super.configureView()
    }
}
