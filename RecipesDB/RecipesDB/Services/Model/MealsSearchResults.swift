//
//  MealsSearchResults.swift
//  RecipesDB
//
//  Created by José Marques on 22/05/2020.
//  Copyright © 2020 José Marques. All rights reserved.
//

import Foundation

/// Model to parse a request for a list of recipes by main ingredient

struct MealsSearchResults : Codable {
    let meals : [Meal]?
}
