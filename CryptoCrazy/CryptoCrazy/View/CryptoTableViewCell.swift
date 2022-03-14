//
//  CryptoTableViewCell.swift
//  CryptoCrazy
//
//  Created by Adem Deliaslan on 14.03.2022.
//

import UIKit

class CryptoTableViewCell: UITableViewCell {

    @IBOutlet weak var currencyTextLabel: UILabel!
    @IBOutlet weak var priceTextLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
