//
//  UIImageView+Extension.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/08.
//

import UIKit

extension UIImageView {

    func displayImage(fromLink link: String) {
        DispatchQueue.global().async { [weak self] in
            guard let url = URL(string: link),
                  let data = try? Data(contentsOf: url),
                  let image = UIImage(data: data) else {
                return
            }
            
            dispatchOnMainThread {
                self?.image = image
            }
        }
    }
}
