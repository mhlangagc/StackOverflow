//
//  BundleConstantsTests.swift
//  StackOverflowTests
//
//  Created by Gugulethu on 2021/02/10.
//

import Foundation
import XCTest
@testable import StackOverflow

class BundleConstantsTests: XCTestCase {
    
    func testThatProtocolConstantFetchingIsSuccessful() {
        let fetchedValue =  BundleConstants.protocol.fetchValue()
        let expectedResult = "https"
        
        XCTAssertEqual(expectedResult, fetchedValue)
    }
    
    func testThatSiteConstantFetchingIsSuccessful() {
        let fetchedValue =  BundleConstants.site.fetchValue()
        let expectedResult = "api.stackexchange.com"
        
        XCTAssertEqual(expectedResult, fetchedValue)
    }
    
    func testThatVersionConstantFetchingIsSuccessful() {
        let fetchedValue =  BundleConstants.version.fetchValue()
        let expectedResult = "2.2"
        
        XCTAssertEqual(expectedResult, fetchedValue)
    }
}
