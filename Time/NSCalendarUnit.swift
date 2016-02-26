//
//  NSCalendarUNit.swift
//  Time
//
//  Created by Christian Otkjær on 26/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import Foundation

// MARK: - CustomDebugStringConvertible

extension NSCalendarUnit : CustomDebugStringConvertible, CustomStringConvertible
{
    internal static func nameFor(unit: NSCalendarUnit) -> String
    {
        switch unit
        {
        case Era, NSEraCalendarUnit: return "Era"
        case Year, NSYearCalendarUnit: return "Year"
        case Month, NSMonthCalendarUnit: return "Month"
        case Day, NSDayCalendarUnit: return "Day"
        case Hour, NSHourCalendarUnit: return "Hour"
        case Minute, NSMinuteCalendarUnit: return "Minute"
        case Second, NSSecondCalendarUnit: return "Second"
        case Nanosecond: return "Nanosecond"
        case Weekday, NSWeekdayCalendarUnit: return "Weekday"
        case WeekdayOrdinal, NSWeekdayOrdinalCalendarUnit: return "WeekdayOrdinal"
        case Quarter, NSQuarterCalendarUnit: return "Quarter"
        case WeekOfMonth, NSWeekOfMonthCalendarUnit: return "WeekOfMonth"
        case WeekOfYear, NSWeekOfYearCalendarUnit: return "WeekOfYear"
        case YearForWeekOfYear, NSYearForWeekOfYearCalendarUnit: return "YearForWeekOfYear"
        case Calendar, NSCalendarCalendarUnit: return "Calendar"
        case TimeZone, NSTimeZoneCalendarUnit: return "TimeZone"
        default: return "NSCalendarUnit(rawValue: \(unit.rawValue))"
        }
    }

    public var debugDescription : String { return NSCalendarUnit.nameFor(self) }
    
    public var description : String { return NSCalendarUnit.nameFor(self) }
}
