//
//  ClockTests.swift
//  Silverback
//
//  Created by Christian Otkjær on 10/11/15.
//  Copyright © 2015 Christian Otkjær. All rights reserved.
//

import XCTest
@testable import Time

class ClockTests: XCTestCase
{
    func testSecond()
    {
        var runCounter = 0

        let expectation = self.expectation(description: "Got to ten")

        let clock = Clock(unit: .second) {
            
            runCounter += 1
        
            if runCounter > 3 { expectation.fulfill() }
        }

        XCTAssertEqual(runCounter, 0)
        XCTAssertEqual(clock.running, false)

        clock.start()
        
        XCTAssertEqual(runCounter, 0)
        XCTAssertEqual(clock.running, true)
        
        waitForExpectations(timeout: 5) { e in
            
            if let error = e
            {
                XCTFail("Error: \(error.localizedDescription)")
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
