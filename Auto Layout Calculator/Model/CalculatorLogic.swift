//
//  CalculatorLogic.swift
//  Auto Layout Calculator
//
//  Created by Jules Lee on 16/07/2019.
//  Copyright © 2019 Jules Lee. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    private var number : Double?
    
    private var inteermediateCalculation : (n1: Double, calcMethod: String)?
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    func performTwoNumCalculation(n2: Double) -> Double? {
        if let n1 = inteermediateCalculation?.n1 {
            if let operation = inteermediateCalculation?.calcMethod {
                switch operation {
                case "x":
                    return n1 * n2
                case "+":
                    return n1 + n2
                case "-":
                    return n1 - n2
                case "÷":
                    return n1 / n2
                default:
                    fatalError("The operation passed in does not match any of the cases.")
                }
            }
        }
        return 0
    }
    mutating func logic(symbol: String) -> Double? {
        if let n1 = number {
            switch symbol {
            case "+/-":
                return -1 * n1
            case "AC":
                return 0
            case "%":
                return 0.01 * n1
            case "=":
                return performTwoNumCalculation(n2: n1)
            default:
                inteermediateCalculation = (n1: n1, calcMethod: symbol)
            }
        }
        return nil
    }
}
