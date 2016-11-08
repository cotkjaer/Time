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
    let units : [NSCalendar.Unit] = [.era, .year, .month, .day, .hour, .minute, .second, .nanosecond]
    
    func test_floor()
    {
        let date = Date()
        
        let calendar = Calendar.current
        
        XCTAssertGreaterThan(date, calendar.floor(date, toWhole: .minute)!)
        
        XCTAssertGreaterThanOrEqual(calendar.floor(date, toWhole: .second)!, calendar.floor(date, toWhole: .minute)!)
        XCTAssertGreaterThanOrEqual(calendar.floor(date, toWhole: .minute)!, calendar.floor(date, toWhole: .hour)!)
        XCTAssertGreaterThanOrEqual(calendar.floor(date, toWhole: .hour)!, calendar.floor(date, toWhole: .day)!)
        XCTAssertGreaterThanOrEqual(calendar.floor(date, toWhole: .day)!, calendar.floor(date, toWhole: .month)!)
        XCTAssertGreaterThanOrEqual(calendar.floor(date, toWhole: .month)!, calendar.floor(date, toWhole: .year)!)
        XCTAssertGreaterThanOrEqual(calendar.floor(date, toWhole: .year)!, calendar.floor(date, toWhole: .era)!)
        
        for i in 0..<units.endIndex-1
        {
            let unit = units[i]
            let roundedDate = calendar.floor(date, toWhole: unit)!

            XCTAssertGreaterThan(date, roundedDate)

            for j in units.indices.suffix(from: (i+1))
            {
                let smallerUnit = units[j]
                if smallerUnit != NSCalendar.Unit.nanosecond
                {
                    XCTAssertLessThanOrEqual(roundedDate, calendar.floor(date, toWhole: smallerUnit)!)
                }
                
                let comp = roundedDate.component(smallerUnit)
                let expected = (calendar as NSCalendar).range(of: smallerUnit, in: units[j-1], for: roundedDate).location
                
                XCTAssertEqual(comp, expected, "unit \(unit), component \(smallerUnit) is not \(expected) (is \(comp)); \(roundedDate)")
            }
        }
    }
    
    
    
    func test_ceil()
    {
        let date = Date()
        
        let calendar = Calendar.current
        
        XCTAssertLessThan(date, calendar.ceil(date, toWhole: .minute)!)
        XCTAssertLessThanOrEqual(calendar.ceil(date, toWhole: .second)!, calendar.ceil(date, toWhole: .minute)!)
        XCTAssertLessThanOrEqual(calendar.ceil(date, toWhole: .minute)!, calendar.ceil(date, toWhole: .hour)!)
        XCTAssertLessThanOrEqual(calendar.ceil(date, toWhole: .hour)!, calendar.ceil(date, toWhole: .day)!)
        XCTAssertLessThanOrEqual(calendar.ceil(date, toWhole: .day)!, calendar.ceil(date, toWhole: .month)!)
        XCTAssertLessThanOrEqual(calendar.ceil(date, toWhole: .month)!, calendar.ceil(date, toWhole: .year)!)
//        XCTAssertLessThanOrEqual(calendar.ceil(date, toWhole: .Year)!, calendar.ceil(date, toWhole: .Era)!)
    }
}
