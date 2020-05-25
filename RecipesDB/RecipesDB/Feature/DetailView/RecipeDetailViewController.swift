//
//  RecipeDetailViewController.swift
//  RecipesDB
//
//  Created by José Marques on 24/05/2020.
//  Copyright © 2020 José Marques. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {
    

    var recipe : DetailedMeal?
    var viewModel: RecipeDetailViewModel?
    
    @IBOutlet weak var recipePhotoImageView: UIImageView!
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!
    @IBOutlet weak var recipeCategoryLabel: UILabel!
    @IBOutlet weak var recipeAreaLabel: UILabel!
    
    @IBOutlet weak var ingredient1Label: UILabel!
    @IBOutlet weak var ingredient2Label: UILabel!
    @IBOutlet weak var ingredient3Label: UILabel!
    @IBOutlet weak var ingredient4Label: UILabel!
    @IBOutlet weak var ingredient5Label: UILabel!
    @IBOutlet weak var ingredient6Label: UILabel!
    @IBOutlet weak var ingredient7Label: UILabel!
    @IBOutlet weak var ingredient8Label: UILabel!
    @IBOutlet weak var ingredient9Label: UILabel!
    @IBOutlet weak var ingredient10Label: UILabel!
    @IBOutlet weak var ingredient11Label: UILabel!
    @IBOutlet weak var ingredient12Label: UILabel!
    @IBOutlet weak var ingredient13Label: UILabel!
    @IBOutlet weak var ingredient14Label: UILabel!
    @IBOutlet weak var ingredient15Label: UILabel!
    @IBOutlet weak var ingredient16Label: UILabel!
    @IBOutlet weak var ingredient17Label: UILabel!
    @IBOutlet weak var ingredient18Label: UILabel!
    @IBOutlet weak var ingredient19Label: UILabel!
    @IBOutlet weak var ingredient20Label: UILabel!
    
    
    @IBOutlet weak var quantity1Label: UILabel!
    @IBOutlet weak var quantity2Label: UILabel!
    @IBOutlet weak var quantity3Label: UILabel!
    @IBOutlet weak var quantity4Label: UILabel!
    @IBOutlet weak var quantity5Label: UILabel!
    @IBOutlet weak var quantity6Label: UILabel!
    @IBOutlet weak var quantity7Label: UILabel!
    @IBOutlet weak var quantity8Label: UILabel!
    @IBOutlet weak var quantity9Label: UILabel!
    @IBOutlet weak var quantity10Label: UILabel!
    @IBOutlet weak var quantity11Label: UILabel!
    @IBOutlet weak var quantity12Label: UILabel!
    @IBOutlet weak var quantity13Label: UILabel!
    @IBOutlet weak var quantity14Label: UILabel!
    @IBOutlet weak var quantity15Label: UILabel!
    @IBOutlet weak var quantity16Label: UILabel!
    @IBOutlet weak var quantity17Label: UILabel!
    @IBOutlet weak var quantity18Label: UILabel!
    @IBOutlet weak var quantity19Label: UILabel!
    @IBOutlet weak var quantity20Label: UILabel!
    
    @IBOutlet weak var instrunctionsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = RecipeDetailViewModel()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let recipe = recipe {
            setupViewFor(recipe: recipe)
        }
        
        if let recipe = recipe {
            viewModel?.fetchImageFor(forDetailedRecipe: recipe, {(image) in
                self.recipePhotoImageView.image = image
            })
        }
    }
    
    func setupViewFor(recipe:DetailedMeal) {
        recipeNameLabel.text = recipe.strMeal
        recipeAreaLabel.text = recipe.strArea
        recipeCategoryLabel.text = recipe.strCategory
        instrunctionsLabel.text = recipe.strInstructions
        
        if let ingredient1 = recipe.strIngredient1 {
            ingredient1Label.text = ingredient1
        }
        if let ingredient2 = recipe.strIngredient2 {
            ingredient2Label.text = ingredient2
        }
        if let ingredient3 = recipe.strIngredient3 {
            ingredient3Label.text = ingredient3
        }
        if let ingredient4 = recipe.strIngredient4 {
            ingredient4Label.text = ingredient4
        }
        if let ingredient5 = recipe.strIngredient5 {
            ingredient5Label.text = ingredient5
        }
        if let ingredient6 = recipe.strIngredient6 {
            ingredient6Label.text = ingredient6
        }
        if let ingredient7 = recipe.strIngredient7 {
            ingredient7Label.text = ingredient7
        }
        if let ingredient8 = recipe.strIngredient8 {
            ingredient8Label.text = ingredient8
        }
        if let ingredient9 = recipe.strIngredient9 {
            ingredient9Label.text = ingredient9
        }
        if let ingredient10 = recipe.strIngredient10 {
            ingredient10Label.text = ingredient10
        }
        if let ingredient11 = recipe.strIngredient11 {
            ingredient11Label.text = ingredient11
        }
        if let ingredient12 = recipe.strIngredient12 {
            ingredient12Label.text = ingredient12
        }
        if let ingredient13 = recipe.strIngredient13 {
            ingredient13Label.text = ingredient13
        }
        if let ingredient14 = recipe.strIngredient14 {
            ingredient14Label.text = ingredient14
        }
        if let ingredient15 = recipe.strIngredient15 {
            ingredient15Label.text = ingredient15
        }
        if let ingredient16 = recipe.strIngredient16 {
            ingredient16Label.text = ingredient16
        }
        if let ingredient17 = recipe.strIngredient17 {
            ingredient17Label.text = ingredient17
        }
        if let ingredient18 = recipe.strIngredient18 {
            ingredient18Label.text = ingredient18
        }
        if let ingredient19 = recipe.strIngredient19 {
            ingredient19Label.text = ingredient19
        }
        if let ingredient20 = recipe.strIngredient20 {
            ingredient20Label.text = ingredient20
        }
        if let quantity1 = recipe.strMeasure1 {
            quantity1Label.text = quantity1
        }
        if let quantity2 = recipe.strMeasure2 {
            quantity2Label.text = quantity2
        }
        if let quantity3 = recipe.strMeasure3 {
            quantity3Label.text = quantity3
        }
        if let quantity4 = recipe.strMeasure4 {
            quantity4Label.text = quantity4
        }
        if let quantity5 = recipe.strMeasure5 {
            quantity5Label.text = quantity5
        }
        if let quantity6 = recipe.strMeasure6 {
            quantity6Label.text = quantity6
        }
        if let quantity7 = recipe.strMeasure7 {
            quantity7Label.text = quantity7
        }
        if let quantity8 = recipe.strMeasure8 {
            quantity8Label.text = quantity8
        }
        if let quantity9 = recipe.strMeasure9 {
            quantity9Label.text = quantity9
        }
        if let quantity10 = recipe.strMeasure10 {
            quantity10Label.text = quantity10
        }
        if let quantity11 = recipe.strMeasure11 {
            quantity11Label.text = quantity11
        }
        if let quantity12 = recipe.strMeasure12 {
            quantity12Label.text = quantity12
        }
        if let quantity13 = recipe.strMeasure13 {
            quantity13Label.text = quantity13
        }
        if let quantity14 = recipe.strMeasure14 {
            quantity14Label.text = quantity14
        }
        if let quantity15 = recipe.strMeasure15 {
            quantity15Label.text = quantity15
        }
        if let quantity16 = recipe.strMeasure16 {
            quantity16Label.text = quantity16
        }
        if let quantity17 = recipe.strMeasure17 {
            quantity17Label.text = quantity17
        }
        if let quantity18 = recipe.strMeasure18 {
            quantity18Label.text = quantity18
        }
        if let quantity19 = recipe.strMeasure19 {
            quantity19Label.text = quantity19
        }
        if let quantity20 = recipe.strMeasure20 {
            quantity20Label.text = quantity20
        }
    }
}
