//
//  ViewController.swift
//  Tab Bar Programatico
//
//  Created by Diplomado on 29/11/24.
//

import UIKit

class ViewController: UITabBarController {

    var first = FirstViewController()
    var second = SecondViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setViewControllers([second, first, first, first, first, first], animated: true)
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = .black
        // Do any additional setup after loading the view.
    }

    

}

