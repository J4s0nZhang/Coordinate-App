//
//  PlannerTableViewCell.swift
//  Scheduler and Grade Calc
//
//  Created by Huanyou Wei on 3/4/18.
//  Copyright © 2018 Huanyou Wei. All rights reserved.
//

import UIKit

class PlannerTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
