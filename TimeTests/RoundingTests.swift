//
//  RoundingTests.swift
//  Time
//
//  Created by Christian Otkjær on 26/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import XCTest

class RoundingTests: XCTestCase
{
    let units : [NSCalendarUnit] = [.Era, .Year, .Month, .Day, .Hour, .Minute, .Second, .Nanosecond]
    
    func test_floor()
    {
        let date = NSDate()
        
        let calendar = NSCalendar.currentCalendar()
        
        XCTAssertGreaterThan(date, calendar.floor(date, toWhole: .Minute)!)
        
        XCTAssertGreaterThanOrEqual(calendar.floor(date, toWhole: .Second)!, calendar.floor(date, toWhole: .Minute)!)
        XCTAssertGreaterThanOrEqual(calendar.floor(date, toWhole: .Minute)!, calendar.floor(date, toWhole: .Hour)!)
        XCTAssertGreaterThanOrEqual(calendar.floor(date, toWhole: .Hour)!, calendar.floor(date, toWhole: .Day)!)
        XCTAssertGreaterThanOrEqual(calendar.floor(date, toWhole: .Day)!, calendar.floor(date, toWhole: .Month)!)
        XCTAssertGreaterThanOrEqual(calendar.floor(date, toWhole: .Month)!, calendar.floor(date, toWhole: .Year)!)
        XCTAssertGreaterThanOrEqual(calendar.floor(date, toWhole: .Year)!, calendar.floor(date, toWhole: .Era)!)
        
        for i in 0..<units.endIndex-1
        {
            let unit = units[i]
            let roundedDate = calendar.floor(date, toWhole: unit)!

            XCTAssertGreaterThan(date, roundedDate)

            for j in (i+1)..<units.endIndex
            {
                let smallerUnit = units[j]
                if smallerUnit != NSCalendarUnit.Nanosecond
                {
                    XCTAssertLessThanOrEqual(roundedDate, calendar.floor(date, toWhole: smallerUnit)!)
                }
                
                let comp = roundedDate.component(smallerUnit)
                let expected = calendar.rangeOfUnit(smallerUnit, inUnit: units[j-1], forDate: roundedDate).location
                
                XCTAssertEqual(comp, expected, "unit \(unit), component \(smallerUnit) is not \(expected) (is \(comp)); \(roundedDate)")
            }
        }
    }
    
    
    
    func test_ceil()
    {
        let date = NSDate()
        
        let calendar = NSCalendar.currentCalendar()
        
        XCTAssertLessThan(date, calendar.ceil(date, toWhole: .Minute)!)
        XCTAssertLessThanOrEqual(calendar.ceil(date, toWhole: .Second)!, calendar.ceil(date, toWhole: .Minute)!)
        XCTAssertLessThanOrEqual(calendar.ceil(date, toWhole: .Minute)!, calendar.ceil(date, toWhole: .Hour)!)
        XCTAssertLessThanOrEqual(calendar.ceil(date, toWhole: .Hour)!, calendar.ceil(date, toWhole: .Day)!)
        XCTAssertLessThanOrEqual(calendar.ceil(date, toWhole: .Day)!, calendar.ceil(date, toWhole: .Month)!)
        XCTAssertLessThanOrEqual(calendar.ceil(date, toWhole: .Month)!, calendar.ceil(date, toWhole: .Year)!)
//        XCTAssertLessThanOrEqual(calendar.ceil(date, toWhole: .Year)!, calendar.ceil(date, toWhole: .Era)!)
    }
}
