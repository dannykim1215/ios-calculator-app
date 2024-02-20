//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    var formulaResult: String = ""
    var formulaUserInput: String = ""
    var calculationOperator: Operator = Operator.add
    
    @IBOutlet weak var formulaLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        operatorLabel.text = "\(formulaResult)"
    }
}
