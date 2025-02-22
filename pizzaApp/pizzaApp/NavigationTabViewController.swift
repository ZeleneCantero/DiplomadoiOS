//
//  NavigationTabViewController.swift
//  pokedex-clase
//
//  Created by Alejandro Mendoza on 24/01/25.
//

import UIKit

class NavigationTabViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        
        //PIZZA
        let pizzaListViewController = PizzaListTableViewController(style: .insetGrouped)
        pizzaListViewController.tabBarItem.title = "Pizza"
        pizzaListViewController.tabBarItem.image = UIImage(systemName: "carrot")
        
        let pizzaListNavigationController = UINavigationController(rootViewController: pizzaListViewController)
        
        //PIZZERIAS
        let pizzeriasViewController = PizzeriaTableViewController(style: .insetGrouped)
        pizzeriasViewController.tabBarItem.title = "Pizzeria"
        pizzeriasViewController.tabBarItem.image = UIImage(systemName: "homekit")
        
        let pizzeriaNavigationController = UINavigationController(rootViewController: pizzeriasViewController)
        
        //INGRIDIENTES
        let ingredientsPizzaViewController = IngredientsTableViewController()
        ingredientsPizzaViewController.tabBarItem.title = "Ingredient"
        ingredientsPizzaViewController.tabBarItem.image = UIImage(systemName: "fork.knife.circle.fill")
        
        let ingredientsTableViewNavigationController = UINavigationController(rootViewController: ingredientsPizzaViewController)
        
        //FAVORITOS PIZZAS
        let favoritePizzaViewController = FavoritePizzaTableViewController(style: .insetGrouped)
        favoritePizzaViewController.tabBarItem.title = "Favorite"
        favoritePizzaViewController.tabBarItem.image = UIImage(systemName: "heart")
        
        let pizzeriasFavoritesNavigationController = UINavigationController(rootViewController: favoritePizzaViewController)
        
        viewControllers = [pizzaListNavigationController,
                           pizzeriaNavigationController,
                           pizzeriasFavoritesNavigationController,
                           ingredientsTableViewNavigationController]
    }
}
