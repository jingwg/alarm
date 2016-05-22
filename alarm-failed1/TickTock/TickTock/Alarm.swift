//
//  Alarm.swift
//  TickTock
//
//  Created by Jingwen Guo on 5/22/16.
//  Copyright © 2016 LazyHuskies. All rights reserved.
//

import Foundation

class Alarm {
    
    /* FIELDS */
    
    private var AlarmID: String
    private var isActive: Bool
    private var wakeup: NSDate
    
       /* CONSTRUCTORS */
    
    init () {
        self.AlarmID = NSUUID().UUIDString
        self.isActive = true
        self.wakeup = NSDate()
        //self.wakeup = calculateWakeup()
    }
    
    init (UUID: String = NSUUID().UUIDString) {
        self.AlarmID = UUID
        self.isActive = true
        self.wakeup = NSDate()
        //self.wakeup = calculateWakeup()
    }
    
    init (copiedAlarm: Alarm) {
        self.AlarmID = copiedAlarm.AlarmID
        self.isActive = copiedAlarm.isActive
        self.wakeup = copiedAlarm.wakeup
    }
    
    /* METHODS */
    
    func copy() -> Alarm {
        return Alarm(copiedAlarm: self)
    }
    
    func turnOn () {
        self.isActive = true
    }
    
    func turnOff () {
        self.isActive = false
    }
    
    func getWakeupString () -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        return dateFormatter.stringFromDate(self.wakeup)
    }
    

    
    /* ACCESS CONTROL METHODS */
    
    func setUUID (newID: String) {
        self.AlarmID = newID
    }
    
    
    func setWakeup (wakeup: NSDate) {
        self.wakeup = wakeup
    }
    
    /* SERIALIZATION */
    
    func toDictionary () -> NSDictionary {
        let dict: NSDictionary = [
            "AlarmID": self.AlarmID,
            "isActive": self.isActive,
            "wakeup": self.wakeup
        ]
        return dict
    }
    
    func fromDictionary (dict: NSDictionary) {
        self.AlarmID = dict.valueForKey("AlarmID") as! String
        self.isActive = dict.valueForKey("isActive") as! Bool
        self.wakeup = dict.valueForKey("wakeup") as! NSDate
    }
}