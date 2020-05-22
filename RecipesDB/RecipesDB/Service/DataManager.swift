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

class DataManager {
    let apiKey = "1"
    let mealsList: BehaviorRelay <[Meal]> = BehaviorRelay(value:[])
    let detailedMeal: BehaviorRelay <DetailedMeal?> = BehaviorRelay(value: nil)

    func requestMeals(withMainIngredient ingredient:String?) {
        var mainIngredient = String()
        if let ingredientToSearch = ingredient {
            mainIngredient = ingredientToSearch
        }

        let requestURL = "https://www.themealdb.com/api/json/v1/\(apiKey)/filter.php?i=\(mainIngredient)"
        AF.request(requestURL).responseJSON{ response in
            switch response.result {
            case .success(let json):
                print(json)
                let decoder = JSONDecoder()
                guard let data = response.data else {return}
                do {
                    let searchResults = try decoder.decode(MealsSearchResults.self, from: data)
                    self.mealsList.accept(searchResults.meals)

                } catch let error {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print("Error:\(error.localizedDescription)")
            }

        }
//        Alamofire.request(requestURL).responseJSON{ response in
//            switch response.result{
//
//            case .success(let JSON):
//                let decoder = JSONDecoder()
//                guard let data = response.data else {return}
//                let initialMovieCount = self.moviesList.value.count
//                do {
//                    print("Got it, JSON:\(JSON)")
//                    let searchResults = try decoder.decode(SearchResults.self, from: data)
//                    print("Got Movie")
//                    let newValue = self.moviesList.value + searchResults.Search
//                    self.moviesList.accept(newValue)
//                } catch let error {
//                    print(error.localizedDescription)
//                }
//
//                if (self.moviesList.value.count == initialMovieCount && page == 1){
//                    do {
//                        let requestError = try decoder.decode(RequestError.self, from: data)
//                        self.moviesListRequestError.accept(requestError)
//                    } catch let error {
//                        print(error.localizedDescription)
//                    }
//                }
//            case .failure(let error):
//                print("Error:\(error.localizedDescription)")
//            }
//        }
    }
}
