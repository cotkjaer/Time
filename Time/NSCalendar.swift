//
//  NSCalendar.swift
//  Silverback
//
//  Created by Christian Otkjær on 10/11/15.
//  Copyright © 2015 Christian Otkjær. All rights reserved.
//

import Foundation


// MARK: - Hashable

extension NSCalendarUnit : Hashable
{
    public var hashValue : Int { return Int(bitPattern: rawValue) }
}

// MARK: - Next whole

public extension NSCalendar
{
    /// "Rounds" the given `date` down the nearest date with all components smaller than `unit` set to 0
    /// - parameter date : An optional date to round - defaults to `NSDate()`
    /// - parameter unit : The calendar-unit to round to
    /// returns : `date` rounded to `unit`
    func floor(date: NSDate? = NSDate(), toWhole unit: NSCalendarUnit) -> NSDate?
    {
        guard let date = date else { return nil }
        
        let c = self.components([.Era, .Year, .Month, .Day, .Hour, .Minute, .Second], fromDate: date)
        
        switch unit
        {
        case NSCalendarUnit.Era:
            
            c.year = rangeOfUnit(.Year, inUnit: .Era, forDate: date).location
//            return round(dateFromComponents(c), toWhole: .Year)
            fallthrough
            
        case NSCalendarUnit.Year:
            
            c.month = rangeOfUnit(.Month, inUnit: .Year, forDate: date).location
//            return round(dateFromComponents(c), toWhole: .Month)
            fallthrough
            
        case NSCalendarUnit.Month:
            
            c.day = rangeOfUnit(.Day, inUnit: .Month, forDate: date).location
//            return round(dateFromComponents(c), toWhole: .Day)
            fallthrough
            
        case NSCalendarUnit.Day:
            
            c.hour = rangeOfUnit(.Hour, inUnit: .Day, forDate: date).location
//            return round(dateFromComponents(c), toWhole: .Hour)
            fallthrough

        case NSCalendarUnit.Hour:

            c.minute = rangeOfUnit(.Minute, inUnit: .Hour, forDate: date).location
//            return round(dateFromComponents(c), toWhole: .Minute)
            fallthrough

        case NSCalendarUnit.Minute:
            
            c.second = rangeOfUnit(.Second, inUnit: .Minute, forDate: date).location
//            return round(dateFromComponents(c), toWhole: .Second)
            fallthrough
        
        case NSCalendarUnit.Second:
            
            c.nanosecond = 0
            return dateFromComponents(c)
            
        default:
            debugPrint("Cannot round \(unit)")
        }
        
        return nil
    }

    /// "Rounds" the given `date` upwards to the the earliest date with all components smaller than `unit` set to 0, so that ceil(date, toWhole: unit) is later than date
    /// - parameter unit : The calendar-unit to search for
    /// - parameter date : An optional date from where to start the search - defaults to `NSDate()`
    /// returns : `date` rounded to `unit` and the incremented by one `unit`
    /// - note: cannot be used with `Era`
    func ceil(date: NSDate? = NSDate(), toWhole unit: NSCalendarUnit) -> NSDate?
    {
        if let roundedDate = floor(date, toWhole: unit)
        {
            return dateByAddingUnit(unit, value: 1, toDate: roundedDate, options: .MatchStrictly)
        }
        
        return nil
    }

    
    func nextWhole(unit: NSCalendarUnit, afterDate date: NSDate? = NSDate()) -> NSDate?
    {
        return ceil(date, toWhole: unit)
    }
    
}