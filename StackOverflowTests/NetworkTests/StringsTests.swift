//
//  StringsTests.swift
//  StackOverflowTests
//
//  Created by Gugulethu on 2021/02/08.
//

import XCTest
@testable import StackOverflow

class StringsTests: XCTestCase {
    
    func testSearchText() {
        XCTAssertEqual("Search", Localizable.localized(key: "SEARCH"))
    }
    
    func testStackOverflowSearchText() {
        XCTAssertEqual("Stack Overflow Search", Localizable.localized(key: "STACK_OVERFLOW_SEARCH"))
    }
    
    func testAskedByText() {
        XCTAssertEqual("asked by %@", Localizable.localized(key: "ASKED_BY"))
    }
    
    func testNoResultsFoundText() {
        XCTAssertEqual("No Results Found", Localizable.localized(key: "NO_RESULTS_FOUND"))
    }
    
    func testOneAnswerText() {
        XCTAssertEqual("1 Answer", Localizable.localized(key: "ONE_ANSWER"))
    }
    
    func testAnswersText() {
        XCTAssertEqual("%@ Answers", Localizable.localized(key: "ANSWERS"))
    }
    
    func testOneVoteText() {
        XCTAssertEqual("1 Vote", Localizable.localized(key: "ONE_VOTE"))
    }
    
    func testVotesText() {
        XCTAssertEqual("%@ Votes", Localizable.localized(key: "VOTES"))
    }
    
    func testOneViewText() {
        XCTAssertEqual("1 View", Localizable.localized(key: "ONE_VIEW"))
    }
    
    func testViewsText() {
        XCTAssertEqual("%@ Views", Localizable.localized(key: "VIEWS"))
    }
    
    func testQuestionText() {
        XCTAssertEqual("Question", Localizable.localized(key: "QUESTION"))
    }
    
    func testAskedAtText() {
        XCTAssertEqual("asked %date at %time", Localizable.localized(key: "ASKED_AT"))
    }
}
