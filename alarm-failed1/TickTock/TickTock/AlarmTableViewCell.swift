//
//  AlarmTableViewCell.swift
//  TickTock
//
//  Created by chelseaGJW on 16/5/22.
//  Copyright © 2016年 LazyHuskies. All rights reserved.
//

import UIKit

class AlarmTableViewCell: UITableViewCell {

    
   /* @IBOutlet weak var alarmTime: UILabel!
    @IBOutlet weak var alarmDestination: UILabel!
    @IBOutlet weak var alarmToggle: UISwitch!
    */
    
    @IBOutlet var alarmswitch: UISwitch!
    @IBOutlet var alarmTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.alarmswitch.addTarget(self, action: Selector("stateChanged:"), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func stateChanged(switchState: UISwitch) {
        if switchState.on {
            alarmTime.textColor = UIColor(hue: 0.5833, saturation: 0.44, brightness: 0.36, alpha: 1.0)
            
        } else {
            alarmTime.textColor = UIColor.lightGrayColor()
            
        }
    }
    


}
