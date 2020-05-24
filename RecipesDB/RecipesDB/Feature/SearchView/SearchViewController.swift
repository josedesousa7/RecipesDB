//
//  SearchViewController.swift
//  RecipesDB
//
//  Created by José Marques on 22/05/2020.
//

import UIKit

class SearchViewController: UIViewController {

    var viewModel: SearchViewModel?

    @IBOutlet weak var searchBar: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        let service = DataManager()
        viewModel = SearchViewModel(service: service)
        self.searchBar.delegate = self
        // Do any additional setup after loading the view.
    }
}

extension SearchViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let integredientToSearch = searchBar.text else {
            return
        }
        viewModel?.requestAvailableMealsForIngredient(ingredient: integredientToSearch, {[weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                print(data)
                self.view.endEditing(true)
                break
            case .failure(let error):
                self.view.endEditing(true)
                print(error.localizedDescription)
                break
            }
        })
    }

}

