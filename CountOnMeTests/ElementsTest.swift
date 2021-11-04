//
//  SimpleCalcTests.swift
//  SimpleCalcTests
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

class ElementsTest : XCTestCase {

    func testGivenElementsIsEmpty_WhenElementContainsOperations_ThenCorrectResultAffiched () {
            let objects = Elements()
        objects.elements = [" 1 + 1 = "]

        _ = objects.calculate()
        
        XCTAssert(objects.operationsToReduce.contains("2"))
}

}
