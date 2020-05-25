//
//  DataManager.swift
//  RecipesDB
//
//  Created by José Marques on 22/05/2020.
//  Copyright © 2020 José Marques. All rights reserved.
//

import Foundation
import Alamofire
import RxCocoa
import RxSwift

protocol DataManagerProtocol {
    func requestMeals(withMainIngredient ingredient:String?, _ completion: @escaping (Result<Bool, Error>) -> Void)
    func requestDetail(forMeal meal: Meal, _ completion: @escaping (Result<Bool, Error>) -> Void)
}


class DataManager:DataManagerProtocol {
    let apiKey = "1"
    let mealsList: BehaviorRelay <[Meal]> = BehaviorRelay(value:[])
    let detailedMeal: BehaviorRelay <[DetailedMeal]> = BehaviorRelay(value: [])

    //MARK: Network requests

    /**
     Request a list of recipes for a given main ingredient
     - Parameter withMainIngredient: The main ingredient to be searched for
     - Parameter completion: Callback with the result. A Boolean in case of success or an error.
     */

    func requestMeals(withMainIngredient ingredient:String?, _ completion: @escaping (Result<Bool, Error>) -> Void) {
        var mainIngredient = String()
        if let ingredientToSearch = ingredient {
            resetMealList()
            mainIngredient = ingredientToSearch
        }

        let requestURL = "https://www.themealdb.com/api/json/v1/\(apiKey)/filter.php?i=\(mainIngredient)"
        AF.request(requestURL).responseJSON{ response in
            switch response.result {
            case .success:
                let decoder = JSONDecoder()
                guard let data = response.data else {return}
                do {
                    let searchResults = try decoder.decode(MealsSearchResults.self, from: data)
                    if let availableRecipes = searchResults.meals {
                        self.mealsList.accept(availableRecipes)
                        completion(.success(true))
                    }
                } catch let error {
                    completion(.failure(error))
                    print(error.localizedDescription)
                }
            case .failure(let error):
                completion(.failure(error))
                print("Error:\(error.localizedDescription)")
            }
            if self.mealsList.value.count <= 0 {
                completion(.failure(RecipiesDBErrorMessages.emptySearchResponse))
            }
        }
    }

    /**
     Request a list of detailed recipes
     - Parameter forMeal: The recipe to be searched for
     - Parameter completion: Callback with the result. A Boolean in case of success or an error.
     */

    func requestDetail(forMeal meal: Meal, _ completion: @escaping (Result<Bool, Error>) -> Void) {
        resetDetail()
        let requestURL = "https://www.themealdb.com/api/json/v1/\(apiKey)/lookup.php?i=\(meal.idMeal)"
        AF.request(requestURL).responseJSON{ response in
            switch response.result {
            case .success:
                let decoder = JSONDecoder()
                guard let data = response.data else {return}
                do {
                    let searchResults = try decoder.decode(DetailedMealResult.self, from: data)
                    self.detailedMeal.accept(searchResults.meals)
                    completion(.success(true))

                } catch let error {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print("Error:\(error.localizedDescription)")
            }
            if self.detailedMeal.value.count <= 0 {
                completion(.failure(RecipiesDBErrorMessages.emptySearchResponse))
            }
        }
    }

    /**
     Reset the recipe's list
     */
    func resetMealList() {
        mealsList.accept([])
        resetDetail()
    }
    
    /**
     Reset the detailed recipe's list
     */
    func resetDetail() {
        detailedMeal.accept([])
    }
}
