//
//  ResultsViewController.swift
//  BMI Calculator
//
//  Created by Gill on 2023-12-24.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var bmiValue: String?
    var advice: String?
    var backgroundColor: UIColor?
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiLabel.text = bmiValue
        adviceLabel.text = advice
        view.backgroundColor = backgroundColor
        // Do any additional setup after loading the view.
    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
   

}
