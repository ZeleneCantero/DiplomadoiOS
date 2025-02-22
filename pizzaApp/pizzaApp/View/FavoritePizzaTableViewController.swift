//
//  FavoritePizzaTableViewController.swift
//  pizzaApp
//
//  Created by Diplomado on 25/01/25.
//

import UIKit

class FavoritePizzaTableViewController: UITableViewController {

    private let viewModel = FavoritePizzaViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: viewModel.cellIdentifier)
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Favorite pizza"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        
//        let authenticationViewController = AuthenticationViewController()
//        present(authenticationViewController, animated: true)
    }

    override func viewWillAppear(_ animated: Bool) {
        viewModel.updateFavoritePizzaTable()
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return viewModel.numberOfRows
        }else {
            return viewModel.numberOfRowsPizzeria
        }
        
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.cellIdentifier,
                                                 for: indexPath)
        
        if indexPath.section == 0 {
            let pizza = viewModel.pizza(at: indexPath)
            
            var configuration = cell.defaultContentConfiguration()
            configuration.text = pizza.name
            cell.contentConfiguration = configuration
            cell.accessoryType = .disclosureIndicator
            return cell
        } else {
            let pizzeria = viewModel.pizzeria(at: indexPath)
            
            var configuration = cell.defaultContentConfiguration()
            configuration.text = pizzeria.name
            cell.contentConfiguration = configuration
            cell.accessoryType = .disclosureIndicator
            return cell
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            let pizza = viewModel.pizza(at: indexPath)
            let pizzaDetailViewController = PizzaDetailViewController(pizza: pizza)

            navigationController?.pushViewController(pizzaDetailViewController, animated: true)
        case 1:
            let pizzeria = viewModel.pizzeria(at: indexPath)
            let pizzeriaDetailViewController = PizzeriaDetailViewController(pizzeria: pizzeria)

            navigationController?.pushViewController(pizzeriaDetailViewController, animated: true)
        default:
            print()
        }
    }


    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Pizzas"
        } else {
            return "Pizzeria"
        }
    }
    

}
