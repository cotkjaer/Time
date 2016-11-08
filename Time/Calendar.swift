//
//  NSCalendar.swift
//  Silverback
//
//  Created by Christian Otkjær on 10/11/15.
//  Copyright © 2015 Christian Otkjær. All rights reserved.
//

import Foundation


// MARK: - Hashable

extension NSCalendar.Unit : Hashable
{
    public var hashValue : Int { return Int(bitPattern: rawValue) }
}

// MARK: - Next whole

public extension Calendar
{
    func days(between fromDateTime: Date, and toDateTime: Date) -> Int
    {
        let components = dateComponents([Calendar.Component.day], from: fromDateTime, to: toDateTime)
        
        return components.day ?? 0
    }

    /// "Rounds" the given `date` down the nearest date with all components smaller than `unit` set to 0
    /// - parameter date : An optional date to round - defaults to `NSDate()`
    /// - parameter unit : The calendar-unit to round to
    /// returns : `date` rounded to `unit`
    func floor(_ date: Date? = Date(), toWhole unit: NSCalendar.Unit) -> Date?
    {
        guard let date = date else { return nil }
        
        var c = (self as NSCalendar).components([.era, .year, .month, .day, .hour, .minute, .second], from: date)
        
        switch unit
        {
        case NSCalendar.Unit.era:
            
//            guard let r = range(of: .year, in: .era, for: date) else { return nil }
            
//            c.year = r.lowerBound
             c.year = range(of: .year, in: .era, for: date)?.lowerBound
            return floor(self.date(from: c), toWhole: .year)
            
        case NSCalendar.Unit.year:
            
            c.month = range(of: .month, in: .year, for: date)?.lowerBound
            return floor(self.date(from: c), toWhole: .month)
            
        case NSCalendar.Unit.month:
            
            c.day = range(of: .day, in: .month, for: date)?.lowerBound
            return floor(self.date(from: c), toWhole: .day)
            
        case NSCalendar.Unit.day:
            
            c.hour = range(of: .hour, in: .day, for: date)?.lowerBound
            return floor(self.date(from: c), toWhole: .hour)

        case NSCalendar.Unit.hour:

            c.minute = range(of: .minute, in: .hour, for: date)?.lowerBound
            return floor(self.date(from: c), toWhole: .minute)

        case NSCalendar.Unit.minute:
            
            c.second = range(of: .second, in: .minute, for: date)?.lowerBound
            return floor(self.date(from: c), toWhole: .second)
        
        case NSCalendar.Unit.second:
            
            c.nanosecond = 0
            return self.date(from: c)
            
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
    func ceil(_ date: Date? = Date(), toWhole unit: NSCalendar.Unit) -> Date?
    {
        if let roundedDate = floor(date, toWhole: unit)
        {
            return self.date(byAdding: DateComponents(count: 1, unit: unit), to: roundedDate, wrappingComponents: true)
            
//            return self.date(byAdding: unit, value: 1, to: roundedDate, options: .matchStrictly)
        }
        
        return nil
    }

    
    func nextWhole(_ unit: NSCalendar.Unit, afterDate date: Date? = Date()) -> Date?
    {
        return ceil(date, toWhole: unit)
    }
    
}
