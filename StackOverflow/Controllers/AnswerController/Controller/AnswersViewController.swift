//
//  AnswersViewController.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/08.
//

import UIKit

final class AnswersViewController: BaseViewController {
    
    var viewModel: AnswersViewModel
    
    init(question: Question) {
        self.viewModel = AnswersViewModel(question: question)
        super.init(nibName: nil, bundle: nil)
        questionTitleView.question = question
        questionOwnerView.question = question
        tagsView.question = question
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutView()
    }
    
    private func layoutView() {
        view.addSubview(questionTitleView)
        view.addSubview(questionOwnerView)
        view.addSubview(tagsView)
        
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
    }
    
}
