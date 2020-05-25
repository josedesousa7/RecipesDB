//
//  SearchViewModel.swift
//  RecipesDB
//
//  Created by José Marques on 24/05/2020.
//  Copyright © 2020 José Marques. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class SearchViewModel {

    let dataManagerService: DataManager
    var mealsList: [Meal] = []
    var disposeBag = DisposeBag()

    init(service: DataManager) {
        self.dataManagerService = service
    }

    func requestAvailableMealsForIngredient(ingredient : String, _ completion: @escaping (Result<[Meal], Error>) -> Void) {
        if(!isSearchValidFor(text: ingredient)){
            mealsList = []
            completion(.failure(RecipiesDBErrorMessages.emptySearchCriteria))
            return
        }
        dataManagerService.requestMeals(withMainIngredient: formattedString(text: ingredient)){ [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success:
                self.dataManagerService.mealsList.asObservable().subscribe(onNext: {
                    meals in
                     completion(.success(meals))
                     self.mealsList = meals
                }).dispose()
                break
            case .failure(let error):
                 self.mealsList = []
                completion(.failure(error))
                break
            }
        }
    }

    func requestMealDetailsFor(meal : Meal, _ completion: @escaping (Result<[DetailedMeal], Error>) -> Void) {
        dataManagerService.requestDetail(forMeal: meal){[weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success:
                self.dataManagerService.detailedMeal.asObservable().subscribe(onNext: {
                    detailedMeals in
                     completion(.success(detailedMeals))
                }).dispose()
                break
            case .failure(let error):
                completion(.failure(error))
                break
            }
        }
    }

    func formattedString(text: String) -> String {
        var formattedString = text.trimmingCharacters(in: .whitespacesAndNewlines)
        formattedString = formattedString.replacingOccurrences(of: " ", with: "_")
        return formattedString
    }

    func isSearchValidFor(text: String) -> Bool{
        let resultString = text.removeWhiteSpaces()
        return (resultString != "")
    }
    
}


