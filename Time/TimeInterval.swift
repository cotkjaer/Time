//
//  TimeInterval.swift
//  Time
//
//  Created by Christian Otkjær on 15/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

/**
 NSTimeInterval conversion extensions
 */
public extension Int
{
    var weeks: TimeInterval
        { return 7 * days }
    
    var week: TimeInterval
        { return weeks }
    
    var days: TimeInterval
        { return 24 * hours }
    
    var day: TimeInterval
        { return days }
    
    var hours: TimeInterval
        { return 60 * minutes }
    
    var hour: TimeInterval
        { return self.hours }
    
    var minutes: TimeInterval
        { return 60 * seconds }
    
    var minute: TimeInterval
        { return minutes }
    
    var seconds: TimeInterval
        { return TimeInterval(self) }
    
    var second: TimeInterval
        { return seconds }
}
