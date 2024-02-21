//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var formulaResult: String = ""
    var formulaUserInput: String = "0"
    var calculationOperator: Operator = Operator.add
    
    var isDotted: Bool = false
    
    @IBOutlet weak var formulaLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formulaLabel.text = "\(formulaUserInput)"
        operatorLabel.text = "\(calculationOperator.rawValue)"
    }
    
    @IBAction func operandButtonTapped(_ sender: UIButton) {
        if let number = sender.titleLabel?.text {
            if formulaUserInput == "0" {
                formulaUserInput = number
            } else {
                formulaUserInput += number
            }
            
            formulaLabel.text = "\(formulaUserInput)"
        }
    }
    
    @IBAction func operatorButtonTapped(_ sender: UIButton) {
        if let currentOperator = sender.titleLabel?.text {
            switch currentOperator {
            case "+":
                calculationOperator = .add
            case "−":
                calculationOperator = .subtract
            case "×":
                calculationOperator = .multiply
            case "÷":
                calculationOperator = .divide
            default:
                break
            }
            
            isDotted = false
            
            operatorLabel.text = "\(calculationOperator.rawValue)"
            
            formulaResult += formulaUserInput + " " + currentOperator + " "
            
            formulaUserInput = "0"
            formulaLabel.text = "\(formulaUserInput)"
        }
    }
    
    @IBAction func equalSignButtonTapped(_ sender: UIButton) {
        formulaResult += formulaUserInput
        formulaUserInput = ""
        isDotted = false
        
        formulaLabel.text = "\(formulaResult)"
        
        let parsedExpression = ExpressionParser.parse(from: formulaResult)
    }
    
    
    @IBAction func acButtonTapped(_ sender: UIButton) {
        formulaResult = ""
        formulaUserInput = "0"
        calculationOperator = .add
        isDotted = false
        
        formulaLabel.text = "\(formulaUserInput)"
        operatorLabel.text = "\(calculationOperator.rawValue)"
    }
    
    @IBAction func ceButtonTapped(_ sender: UIButton) {
        if formulaUserInput == "" {
            formulaResult = ""
            formulaUserInput = "0"
            calculationOperator = .add
            
            formulaLabel.text = "\(formulaUserInput)"
            operatorLabel.text = "\(calculationOperator.rawValue)"
        } else {
            formulaLabel.text = "\(formulaResult)"
            formulaUserInput = "0"
        }
        
        isDotted = false
    }
    
    @IBAction func signButtonTapped(_ sender: UIButton) {
        guard let number = Double(formulaUserInput) else {
            return
        }
        
        var changeSignNumber: Double = 0
        
        if number > 0 || number < 0 {
            changeSignNumber = number - (number * 2)
        } else {
            changeSignNumber = 0
        }
        
        if Double(Int(number)) == number {
            formulaUserInput = String(Int(changeSignNumber))
        } else {
            formulaUserInput = String(changeSignNumber)
        }
        
        formulaLabel.text = "\(formulaUserInput)"
    }
    
    @IBAction func dotButtonTapped(_ sender: UIButton) {
        if isDotted {
            return
        } else {
            isDotted = true
            formulaUserInput += "."
            formulaLabel.text = "\(formulaUserInput)"
        }
    }
}
