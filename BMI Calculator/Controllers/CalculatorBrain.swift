//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Gill on 2023-12-24.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
//    let backGroundColor = ""
//    let advice: String
    var bmi: BMI?
    
    let bmiMatrix = [
        BMICode(advice: "Eat more pies", color: #colorLiteral(red: 0.1960784314, green: 0.835719397, blue: 0.9019607843, alpha: 1)),
        BMICode(advice: "Keep it up", color: #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)),
        BMICode(advice: "Eat less pies", color: #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1))
    ]
   
    
    func getCategory(bmiValue: Float) -> Int{
        if(bmiValue < 18.5) {
            return 0
        } else if(bmiValue >= 18.5 && bmiValue <= 24.9) {
            return 1
        } else {
            return 2
        }
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / pow( height, 2)
        let bmiCode = bmiMatrix[getCategory(bmiValue: bmiValue)]
        self.bmi = BMI(value: bmiValue, advice: bmiCode.advice, color: bmiCode.color)
       
        
    }
    
    func getBMI() -> BMI{
        
        return bmi ?? BMI(value: 0.0, advice: "", color: UIColor.white)
    }
    
    func getHeightInFeet(height: Float)-> String {
        let inches = height * 39.3701
        
        let feet = Int(Int(inches) / 12)
        let remainingInches = inches - Float(feet * 12)
        let inchesValue = String(format:"%.0f", remainingInches)
        let heightInFeet = "\(feet)ft. \(inchesValue) inch"
        return heightInFeet
    }
    
    
}
