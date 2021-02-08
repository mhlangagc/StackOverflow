//
//  String+Extension.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/08.
//

import Foundation
import UIKit

extension String {
    var trimmed: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
