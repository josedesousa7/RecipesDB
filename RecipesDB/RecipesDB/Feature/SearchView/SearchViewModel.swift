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
         dataManagerService.requestMeals(withMainIngredient: ingredient)
        dataManagerService.mealsList.asObservable().subscribe(onNext: {
            meals in
            if meals.count > 0 {
                completion(.success(meals))
            } else {
                completion(.failure(RecipiesDBErrorMessages.emptySearch))
            }
        }).disposed(by: disposeBag)
        }
    }

