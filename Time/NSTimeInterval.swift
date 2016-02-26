//
//  NSTimeInterval.swift
//  Silverback
//
//  Created by Christian Otkjær on 15/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import Foundation

/**
 NSTimeInterval conversion extensions
 */
public extension Int
{
    var years: NSTimeInterval
        { return 365 * self.days }
    
    var year: NSTimeInterval
        { return self.years }
    
    var weeks: NSTimeInterval
        { return 7 * days }
    
    var week: NSTimeInterval
        { return weeks }
    
    var days: NSTimeInterval
        { return 24 * hours }
    
    var day: NSTimeInterval
        { return days }
    
    var hours: NSTimeInterval
        { return 60 * minutes }
    
    var hour: NSTimeInterval
        { return self.hours }
    
    var minutes: NSTimeInterval
        { return 60 * seconds }
    
    var minute: NSTimeInterval
        { return minutes }
    
    var seconds: NSTimeInterval
        { return NSTimeInterval(self) }
    
    var second: NSTimeInterval
        { return seconds }
}