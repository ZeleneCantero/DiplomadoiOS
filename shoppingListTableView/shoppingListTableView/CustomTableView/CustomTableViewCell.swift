//
//  CustomTableViewCell.swift
//  shoppingListTableView
//
//  Created by Diplomado on 23/11/24.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var imageProduct: UIImageView!
    @IBOutlet weak var buttonNameProduct: UIButton!
    var productViewController: ViewController!
    
    @IBAction func buttonAddProduct(_ sender: UIButton) {
        sender.isSelected.toggle()

        
        if !productViewController.productBought.contains(productViewController.nameProduct[buttonNameProduct.tag]) {
            productViewController.productBought.append(productViewController.nameProduct[buttonNameProduct.tag])
            print("Is selected",productViewController.productBought)
//            sender.isSelected.toggle()
//            sender.isSelected = false
//            print(sender.isSelected)
        } else {
            if let index = productViewController.productBought.firstIndex(of: productViewController.nameProduct[buttonNameProduct.tag]) {
                productViewController.productBought.remove(at: index)
                print(productViewController.productBought)
            }
        }
        
        
        // Actualizar la lista de productos en ViewController y manejar el caso "Carrito vacío"
        if productViewController.productBought.isEmpty {
            productViewController.productBought.append("Carrito vacío")
            print(productViewController.productBought)
        } else {
            productViewController.productBought.removeAll { $0 == "Carrito vacío" }
            print(productViewController.productBought)
//            sender.isSelected.toggle()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
