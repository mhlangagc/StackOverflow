//
//  BaseView.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import UIKit

public class BaseView: UIView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Colour.white
        self.configureView()
    }
    
    public func configureView() {
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
