//
//  SearchViewController.swift
//  RecipesDB
//
//  Created by José Marques on 22/05/2020.
//

import UIKit

class SearchViewController: UIViewController {

    var viewModel: SearchViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        let service = DataManager()
        viewModel = SearchViewModel(service: service)
        viewModel?.requestAvailableMealsForIngredient(ingredient: "chickenbreast",{ (result) in
           // guard let self = self else { return }
            switch result {
            case .success(let data):
               print(data)
                break
            case .failure(let error):
                print(error.localizedDescription)
                break
            }
        })

        // Do any additional setup after loading the view.
    }


}

