//
//  SecondViewController.swift
//  Tab Bar Programatico
//
//  Created by Diplomado on 29/11/24.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        self.title = "Second"
        self.tabBarItem.image = UIImage(systemName: "star")
        self.tabBarItem.selectedImage = UIImage(systemName: "star.fill")
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
