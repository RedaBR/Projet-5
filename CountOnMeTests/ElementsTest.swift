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
        func testDivisionByZero () {
            func testGivenElementsIsEmpty_WhenEelementsContainsNumberDivisedByZero_ThenAlertAffiched () {
                let objects = Elements()
                objects.elements = ["5/0"]
                objects.updateElementsChoice(text: "5/0")
                if !objects.canAddOperator() {
                    XCTAssert(false, "Division par Zero impossible")
                    
                }
            }
            
        }
        func testInsufficientsOperations() {
            func testGiventElementsIsEmpty_WhenElementsIsIncompleted_ThenAlertAffiched () {
                let objects = Elements()
                objects.elements = ["1+="]
                objects.updateElementsChoice(text: "1+=")
                if !objects.canAddOperator() {
                    XCTAssert(false, "Un operateur est déja mis !")
                    
                }
        }
            }

        func testComplexeOperations () {
            func testGiventElementsIsEmpty_WhenElementsIsIcompleted_ThenAlertAffiched () {
                let objects = Elements()
                objects.elements = ["1+2+7X5/8="]
                objects.updateElementsChoice(text: " 1 + 1 = ")
                if objects.expressionHaveResult() {
                    if objects.expressionHaveEnoughElement() {
                        let result = objects.calculate()
                        XCTAssertEqual(result, "7.375")
                    } else {
                        XCTAssertFalse(objects.expressionHaveEnoughElement())
                    }
                    
                } else {
                    XCTAssertFalse(objects.expressionHaveResult())
                }
                
            }
        }

    }
}
