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

class ImageDataManager {
    static let sharedInstance = ImageDataManager()

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
    }

