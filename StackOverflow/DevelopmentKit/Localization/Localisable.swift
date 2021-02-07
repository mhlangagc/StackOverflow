//
//  Localisable.swift
//  StackOverflow
//
//  Created by Gugulethu on 2021/02/07.
//

import Foundation

protocol LocalizationProtocol: Localizable {
    static func localized(key: String, in file: StringsFile) -> String
}

class Localizable: LocalizationProtocol {
    class func localized(key: String, in file: StringsFile = .stackOverFlow) -> String {
        return NSLocalizedString(key, tableName: file.rawValue, bundle: Bundle.main, value: "", comment: "")
    }
}
