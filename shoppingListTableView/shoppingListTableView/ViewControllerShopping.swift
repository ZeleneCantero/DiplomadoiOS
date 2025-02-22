//
//  ViewControllerShopping.swift
//  shoppingListTableView
//
//  Created by Diplomado on 23/11/24.
//

import UIKit

// Protocolo para delegar la eliminación de productos
protocol ViewControllerShoppingDelegate: AnyObject {
    func didDeleteProduct(_ productBought: [String])
}

class ViewControllerShopping: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var productBought: [String] = []
    weak var delegate: ViewControllerShoppingDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        let xib = UINib(nibName: "CustomShoppingTableViewCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "cell")
    }
}

extension ViewControllerShopping: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productBought.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomShoppingTableViewCell
        cell.labelProductBought.text = productBought[indexPath.row]
        cell.backgroundColor = UIColor(red: 1.0, green: 0.8, blue: 0.8, alpha: 1.0)
        cell.accessoryType = .disclosureIndicator //la barrita de lado
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let alertController = UIAlertController(title: "Confirm Delete", message: "¿Seguro que quieres eliminar este producto?", preferredStyle: .alert)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { (action) in
                self.productBought.remove(at: indexPath.row)
                tableView.reloadData()
                
                
                self.delegate?.didDeleteProduct(self.productBought)
            }
            alertController.addAction(deleteAction)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            
            present(alertController, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Delete Product"
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
