//
//  NSDate.swift
//  Silverback
//
//  Created by Christian Otkjær on 23/10/15.
//  Copyright © 2015 Christian Otkjær. All rights reserved.
//

import Foundation
import UIKit

extension NSDate: Comparable { }

public func == (lhs: NSDate, rhs: NSDate) -> Bool
{
    return lhs === rhs || lhs.compare(rhs) == .OrderedSame
}

public func < (lhs: NSDate, rhs: NSDate) -> Bool
{
    return lhs.compare(rhs) == .OrderedAscending
}

//MARK: - relative

public extension NSDate
{
    func hoursMinutesSecondsSinceDate(date: NSDate) -> (before: Bool, hours: Int, minutes: Int, seconds: Int)
    {
        let interval = timeIntervalSinceDate(date)
        
        let before = interval < 0
        
        var fullSeconds = Int(floor(abs(interval)))
        
        let seconds = fullSeconds % 60
        
        fullSeconds -= seconds
        fullSeconds /= 60
        
        let minutes = fullSeconds % 60
        fullSeconds -= minutes
        fullSeconds /= 60
        
        let hours = fullSeconds
        
        return (before, hours, minutes, seconds)
    }
}

//MARK: - Components

public extension NSDate
{
    @warn_unused_result
    func component(unit: NSCalendarUnit, inCalendar calendar: NSCalendar = NSCalendar.currentCalendar()) -> Int
    {
        return calendar.component(unit, fromDate: self)
    }

    //MARK: - weekday

    @warn_unused_result
    func weekday(calendar: NSCalendar = NSCalendar.currentCalendar()) -> Int
    {
        return component(.Weekday, inCalendar:  calendar)
    }
}

//MARK: - Seconds

extension NSDate
{
    public var secondsSinceReferenceDate : Int
    {
        return Int(floor(timeIntervalSinceReferenceDate))
    }
}

