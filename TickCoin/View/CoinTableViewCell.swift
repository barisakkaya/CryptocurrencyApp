//
//  CoinTableViewCell.swift
//  TickCoin
//
//  Created by Barış Can Akkaya on 4.06.2021.
//

import UIKit

class CoinTableViewCell: UITableViewCell {
    @IBOutlet weak var coinName: UILabel!
    
    @IBOutlet weak var coinPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
