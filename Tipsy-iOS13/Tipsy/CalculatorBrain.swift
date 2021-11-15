//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Cynthia on 4/25/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    var bill: Float = 0.0
    var tip: String = "10%"
    var split: Float = 2.0
    
    func getBill() -> Float {
        return bill
    }
    
    func getTip() -> Float {
        return Float(self.tip.replacingOccurrences(of: "%", with: ""))!/100
    }

    
    func getSplit() -> Float {
        return split
    }
    
    func calculateBill() -> String {
        let billPerPerson = String(format:"%.2f" ,bill*(1+getTip())/split)
        return billPerPerson
    }
    
    func getSetting() -> String {
        let result = "Split Between \(String(format:"%.0f",split)) people, with \(tip) tip"
        return result
    }
}
