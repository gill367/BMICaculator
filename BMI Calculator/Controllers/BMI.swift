//
//  BMI.swift
//  BMI Calculator
//
//  Created by Gill on 2023-12-24.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

class BMI : BMICode {
    var value: Float
    
    init(value: Float, advice: String, color: UIColor) {
        self.value = value
        super.init(advice: advice, color: color)
        
    }
}
