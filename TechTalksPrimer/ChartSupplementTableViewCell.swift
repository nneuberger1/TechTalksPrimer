//
//  ChartSupplementTableViewCell.swift
//  TechTalksPrimer
//
//  Created by Nicholas Neuberger on 11/4/19.
//  Copyright © 2019 Nicholas Neuberger. All rights reserved.
//

import UIKit

class ChartSupplementTableViewCell: UITableViewCell {
    
    @IBOutlet weak var geoName: UILabel!
    @IBOutlet weak var pageNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
