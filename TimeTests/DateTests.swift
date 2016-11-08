//
//  DateTests.swift
//  Time
//
//  Created by Christian Otkjær on 26/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import XCTest

fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool
{
    switch (lhs, rhs)
    {
    case let (l?, r?):
        return l < r
        
    case (nil, _?):
        return true
        
    default:
        return false
    }
}

class DateTests: XCTestCase
{
    func test_days_since()
    {
        let toDay = Calendar.current.startOfDay(for: Date())
        let tomorrow = Date(timeInterval: 24 * 60 * 60, since: toDay)
        
        XCTAssertEqual(tomorrow.days(since: toDay), 1)
        XCTAssertEqual(toDay.days(since: toDay), 0)
        XCTAssertEqual(toDay.days(since: tomorrow), -1)
    }
    
    func test_Equality()
    {
        let date = Date()
        
        XCTAssert(date == date)
        
        XCTAssert(Date.distantFuture == Date.distantFuture)
        
        XCTAssert(Date.distantPast == Date.distantPast)
    }
    
    func test_Comparable()
    {
        let date = Date()
        
        XCTAssertFalse(date > date)
        XCTAssertFalse(date < date)
        
        XCTAssert(Date.distantFuture > date)
        
        XCTAssert(Date.distantPast < date)
    }
}
