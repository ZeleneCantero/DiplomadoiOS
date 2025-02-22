//
//  CustomShoppingTableViewCell.swift
//  shoppingListTableView
//
//  Created by Diplomado on 23/11/24.
//

import UIKit

class CustomShoppingTableViewCell: UITableViewCell {

    @IBOutlet weak var labelProductBought: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
