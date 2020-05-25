//
//  RecipeDetailViewModel.swift
//  RecipesDB
//
//  Created by José Marques on 25/05/2020.
//  Copyright © 2020 José Marques. All rights reserved.
//

import Foundation
import UIKit

class RecipeDetailViewModel {
    
    var imageService = ImageDataManager.sharedInstance
    
    func fetchImageFor(detailedRecipe recipe: DetailedMeal,_ completion: @escaping (_ image: UIImage) -> Void) {
        imageService.requestImage(forDetailedRecipe: recipe) { (image) in
            completion(image)
        }
    }
}
