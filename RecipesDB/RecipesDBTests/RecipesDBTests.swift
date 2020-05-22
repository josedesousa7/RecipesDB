//
//  RecipesDBTests.swift
//  RecipesDBTests
//
//  Created by José Marques on 22/05/2020.
//

import XCTest
import Alamofire


@testable import RecipesDB

class RecipesDBTests: XCTestCase {


    var resultList = [Meal]()

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testMealListParsing() {
        let requestURL = "https://www.themealdb.com/api/json/v1/1/filter.php?i=beef"
        let expectation = self.expectation(description: "Parsing")
        AF.request(requestURL).responseJSON{ response in
            switch response.result {
            case .success(let json):
                let decoder = JSONDecoder()
                guard let data = response.data else {return}
                do {
                    let searchResults = try decoder.decode(MealsSearchResults.self, from: data)
                    self.resultList = searchResults.meals
                    expectation.fulfill()
                    print(searchResults)

                } catch let error {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print("Error:\(error.localizedDescription)")
            }
        }
        waitForExpectations(timeout: 20, handler: nil)
        XCTAssertTrue(resultList.count > 0)
    }

    func testMealDetailParsing () {
        let id = "52874"
        var mealSearched = [DetailedMeal]()
        let requestURL = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(id)"
        let expectation = self.expectation(description: "Parsing")
        AF.request(requestURL).responseJSON{ response in
            switch response.result {
            case .success(let json):
                let decoder = JSONDecoder()
                guard let data = response.data else {return}
                do {
                    let searchResults = try decoder.decode(DetailedMealResult.self, from: data)
                   mealSearched = searchResults.meals
                    expectation.fulfill()
                    print(mealSearched)

                } catch let error {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print("Error:\(error.localizedDescription)")
            }
        }
        waitForExpectations(timeout: 20, handler: nil)
        XCTAssert(mealSearched.count > 0)
    }
}
