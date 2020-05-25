//
//  SearchViewModelTests.swift
//  RecipesDBTests
//
//  Created by José Marques on 25/05/2020.
//  Copyright © 2020 José Marques. All rights reserved.
//

import XCTest
@testable import RecipesDB

class SearchViewModelTests: XCTestCase {

    var viewModel: SearchViewModel?
    var recipesList = [Meal]()
    var recipe: Meal?
    var retrievedRecipe = [DetailedMeal]()
    var wrongRecipe: Meal?

    override func setUpWithError() throws {

        let  service = DataManager()
        viewModel = SearchViewModel(service: service)
        recipe = Meal(strMeal: "Beef and Mustard Pie", strMealThumb: "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg", idMeal: "52874")
        wrongRecipe = Meal(strMeal: "Wrong name", strMealThumb: "Wrong link", idMeal: "Wrong Id")
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testViewModelRetrieveAllMeals() {
        let expectation = self.expectation(description: "Retrieving")
        viewModel?.requestAvailableMealsForIngredient(ingredient: "beef", {[weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.recipesList = data
                print(data)
                expectation.fulfill()
                break
            case .failure(let error):
                self.recipesList = []
                XCTFail(error.localizedDescription)
                expectation.fulfill()
                break
            }
        })
        waitForExpectations(timeout: 20, handler: nil)
        XCTAssert(recipesList.count > 0)
    }

    func testViewModelRetrieveMeal() throws {
        let expectation = self.expectation(description: "Retrieving")
        viewModel?.requestMealDetailsFor(meal: try XCTUnwrap(recipe),{[weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                self.retrievedRecipe = data
                print(data)
                expectation.fulfill()
                break
            case .failure(let error):
                self.recipesList = []
                XCTFail(error.localizedDescription)
                break
            }
        })
        waitForExpectations(timeout: 20, handler: nil)
        XCTAssert(retrievedRecipe.count > 0)
        XCTAssertEqual(retrievedRecipe.first?.strMeal, "Beef and Mustard Pie")
        XCTAssertEqual(retrievedRecipe.first?.strMealThumb, "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg")
    }

    func testViewModelRetrieveRecipesListFails(){
        let expectation = self.expectation(description: "Retrieving")
        var errorMessage = String()
        var retrievedAvailableRecipesList = [Meal]()
        viewModel?.requestAvailableMealsForIngredient(ingredient: "wrong_Ingredient", {(result) in
        switch result {
        case .success(let data):
            retrievedAvailableRecipesList = data
            expectation.fulfill()
            break
        case .failure(let error):
            errorMessage = error.localizedDescription
            expectation.fulfill()
            break
                 }
        })
        waitForExpectations(timeout: 20, handler: nil)
        XCTAssert(retrievedAvailableRecipesList.count == 0)
        XCTAssertEqual(errorMessage, RecipiesDBErrorMessages.emptySearchResponse.localizedDescription)
        XCTAssertNotEqual(retrievedAvailableRecipesList.first?.strMeal, "Beef and Mustard Pie")
        XCTAssertNotEqual(retrievedAvailableRecipesList.first?.strMealThumb, "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg")
    }

    func testViewModelRetrieveRecipesListWithEmptyTitleFails(){
        let expectation = self.expectation(description: "Retrieving")
        var errorMessage = String()
        var retrievedAvailableRecipesList = [Meal]()
        viewModel?.requestAvailableMealsForIngredient(ingredient: "", {(result) in
            switch result {
            case .success(let data):
                retrievedAvailableRecipesList = data
                expectation.fulfill()
                break
            case .failure(let error):
                errorMessage = error.localizedDescription
                expectation.fulfill()
                break
            }
        })
        waitForExpectations(timeout: 20, handler: nil)
        XCTAssert(retrievedAvailableRecipesList.count == 0)
        XCTAssertEqual(errorMessage, RecipiesDBErrorMessages.emptySearchCriteria.localizedDescription)
        XCTAssertNotEqual(retrievedAvailableRecipesList.first?.strMeal, "Beef and Mustard Pie")
        XCTAssertNotEqual(retrievedAvailableRecipesList.first?.strMealThumb, "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg")
    }

    func testViewModelRetrieveRecipeFails() throws {
        var errorMessage = String()
        var retrievedRecipe = [DetailedMeal]()
        let expectation = self.expectation(description: "Retrieving")
        viewModel?.requestMealDetailsFor(meal: try XCTUnwrap(wrongRecipe),{(result) in
            switch result {
            case .success(let data):
                retrievedRecipe = data
                expectation.fulfill()
                break
            case .failure(let error):
                errorMessage = error.localizedDescription
                expectation.fulfill()
                break
            }
        })
        waitForExpectations(timeout: 20, handler: nil)
        XCTAssert(retrievedRecipe.count == 0)
        XCTAssertEqual(errorMessage, RecipiesDBErrorMessages.emptySearchResponse.localizedDescription)
        XCTAssertNotEqual(retrievedRecipe.first?.strMeal, "Beef and Mustard Pie")
        XCTAssertNotEqual(retrievedRecipe.first?.strMealThumb, "https://www.themealdb.com/images/media/meals/sytuqu1511553755.jpg")
    }

    func testStringFormat () {
        let testString = "Chicken Breast"
        let expectedResult = "Chicken_Breast"
        let result = viewModel?.formattedString(text: testString)
        XCTAssertEqual(result, expectedResult)
    }
}
