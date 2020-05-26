//
//  ImageDataManager.swift
//  RecipesDB
//
//  Created by José Marques on 24/05/2020.
//  Copyright © 2020 José Marques. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

/// Manages requests for images to the API

class ImageDataManager {

    //MARK: Variables

    static let sharedInstance = ImageDataManager()

    //MARK: Network Requests
    
    /**
     Request an image for a given recipe
     - Parameter forRecipe: The recipe to request an image for
     - Parameter completion: Callback with the requested image as result or a default one in case of an error
     */
    func requestImage(forRecipe recipe: Meal, completion: @escaping (_ image: UIImage) -> Void) {
        guard let defaultImage = UIImage(named: "defaultImage") else { return }
        AF.request(recipe.strMealThumb).responseImage { response in
            switch response.result {
            case .success(let image):
                completion(image)
                break
            case .failure(let error):
                print(error.localizedDescription)
                completion(defaultImage)
                break
            }
        }
    }

    /**
     Request an image for a given recipe
     - Parameter forDetailedRecipe: The detailed recipe to request an image for
     - Parameter completion: Callback with the requested image as result or a default one in case of an error
     */

    func requestImage(forDetailedRecipe recipe: DetailedMeal, completion: @escaping (_ image: UIImage) -> Void) {
        guard let defaultImage = UIImage(named: "defaultImage") else { return }
        AF.request(recipe.strMealThumb).responseImage { response in
            switch response.result {
            case .success(let image):
                completion(image)
                break
            case .failure(let error):
                print(error.localizedDescription)
                completion(defaultImage)
                break
            }
        }
    }
}

