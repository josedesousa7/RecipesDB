//
//  DetailedMealResult.swift
//  RecipesDB
//
//  Created by José Marques on 22/05/2020.
//  Copyright © 2020 José Marques. All rights reserved.
//

import Foundation

/// Model to parse a request for a detailed recipe

struct DetailedMealResult : Codable {
    var meals : [DetailedMeal]
}
