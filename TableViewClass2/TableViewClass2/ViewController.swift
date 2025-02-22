//
//  ViewController.swift
//  TableViewClass2
//
//  Created by Diplomado on 29/11/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    let nombres = [
        "Marco", "Ana", "Federico", "María", "Sofía",
        "Fernando", "Fabián", "Martín", "Andrés", "Fabiana",
        "Mariana", "Samuel", "Fernanda", "Sofío", "Andrea"
    ]
    
    var searchName = [String]()
    var isSearching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        searchBar.delegate = self
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            searchName.count
        }else{
            nombres.count
        }
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
        if isSearching {
            cell.textLabel?.text = searchName[indexPath.row]
        }else{
            cell.textLabel?.text = nombres[indexPath.row]
        }
        
        return cell
    }
    
    
}


extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchName = nombres.filter({$0.prefix(searchText.count) == searchText})
        isSearching = true
        tableView.reloadData()
        //print(searchName)
    }
}
