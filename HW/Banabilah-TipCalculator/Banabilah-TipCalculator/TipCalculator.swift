//
//  TipCalculator.swift
//  Banabilah-TipCalculator
//
//  Created by Syreen Banabilah on 3/13/19.
//  Copyright © 2019 Syreen Banabilah. All rights reserved.
//
//
import Foundation
class TipCalculator {
    var billAmount: Double
    var tipPercentage: Double
    var tipAmount: Double
    var total: Double

    init(bill: Double, tip: Double) {
        billAmount = bill
        tipPercentage = tip
        tipAmount = billAmount * (tipPercentage / 100)
        total = billAmount + tipAmount
    }
    
}
