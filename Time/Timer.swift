//
//  NSTimer.swift
//  Silverback
//
//  Created by Christian Otkjær on 26/10/15.
//  Copyright © 2015 Christian Otkjær. All rights reserved.
//

import Foundation

private class TimerActor
{
    var closure: () -> ()
    
    init(_ closure: @escaping () -> ()) {
        self.closure = closure
    }
    
    @objc func fire() {
        closure()
    }
}

public extension Timer
{
    convenience init(after interval: TimeInterval, _ closure: @escaping () -> ())
    {
        let actor = TimerActor(closure)
        self.init(timeInterval: interval, target: actor, selector: #selector(TimerActor.fire), userInfo: nil, repeats: false)
    }
    
    convenience init(every interval: TimeInterval, _ closure: @escaping () -> ())
    {
        let actor = TimerActor(closure)
        self.init(timeInterval: interval, target: actor, selector: #selector(TimerActor.fire), userInfo: nil, repeats: true)
    }
}

public extension Timer
{
    class func after(_ interval: TimeInterval, _ closure: @escaping () -> ()) -> Timer
    {
        let timer = Timer(after: interval, closure)
        RunLoop.main.add(timer, forMode: RunLoopMode.commonModes)
        return timer
    }
    
    
    class func every(_ interval: TimeInterval, _ closure: @escaping () -> ()) -> Timer
    {
        let timer = Timer(every: interval, closure)
        RunLoop.main.add(timer, forMode: RunLoopMode.commonModes)
        return timer
    }
}
