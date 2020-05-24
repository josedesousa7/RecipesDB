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
        dataManagerService.requestMeals(withMainIngredient: ingredient){ [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let success):
                self.dataManagerService.mealsList.asObservable().subscribe(onNext: {
                    meals in
                    if meals.count > 0 {
                        completion(.success(meals))
                    } else {
                        completion(.failure(RecipiesDBErrorMessages.emptySearch))
                    }
                }).dispose()
                break
            case .failure(let error):
                print(error.localizedDescription)
                break
            }
        }
    }

    func resetObservers() {
        dataManagerService.resetMealList()
    }
    
}


