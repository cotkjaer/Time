//
//  DateComponents.swift
//  Time
//
//  Created by Christian Otkjær on 24/10/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import Foundation

extension DateComponents
{
    public init(count: Int, unit: NSCalendar.Unit, calendar : Calendar? = nil, timeZone: TimeZone? = nil)
    {
        self.init(
            calendar: calendar,
            timeZone: timeZone,
            era: unit == .era ? count : nil,
            year: unit == .year ? count : nil,
            month: unit == .month ? count : nil,
            day: unit == .day ? count : nil,
            hour: unit == .hour ? count : nil,
            minute: unit == .minute ? count : nil,
            second: unit == .second ? count : nil,
            nanosecond: unit == .nanosecond ? count : nil,
            weekday: unit == .weekday ? count : nil,
            weekdayOrdinal: unit == .weekdayOrdinal ? count : nil,
            quarter: unit == .quarter ? count : nil,
            weekOfMonth: unit == .weekOfMonth ? count : nil,
            weekOfYear: unit == .weekOfYear ? count : nil,
            yearForWeekOfYear: unit == .yearForWeekOfYear ? count : nil)
    }
}
