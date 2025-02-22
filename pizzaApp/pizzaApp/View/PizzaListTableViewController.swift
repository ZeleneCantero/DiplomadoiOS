//
//  PizzaListTableViewController.swift
//  pizzaApp
//
//  Created by Diplomado on 25/01/25.
//

import UIKit

class PizzaListTableViewController: UITableViewController {

    private let viewModel = PizzaListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        
        self.title = "Pizzas"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: viewModel.pizzaCellIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.reloadPizzaData()
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.pizzaCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.pizzaCellIdentifier,
                                                 for: indexPath)
        
        var cellConfiguration = cell.defaultContentConfiguration()
        let pizza = viewModel.pizza(at: indexPath)
        
        let pizzaName: String
        if viewModel.isFavorite(pizza: pizza) {
            pizzaName = pizza.name + " ♥️"
        } else {
            pizzaName = pizza.name
        }
        
        cellConfiguration.text = pizzaName
        cellConfiguration.secondaryText = pizza.name
        
        cell.contentConfiguration = cellConfiguration
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let pizza = viewModel.pizza(at: indexPath)
        let pizzaDetailViewController = PizzaDetailViewController(pizza: pizza)
        
        navigationController?.pushViewController(pizzaDetailViewController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let pizza = viewModel.pizza(at: indexPath)
        
        if viewModel.isFavorite(pizza: pizza) {
            let deleteFavoriteAction = UIContextualAction(style: .destructive, title: "Remove from favorites") { [weak self] _, _, completion in
                self?.viewModel.deletePizzaFromFavorites(at: indexPath)
                completion(true)
            }
            
            deleteFavoriteAction.backgroundColor = .black
            deleteFavoriteAction.image = UIImage(systemName: "bolt.heart.fill")
            
            return UISwipeActionsConfiguration(actions: [deleteFavoriteAction])
        } else {
            let favoriteAction = UIContextualAction(style: .normal, title: "Add to favorites") { [weak self] _, _, completion in
                self?.viewModel.addPizzaToFavorites(at: indexPath)
                completion(true)
            }
            
            favoriteAction.backgroundColor = .red
            favoriteAction.image = UIImage(systemName: "heart")
            
            return UISwipeActionsConfiguration(actions: [favoriteAction])
        }
    }
}

extension PizzaListTableViewController: PizzaListViewModelDelegate {
    func shouldReloadTableData() {
        tableView.reloadData()
    }
}

