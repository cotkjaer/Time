//
//  DateTests.swift
//  Time
//
//  Created by Christian Otkjær on 26/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import XCTest

class DateTests: XCTestCase
{
    func test_Equality()
    {
        let date = NSDate()
        
        XCTAssert(date == date)
        
        XCTAssert(NSDate.distantFuture() == NSDate.distantFuture())
        
        XCTAssert(NSDate.distantPast() == NSDate.distantPast())
    }
    
    
    func test_Comparable()
    {
        let date = NSDate()
        
        XCTAssertFalse(date > date)
        XCTAssertFalse(date < date)
        
        XCTAssert(NSDate.distantFuture() > date)
        
        XCTAssert(NSDate.distantPast() < date)
    }
    
}
