//
//  ViewController.swift
//  Auto Layout Calculator
//
//  Created by Jules Lee on 11/07/2019.
//  Copyright © 2019 Jules Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var isFinishedTypingNumber: Bool = true
    @IBOutlet weak var displayLabel: UILabel!
    private var displayValue : Double {
        get {
            guard let currentDisplayValue = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label to Double")
            }
            return currentDisplayValue
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private var calculate = CalculatorLogic()

    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        calculate.setNumber(displayValue)
        if let calcMethod = sender.currentTitle {
            if let result = calculate.logic(symbol: calcMethod) {
                displayValue = result
            }
        }
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                if numValue == "." {
                    
                    if floor(displayValue) != displayValue {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
}

