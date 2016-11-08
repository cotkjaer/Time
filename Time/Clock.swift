//
//  Clock.swift
//  Execution
//
//  Created by Christian Otkjær on 10/11/15.
//  Copyright © 2015 Christian Otkjær. All rights reserved.
//

import Foundation

private let debugFormatter = DateFormatter(timeStyle: .full, dateStyle: .none)

open class Clock
{
    fileprivate let calendar = Calendar.autoupdatingCurrent
    
    let unit: NSCalendar.Unit
    let closure : (()->())

    fileprivate var timer: Timer?
    
    public init(unit: NSCalendar.Unit, closure: @escaping ()->())
    {
        self.unit = unit
        self.closure = closure
    }
    
    deinit
    {
        timer?.invalidate()
    }
    
    open var running : Bool { return timer?.isValid == true }
    
    open func start()
    {
        scheduleTimer()
    }
    
    open func stop()
    {
        unscheduleTimer()
    }
    
    func unscheduleTimer()
    {
        timer?.invalidate()
        timer = nil
    }
    
    func scheduleTimer()
    {
        unscheduleTimer()
        
        if let date = calendar.nextWhole(unit)
        {
            debugPrint("nextdate for \(debugFormatter.string(from: Date())) -> \(debugFormatter.string(from: date))")

            let timer = Timer(fireAt: date, interval: 0, target: self, selector: #selector(Clock.handleTimer), userInfo: nil, repeats: false)
            
            RunLoop.main.add(timer, forMode: RunLoopMode.commonModes)
            
            self.timer = timer
        }
        else
        {
            debugPrint("Could not create next date")
        }
    }
    
    @objc fileprivate func handleTimer()
    {
        scheduleTimer()
        closure()
    }
}
