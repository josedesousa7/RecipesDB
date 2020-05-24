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
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
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
            case .success:
                self.collectionView.reloadData()
                self.view.endEditing(true)
                break
            case .failure(let error):
                self.collectionView.reloadData()
                self.view.endEditing(true)
                print(error.localizedDescription)
                break
            }
        })
    }
}

extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let itemsCont = viewModel?.mealsList.count else {
            return 0
        }
        if itemsCont > 20 {
            return 20
        } else {
        return itemsCont
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Utils.cellIdentifiers.searchResultCell.rawValue, for: indexPath) as? SearchResultsCollectionViewCell else {
            return SearchResultsCollectionViewCell()
        }
        let meal = viewModel?.mealsList[indexPath.row]
        cell.configureCellFor(recipe: meal)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let meal = viewModel?.mealsList[indexPath.row] else { return  }
        viewModel?.requestMealDetailsFor(meal: meal,{[weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                print(data.first)
                break
            case .failure(let error):
                print(error.localizedDescription)
                break
            }
        })
    }

 }

