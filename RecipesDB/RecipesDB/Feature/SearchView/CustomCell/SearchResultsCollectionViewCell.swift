//
//  SearchResultsCollectionViewCell.swift
//  RecipesDB
//
//  Created by José Marques on 24/05/2020.
//  Copyright © 2020 José Marques. All rights reserved.
//

import UIKit

class SearchResultsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!

    var requestManager = ImageDataManager.sharedInstance

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        logoImageView.image = nil
    }

    func configureCellFor(recipe: Meal?) {
        guard let recipe = recipe else {return}
        self.nameLabel.text = recipe.strMeal
        requestManager.requestImage(forRecipe: recipe) { (image) in
               self.logoImageView.image = image
           }
    }


}
