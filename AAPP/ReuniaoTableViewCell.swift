//
//  ReuniaoTableViewCell.swift
//  AAPP
//
//  Created by Arthur Castro on 25/05/19.
//  Copyright © 2019 Arthur Castro. All rights reserved.
//

import UIKit

class ReuniaoTableViewCell: UITableViewCell {
    
    
    
    
    
    @IBOutlet weak var daysLabel: UILabel!
    
    @IBOutlet weak var textName: UILabel!
    
    var dailyMeeting: DailyMeeting? {
        didSet {
            self.textName.text = dailyMeeting?.hour
            self.daysLabel.text = dailyMeeting?.day
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
