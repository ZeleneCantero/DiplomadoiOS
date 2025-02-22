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
//        tabBar.barTintColor = UIColor.lightGray
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        
        //INFO
        let detailFlagsPizzaViewController = DetailFlagsViewController()
        detailFlagsPizzaViewController.tabBarItem.title = "Ubicacion"
        detailFlagsPizzaViewController.tabBarItem.image = UIImage(systemName: "info.circle.fill")
        
        let detailFavoriteTableViewNavigationController = UINavigationController(rootViewController: detailFlagsPizzaViewController)
        
        //FAVORITOS
        let favoriteFlagsViewController = FavoriteFlagsCollectionViewController()
        favoriteFlagsViewController.tabBarItem.title = "Favoritos"
        favoriteFlagsViewController.tabBarItem.image = UIImage(systemName: "star")
        
        let favoriteFlagsNavigationController = UINavigationController(rootViewController: favoriteFlagsViewController)
        
        viewControllers = [detailFavoriteTableViewNavigationController,
                           favoriteFlagsNavigationController,
                           ]
    }
}
