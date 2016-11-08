//
//  DateFormatter.swift
//  Time
//
//  Created by Christian Otkjær on 02/11/15.
//  Copyright © 2015 Christian Otkjær. All rights reserved.
//

import Foundation

//MARK: - Convenience Init

extension DateFormatter
{
    public convenience init(dateFormat: String)
    {
        self.init()
        
        self.dateFormat = dateFormat
    }
    
    public convenience init(timeStyle: DateFormatter.Style, dateStyle: DateFormatter.Style)
    {
        self.init()
        
        self.dateStyle = dateStyle
        self.timeStyle = timeStyle
    }
}
