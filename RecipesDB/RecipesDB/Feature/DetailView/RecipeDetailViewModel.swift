//
//  RecipeDetailViewModel.swift
//  RecipesDB
//
//  Created by José Marques on 25/05/2020.
//  Copyright © 2020 José Marques. All rights reserved.
//

import Foundation
import UIKit

///ViewModel for detailView
class RecipeDetailViewModel {
    
    var imageService = ImageDataManager.sharedInstance
    /**
     Request the recipe image.
     - Parameter detailedRecipe: The recipe to fetch an image for
     - Parameter completion: Callback with the result. A recipe meal image or a default one
     */
    func fetchImageFor(detailedRecipe recipe: DetailedMeal,_ completion: @escaping (_ image: UIImage) -> Void) {
        imageService.requestImage(forDetailedRecipe: recipe) { (image) in
            completion(image)
        }
    }
}
