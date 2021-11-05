//
//  ElementsTest.swift
//  CountOnMeTests
//
//  Created by Reda on 05/11/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//
import XCTest
@testable import CountOnMe

class ElementsTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {

            func testGivenElementsIsEmpty_WhenElementContainsOperations_ThenCorrectResultAffiched () {
                    let objects = Elements()
                objects.elements = [" 1 + 1 = "]
                
                objects.updateElementsChoice(text: " 1 + 1 = ")
                if objects.expressionHaveResult() {
                    if objects.expressionHaveEnoughElement() {
                        let result = objects.calculate()
                        XCTAssertEqual(result, "2")
                    } else {
                        XCTAssertFalse(objects.expressionHaveEnoughElement())
                    }
                    
                } else {
                    XCTAssertFalse(objects.expressionHaveResult())
                }
            
        
        }

            }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
