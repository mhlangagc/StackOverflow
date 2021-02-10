//
//  HTTPMethodTests.swift
//  StackOverflowTests
//
//  Created by Gugulethu on 2021/02/10.
//

import Foundation
import XCTest
@testable import StackOverflow

class HTTPMethodTests: XCTestCase {
    
    func testThatHttpPOSTMatchIsSuccessful() {
        let fetchedValue =  HTTPMethod.post.rawValue
        let expectedResult = "POST"
        XCTAssertEqual(expectedResult, fetchedValue)
    }
    
    func testThatHttpPUTMatchIsSuccessful() {
        let fetchedValue =  HTTPMethod.put.rawValue
        let expectedResult = "PUT"
        XCTAssertEqual(expectedResult, fetchedValue)
    }
    
    func testThatHttpGETMatchIsSuccessful() {
        let fetchedValue =  HTTPMethod.get.rawValue
        let expectedResult = "GET"
        XCTAssertEqual(expectedResult, fetchedValue)
    }
    
    func testThatHttpDELETEMatchIsSuccessful() {
        let fetchedValue =  HTTPMethod.delete.rawValue
        let expectedResult = "DELETE"
        XCTAssertEqual(expectedResult, fetchedValue)
    }
}
