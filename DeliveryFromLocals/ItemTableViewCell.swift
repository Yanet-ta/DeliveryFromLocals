//
//  ItemTableViewCell.swift
//  DeliveryFromLocals
//
//  Created by Yana Ivanova on 16.10.16.
//  Copyright © 2016 Yana Ivanova. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
