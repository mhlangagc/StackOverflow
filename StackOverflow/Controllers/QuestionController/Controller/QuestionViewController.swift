//
//  QuestionViewController.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/08.
//

import UIKit

final class QuestionViewController: BaseViewController {
    
    var viewModel: AnswersViewModel
    
    init(question: Question) {
        self.viewModel = AnswersViewModel(question: question)
        super.init(nibName: nil, bundle: nil)
        questionTitleView.question = question
        questionOwnerView.question = question
        tagsView.question = question
        questionDetailsTextView.attributedText = question.body?.htmlToAttributedString
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private lazy var questionTitleView: QuestionView = {
        let view = QuestionView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var tagsView: TagsView = {
        let view = TagsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var questionOwnerView: QuestionOwnerView = {
        let view = QuestionOwnerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var questionDetailsTextView: UITextView = {
        let textView = UITextView()
        textView.font = Font.regular13
        textView.textColor = Colour.black
        textView.isEditable = false
        textView.isSelectable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colour.white
        setupNavigationBar()
        layoutView()
    }
    
    private func setupNavigationBar() {
        nolineNavigationBar()
        edgesForExtendedLayout = .all
        extendedLayoutIncludesOpaqueBars.toggle()
        setNavigationTitle(questionText)
    }
    
    private func layoutView() {
        view.addSubview(questionTitleView)
        view.addSubview(questionOwnerView)
        view.addSubview(tagsView)
        view.addSubview(questionDetailsTextView)
        
        questionTitleView.leftAnchor ->> view.leftAnchor
        questionTitleView.rightAnchor ->> view.rightAnchor
        questionTitleView.topAnchor ->> view.safeAreaLayoutGuide.topAnchor
        questionTitleView.height(Layout.spacing55)
        
        questionOwnerView.leftAnchor ->> view.leftAnchor
        questionOwnerView.rightAnchor ->> view.rightAnchor
        questionOwnerView.bottomAnchor ->> view.safeAreaLayoutGuide.bottomAnchor
        questionOwnerView.height(Layout.spacing65)
        
        tagsView.leftAnchor ->> view.leftAnchor
        tagsView.rightAnchor ->> view.rightAnchor
        tagsView.bottomAnchor ->> questionOwnerView.topAnchor
        tagsView.height(Layout.spacing20)
        
        questionDetailsTextView.leftAnchor ->> view.leftAnchor
        questionDetailsTextView.rightAnchor ->> view.rightAnchor
        questionDetailsTextView.topAnchor ->> questionTitleView.bottomAnchor
        questionDetailsTextView.bottomAnchor ->> tagsView.topAnchor
    }
}

extension QuestionViewController {
    var questionText: String { Localizable.localized(key: "QUESTION")}
}
