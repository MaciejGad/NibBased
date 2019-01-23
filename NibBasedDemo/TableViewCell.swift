//
//  TableViewCell.swift
//  NibBasedDemo
//
//  Created by Maciej Gad on 23/01/2019.
//  Copyright © 2019 MaciejGad. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var indexPathLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
