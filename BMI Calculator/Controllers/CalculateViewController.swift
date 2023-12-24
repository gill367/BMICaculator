//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    let SEGUE_NAME_TO_RESULT = "goToResult"
    var calculatorBrain = CalculatorBrain()
    var bmiValue = "0.0"
    @IBOutlet weak var weigthSlider: UISlider!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var heightLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderValueChanged(_ sender: UISlider) {
        let value = String(format:"%.2f", sender.value)
        let valueInFeet = calculatorBrain.getHeightInFeet(height: sender.value)
        heightLabel.text = "\(value)m (\(valueInFeet))"
        
    }
    
    
    @IBAction func weightSliderValueChanged(_ sender: UISlider) {
        let value = Int(sender.value)
        
        weightLabel.text = "\(value)Kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weigthSlider.value
        calculatorBrain.calculateBMI(height: height, weight: weight)
        self.performSegue(withIdentifier: SEGUE_NAME_TO_RESULT, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SEGUE_NAME_TO_RESULT {
            let desitnationVC = segue.destination as! ResultsViewController
            let bmi = calculatorBrain.getBMI()
            
            desitnationVC.bmiValue = String(format: "%1.f", bmi.value)
            desitnationVC.advice = bmi.advice
            desitnationVC.backgroundColor = bmi.color
        }
        
    }
    
}

