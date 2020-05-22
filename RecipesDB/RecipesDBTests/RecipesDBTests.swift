//
//  RecipesDBTests.swift
//  RecipesDBTests
//
//  Created by José Marques on 22/05/2020.
//

import XCTest
@testable import RecipesDB

class RecipesDBTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testEmptyString() {
        let string = ""
        XCTAssertNotNil(string)
    }

}
