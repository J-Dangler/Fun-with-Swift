//
//  TipCalculator.swift
//  TipCalc
//
//  Created by Jacob Dangler on 10/10/19.
//  Copyright © 2019 Jacob Dangler. All rights reserved.
//

import Foundation

class TipCalculator {
    
    var beforeTax: Double = 0
    var afterTax: Double = 0
    var tipAmount: Double = 0
    var tipPercent: Double = 0
    
    init(beforeTax: Double, tipPercent: Double){
        self.beforeTax = beforeTax
        self.tipPercent = tipPercent
    }
    
    func calculateTip(){
        tipAmount = beforeTax * tipPercent
    }
}
