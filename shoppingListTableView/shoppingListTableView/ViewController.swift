//
//  ViewController.swift
//  shoppingListTableView
//
//  Created by Diplomado on 23/11/24.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var textFieldAddProduct: UITextField!
    var nameProduct = ["Aceite", "Agua", "Carne", "Chicle", "Huevo", "Jabon", "Leche", "Limon", "Pan", "Ropa"]
    let productImageName = ["aceite", "agua", "carne", "chicle", "huevo", "jabon", "leche", "limon", "pan", "ropa"]
    var productBought: [String] = []
    @IBOutlet weak var tableView: UITableView!
    

    @IBAction func buttonNextScreen(_ sender: Any) {
        performSegue(withIdentifier: "nextScreen", sender: nil)
    }
    
    @IBAction func buttonAddProduct(_ sender: Any){
        if !textFieldAddProduct.text!.isEmpty {
            nameProduct.append(textFieldAddProduct.text!)
            textFieldAddProduct.text = ""
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        let xib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "cell")
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewCS = segue.destination as? ViewControllerShopping {
            viewCS.productBought = productBought
            viewCS.delegate = self 
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Da igual cual se ponga tienen el mismo tamaño
        return nameProduct.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
        cell.productViewController = self
        cell.buttonNameProduct.setTitle(nameProduct[indexPath.row], for: .normal)
        cell.buttonNameProduct.tag = indexPath.row
        print(nameProduct)
        print("INDICE ", nameProduct[indexPath.row])
        if productImageName.contains(nameProduct[indexPath.row].lowercased()){
            cell.imageProduct.image = UIImage(named: productImageName[indexPath.row])
        }else{
            cell.imageProduct.image = UIImage(systemName: "cart.fill")
          
        }
        return cell
    }
}

extension ViewController: ViewControllerShoppingDelegate {
    func didDeleteProduct(_ productBought: [String]) {
        self.productBought = productBought
        tableView.reloadData()
    }
}
