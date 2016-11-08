//
//  NSCalendarUNit.swift
//  Time
//
//  Created by Christian Otkjær on 26/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import Foundation

// MARK: - CustomDebugStringConvertible

extension NSCalendar.Unit : CustomDebugStringConvertible, CustomStringConvertible
{
    internal static func nameFor(_ unit: NSCalendar.Unit) -> String
    {
        switch unit
        {
        case era /* NSEraCalendarUnit */: return "Era"
        case year /* NSYearCalendarUnit */: return "Year"
        case month /* NSMonthCalendarUnit */: return "Month"
        case day /* NSDayCalendarUnit */: return "Day"
        case hour /* NSHourCalendarUnit */: return "Hour"
        case minute /* NSMinuteCalendarUnit */: return "Minute"
        case second /* NSSecondCalendarUnit */: return "Second"
        case nanosecond: return "Nanosecond"
        case weekday /* NSWeekdayCalendarUnit */: return "Weekday"
        case weekdayOrdinal /* NSWeekdayOrdinalCalendarUnit */: return "WeekdayOrdinal"
        case quarter /* NSQuarterCalendarUnit */: return "Quarter"
        case weekOfMonth /* NSWeekOfMonthCalendarUnit */: return "WeekOfMonth"
        case weekOfYear /* NSWeekOfYearCalendarUnit */: return "WeekOfYear"
        case yearForWeekOfYear /* NSYearForWeekOfYearCalendarUnit */: return "YearForWeekOfYear"
        case calendar /* NSCalendarCalendarUnit */: return "Calendar"
        case timeZone /* NSTimeZoneCalendarUnit */: return "TimeZone"
        default: return "NSCalendarUnit(rawValue: \(unit.rawValue))"
        }
    }

    public var debugDescription : String { return NSCalendar.Unit.nameFor(self) }
    
    public var description : String { return NSCalendar.Unit.nameFor(self) }
}
