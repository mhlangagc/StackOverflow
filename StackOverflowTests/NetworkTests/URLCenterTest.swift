//
//  URLCenterTest.swift
//  StackOverflowTests
//
//  Created by Gugulethu on 2021/02/08.
//

import XCTest
@testable import StackOverflow

class URLCenterTests: XCTestCase {
    
    func testThatBuildURLProducesCorrectResult() {
        let mockPath = "android"
        let mockParameters = SearchParameters(title: mockPath,
                                              pageSize: "25",
                                              order: "desc",
                                              sort: "activity",
                                              site: "stackoverflow",
                                              filter:  "withbody")
        let baseURL = BaseURL.stackOverflow(parameters: mockParameters)
        
        let expectedResult = "https://api.stackexchange.com/2.2/questions?pagesize=25&order=desc&sort=activity&tagged=\(mockPath)&site=stackoverflow&filter=withbody"
        
        let testURL = URLCenter.shared.buildURL(withPath: mockPath, baseURL: baseURL)
        
        func testURLCenterProducesCorrectResult() {
            XCTAssertEqual(expectedResult, testURL)
        }
    }
}
