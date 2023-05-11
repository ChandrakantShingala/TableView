//
//  FoodItemTableViewCell.swift
//  TableView
//
//  Created by Chandrakant Shingala on 15/01/23.
//

import UIKit

class FoodItemTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        minusButton.layer.cornerRadius = 6
        minusButton.layer.masksToBounds = true
        plusButton.layer.cornerRadius = 6
        plusButton.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
}
