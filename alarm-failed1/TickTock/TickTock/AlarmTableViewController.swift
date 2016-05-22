//
//  AlarmTableViewController.swift
//  TickTock
//
//  Created by Jingwen Guo on 5/22/16.
//  Copyright © 2016 LazyHuskies. All rights reserved.
//

import UIKit

class AlarmTableViewController: UITableViewController {
        var alarms:[Alarm] = []
        let noDataLabel = UILabel()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.clearsSelectionOnViewWillAppear = true
            
            
            // Check if empty
            noDataLabel.text = "No scheduled alarms"
            noDataLabel.textAlignment = NSTextAlignment.Center
            noDataLabel.textColor = UIColor(hue: 0.5833, saturation: 0.44, brightness: 0.36, alpha: 1.0)
            noDataLabel.alpha = 0.0
            self.tableView.backgroundView = noDataLabel
            checkScheduledAlarms()
            
            // Enable edit button
            self.navigationItem.leftBarButtonItem = self.editButtonItem()
            
            // Manage selection during editing mode
            self.tableView.allowsSelection = false
            self.tableView.allowsSelectionDuringEditing = true
            
        }
        
        override func viewWillAppear(animated: Bool) {
            checkScheduledAlarms()
        }
        
        /* HANDLE EMPTY DATA SOURCE */
        
        func checkScheduledAlarms () {
            UIView.animateWithDuration(0.25, animations: {
                if self.alarms.count == 0 {
                    self.noDataLabel.alpha = 1.0
                } else {
                    self.noDataLabel.alpha = 0.0
                }
            })
        }
        
        /* CONFIGURE ROWS AND SECTIONS */
        
        override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
            return 1
        }
        
        override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return alarms.count
        }
        
        /* CONFIGURE CELL */
        
        override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier("alarmCell", forIndexPath: indexPath) as! AlarmTableViewCell
            cell.alarmTime.text! = alarms[indexPath.row].getWakeupString()
            cell.alarmswitch.addTarget(self, action: Selector("switchAlarm:"), forControlEvents: UIControlEvents.ValueChanged)
            cell.accessoryView = cell.alarmswitch
            return cell
        }
        
        /* Switch ALARM STATE */
        
        func switchAlarm (switchState: UISwitch) {
            let index = switchState.tag
            
            if switchState.on {
               
            } else {
               
            }
    }
    
        /* ENABLE EDITING */
        
        override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
            if editingStyle == .Delete {
                
                checkScheduledAlarms()
            }
        }
        
        override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            
            
            if (self.editing == true) {
                performSegueWithIdentifier("editAlarm", sender: self)
            }
        }
        
        /* NAVIGATION */
        
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            
    }
        
    
    @IBAction func cancelAlarm (segue:UIStoryboardSegue) {
            // Do nothing!
        }
        
 
    

}

