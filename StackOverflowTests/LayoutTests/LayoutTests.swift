//
//  LayoutTests.swift
//  StackOverflowTests
//
//  Created by Gugulethu on 2021/02/10.
//

import UIKit
import XCTest
@testable import StackOverflow

class LayoutTests: XCTestCase {
    
    func testSpacing0() {
        let spacing = Layout.spacing0
        let expectedResult = CGFloat(0)
        XCTAssertEqual(expectedResult, spacing)
    }
    
    func testSpacing2() {
        let spacing = Layout.spacing2
        let expectedResult = CGFloat(2)
        XCTAssertEqual(expectedResult, spacing)
    }
    
    func testSpacing4() {
        let spacing = Layout.spacing4
        let expectedResult = CGFloat(4)
        XCTAssertEqual(expectedResult, spacing)
    }
    
    func testSpacing6() {
        let spacing = Layout.spacing6
        let expectedResult = CGFloat(6)
        XCTAssertEqual(expectedResult, spacing)
    }
    
    func testSpacing8() {
        let spacing = Layout.spacing8
        let expectedResult = CGFloat(8)
        XCTAssertEqual(expectedResult, spacing)
    }
    
    func testSpacing10() {
        let spacing = Layout.spacing10
        let expectedResult = CGFloat(10)
        XCTAssertEqual(expectedResult, spacing)
    }
    
    func testSpacing12() {
        let spacing = Layout.spacing12
        let expectedResult = CGFloat(12)
        XCTAssertEqual(expectedResult, spacing)
    }
    
    func testSpacing14() {
        let spacing = Layout.spacing14
        let expectedResult = CGFloat(14)
        XCTAssertEqual(expectedResult, spacing)
    }
    
    func testSpacing16() {
        let spacing = Layout.spacing16
        let expectedResult = CGFloat(16)
        XCTAssertEqual(expectedResult, spacing)
    }
    
    func testSpacing18() {
        let spacing = Layout.spacing18
        let expectedResult = CGFloat(18)
        XCTAssertEqual(expectedResult, spacing)
    }
    
    func testSpacing20() {
        let spacing = Layout.spacing20
        let expectedResult = CGFloat(20)
        XCTAssertEqual(expectedResult, spacing)
    }
    
    func testSpacing24() {
        let spacing = Layout.spacing24
        let expectedResult = CGFloat(24)
        XCTAssertEqual(expectedResult, spacing)
    }
    
    func testSpacing32() {
        let spacing = Layout.spacing32
        let expectedResult = CGFloat(32)
        XCTAssertEqual(expectedResult, spacing)
    }
    
    func testSpacing40() {
        let spacing = Layout.spacing40
        let expectedResult = CGFloat(40)
        XCTAssertEqual(expectedResult, spacing)
    }
    
    func testSpacing50() {
        let spacing = Layout.spacing50
        let expectedResult = CGFloat(50)
        XCTAssertEqual(expectedResult, spacing)
    }
    
    func testSpacing55() {
        let spacing = Layout.spacing55
        let expectedResult = CGFloat(55)
        XCTAssertEqual(expectedResult, spacing)
    }
    
    func testSpacing64() {
        let spacing = Layout.spacing64
        let expectedResult = CGFloat(64)
        XCTAssertEqual(expectedResult, spacing)
    }
    
    func testSpacing65() {
        let spacing = Layout.spacing65
        let expectedResult = CGFloat(65)
        XCTAssertEqual(expectedResult, spacing)
    }
    
    func testSpacing72() {
        let spacing = Layout.spacing72
        let expectedResult = CGFloat(72)
        XCTAssertEqual(expectedResult, spacing)
    }
    
    func testSpacing80() {
        let spacing = Layout.spacing80
        let expectedResult = CGFloat(80)
        XCTAssertEqual(expectedResult, spacing)
    }
}
