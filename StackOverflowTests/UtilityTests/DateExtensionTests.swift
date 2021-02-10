//
//  DateExtensionTESTS.swift
//  StackOverflowTests
//
//  Created by Gugulethu on 2021/02/10.
//

import Foundation

@frozen enum DateFormat: String {
    case serverDate     = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    case dateMonthYear  = "dd MMMM YYYY"
    case time24hr       = "hh:mm"
}

extension Date {
    
    func stringFromFormat(_ dateFormat: DateFormat) -> String {
        let dateFormatter = DateFormatter()

        switch dateFormat {
        case .serverDate:
            dateFormatter.dateFormat = DateFormat.serverDate.rawValue
        case .dateMonthYear:
            dateFormatter.dateFormat = DateFormat.dateMonthYear.rawValue
        case .time24hr:
            dateFormatter.dateFormat = DateFormat.time24hr.rawValue
        }
        
        return dateFormatter.string(from: self)
    }
    
    func intFromDate() -> Int {
        return Int(self.timeIntervalSince1970)
    }
}

extension String {
    
    func dateFromFormat(_ dateFormat: DateFormat) -> Date {
        let dateFormatter = DateFormatter()
        
        switch dateFormat {
        case .serverDate:
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.locale = Locale.current
            dateFormatter.calendar = Calendar(identifier: .gregorian)
            dateFormatter.dateFormat = DateFormat.serverDate.rawValue
        case .time24hr:
            dateFormatter.dateFormat = DateFormat.time24hr.rawValue
        case .dateMonthYear:
            dateFormatter.dateFormat = DateFormat.dateMonthYear.rawValue
        }
        
        return dateFormatter.date(from: self) ?? Date()
    }
}

// MARK: Date From Int
extension Int {
    func dateFromInt() -> Date {
        return Date(timeIntervalSince1970: TimeInterval(integerLiteral: Int64(self)))
    }
}
