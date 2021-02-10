//
//  DateExtensionTests.swift
//  StackOverflowTests
//
//  Created by Gugulethu on 2021/02/10.
//

import Foundation

import XCTest
@testable import StackOverflow

class DateExtensionTests: XCTestCase {

    var currentDate: Date!
    
    override func setUp() {
        super.setUp()
        //  This tests can be improved as I am not testing the format here. 🤨
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ssZZZ"
        currentDate = dateFormatter.date(from: "2017-12-28 13:17:10+0000")
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func testDateMonthYearDateFormattingIsSuccessful() {
        let mockFormat = DateFormat.dateMonthYear
        let formatedDate = currentDate.stringFromFormat(mockFormat)
        let expectedResult = "28 December 2017"
        
        XCTAssertEqual(expectedResult, formatedDate)
    }
    
    func testtime24hrDateFormattingIsSuccessful() {
        let mockFormat = DateFormat.time24hr
        let formatedDate = currentDate.stringFromFormat(mockFormat)
        let expectedResult = "03:17"
        let unExpectedResult = "09:49"
        
        XCTAssertEqual(expectedResult, formatedDate)
        XCTAssertNotEqual(unExpectedResult, formatedDate, "")
    }
}
