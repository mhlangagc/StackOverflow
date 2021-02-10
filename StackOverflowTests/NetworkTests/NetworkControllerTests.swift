//
//  NetworkControllerTests.swift
//  StackOverflowTests
//
//  Created by Gugulethu on 2021/02/10.
//

import Foundation
import XCTest
@testable import StackOverflow

class NetworkControlTests: XCTestCase {
    
    var implementationUnderTest: SearchNetworkController!
    
    override func setUp() {
        super.setUp()
        implementationUnderTest = resolve(SearchNetworkProtocol.self)
    }
    
    override func tearDown() {
        super.tearDown()
        implementationUnderTest = nil
    }

    func testSearchForQueryReturnsSuccessfully() {
        let mockQuery = "swift"
        let waitingForCompletionExpectation = expectation(description: "Waiting for success block to be called")
        let alwaysBlockExpectation = expectation(description: "Waiting for always block to be called")
        
        implementationUnderTest.searchForAnswers(withQuery: mockQuery, always: {
            alwaysBlockExpectation.fulfill()
        }, onSuccess: { (searchResults) in
            waitingForCompletionExpectation.fulfill()
            XCTAssertNotNil(searchResults)
        }) { (error) in
            XCTAssertNil(error)
            XCTFail("Error testing the search for query function")
        }
        wait(for: [waitingForCompletionExpectation, alwaysBlockExpectation], timeout: 5)
    }

}
