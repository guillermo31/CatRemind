//
//  CatFood.swift
//  CatRemind
//
//  Created by Guillermo Ramos  on 3/5/19.
//  Copyright © 2019 Guillermo Ramos . All rights reserved.
//

import Foundation
import UIKit

class CatFood
{
    //size in pounds
    private var foodSize: Double
    private var foodType: String
    
    private var firstDate: String
    
    
    init(size: Double, type: String)
    {
        self.foodSize = size
        self.foodType = type
        self.firstDate = ""
    }
    
    //getters and setters
    public func setFirstDate()
    {
        self.firstDate = getCurrentDate()
    }
    
    
    //helper methods
    public func whenDryRunsOut() -> Double
    {
        var days = 0.0
        //serving in pounds
        let dailyServing = 0.4
        
        days = foodSize / dailyServing
        
        return days
    }
    public func whenWetRunsOut() -> Double
    {
        var days = 0.0
        //serving in pounds
        let dailyServing = 0.375
        
        days = foodSize / dailyServing
        
        return days
    }
    
    public func getCurrentDate() -> String
    {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .medium
        
        let str = formatter.string(from: Date())
        
        return str
    }
    
    
    
    
    
}
