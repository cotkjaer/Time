//
//  NSDate.swift
//  Silverback
//
//  Created by Christian Otkjær on 23/10/15.
//  Copyright © 2015 Christian Otkjær. All rights reserved.
//

import Foundation
import UIKit

//extension Date: Comparable { }

//public func == (lhs: Date, rhs: Date) -> Bool
//{
//    return lhs === rhs || lhs.compare(rhs) == .orderedSame
//}

public func < (lhs: Date, rhs: Date) -> Bool
{
    return lhs.compare(rhs) == .orderedAscending
}

//MARK: - relative

public extension Date
{
    func hoursMinutesSecondsSinceDate(_ date: Date) -> (before: Bool, hours: Int, minutes: Int, seconds: Int)
    {
        let interval = timeIntervalSince(date)
        
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
    
    func days(since: Date) -> Int
    {
        return Calendar.current.days(between: since, and: self)
    }
}

//MARK: - Components

public extension Date
{
    
    func component(_ unit: NSCalendar.Unit, inCalendar calendar: Calendar = Calendar.current) -> Int
    {
        return (calendar as NSCalendar).component(unit, from: self)
    }

    //MARK: - weekday

    
    func weekday(_ calendar: Calendar = Calendar.current) -> Int
    {
        return component(.weekday, inCalendar:  calendar)
    }
}

//MARK: - Seconds

extension Date
{
    public var secondsSinceReferenceDate : Int
    {
        return Int(floor(timeIntervalSinceReferenceDate))
    }
}

