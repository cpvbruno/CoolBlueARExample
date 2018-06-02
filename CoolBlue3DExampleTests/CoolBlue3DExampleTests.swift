//
//  CoolBlue3DExampleTests.swift
//  CoolBlue3DExampleTests
//
//  Created by Bruno Pantaleão N. Gonçalves on 02/06/18.
//  Copyright © 2018 Bruno Pantaleão. All rights reserved.
//

import XCTest
@testable import CoolBlue3DExample

class CoolBlue3DExampleTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTryToDownloadJsonFromWrongURL() {
        let expectation = XCTestExpectation(description: "Return fail param")
        NetworkServices().get(url: "https://google.google.google") { (result) in
            if result["failed"] != nil {
                XCTAssert(true)
                expectation.fulfill()
            } else {
                XCTAssert(false)
            }
        }
        wait(for: [expectation], timeout: 20.0)
    }
    
    func testTryToDownloadJsonFromRightURL() {
        let expectation = XCTestExpectation(description: "Return right params")
        NetworkServices().get(url: "https://demo1579101.mockable.io/coolblue/products") { (result) in
            if result["failed"] != nil {
                XCTAssert(false)
                expectation.fulfill()
            } else {
                XCTAssert(true)
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 20.0)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
