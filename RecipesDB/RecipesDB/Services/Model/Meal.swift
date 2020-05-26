//
//  Meal.swift
//  RecipesDB
//
//  Created by José Marques on 22/05/2020.
//  Copyright © 2020 José Marques. All rights reserved.
//

import Foundation

/// Model to parse Response from API into a meal object

struct Meal : Codable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}
