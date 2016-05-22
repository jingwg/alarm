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
    
    private(set) var UUID: String
    private(set) var isActive: Bool
    private(set) var wakeup: NSDate
    
       /* CONSTRUCTORS */
    
    init () {
        self.UUID = NSUUID().UUIDString
        self.isActive = true
        self.wakeup = NSDate()
        //self.wakeup = calculateWakeup()
    }
    
    init (UUID: String = NSUUID().UUIDString) {
        self.UUID = UUID
        self.isActive = true
        self.wakeup = NSDate()
        //self.wakeup = calculateWakeup()
    }
    
    init (copiedAlarm: Alarm) {
        self.UUID = copiedAlarm.UUID
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
        self.UUID = newID
    }
    
    
    func setWakeup (wakeup: NSDate) {
        self.wakeup = wakeup
    }
    
    /* SERIALIZATION */
    
    func toDictionary () -> NSDictionary {
        let dict: NSDictionary = [
            "UUID": self.UUID,
            "isActive": self.isActive,
            "wakeup": self.wakeup
        ]
        return dict
    }
    
    func fromDictionary (dict: NSDictionary) {
        self.UUID = dict.valueForKey("UUID") as! String
        self.isActive = dict.valueForKey("isActive") as! Bool
        self.wakeup = dict.valueForKey("wakeup") as! NSDate
    }
}