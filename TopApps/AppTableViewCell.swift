//
//  AppTableViewCell.swift
//  TopApps
//
//  Created by praveen velanati on 6/22/19.
//  Copyright © 2019 praveen velanati. All rights reserved.
//

import UIKit

class AppTableViewCell: UITableViewCell {

    
    @IBOutlet weak var appIconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var devLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
