//
//  CustomTableViewCell.swift
//  tableView
//
//  Created by Diplomado on 22/11/24.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var cellTextLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
