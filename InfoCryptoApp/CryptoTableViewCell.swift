//
//  TableViewCell.swift
//  InfoCryptoApp
//
//  Created by SIMONOV on 12.08.2022.
//

import UIKit

class CryptoTableViewCell: UITableViewCell {

    static let identifire = "CryptoTableViewCell"
    
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var symbolLabel: UILabel!
    
    @IBOutlet var priceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(model: CryptoData) {
        nameLabel.text = model.name
        symbolLabel.text = model.symbol
        priceLabel.text = model.price
    }

}
