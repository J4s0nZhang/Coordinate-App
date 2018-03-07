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
    //Connections for outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    //Prepares the receiver for service after it has been loaded from a nib file, or an Interface Builder archive
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //Sets the selected state of the table view cell
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
