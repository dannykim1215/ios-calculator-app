//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Danny on 2/20/24.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operands = CalculatorItemQueue<Double>()
        var operators = CalculatorItemQueue<Operator>()
        
        let componentByOperatorsArray = componentByOperators(from: input)
        
        for component in componentByOperatorsArray {
            if let DoubleValueOfOperands = Double(component) {
                operands.push(DoubleValueOfOperands)
                continue
            } else {
                if let OperatorValueOfOperator = Operator(rawValue: Character(component)) {
                    operators.push(OperatorValueOfOperator)
                }
            }
            
//            if let OperatorValueOfOperator = Operator(rawValue: Character(component)) {
//                operators.push(OperatorValueOfOperator)
//            }
        }
        
        let resultOfParse = Formula(operands: operands, operators: operators)
        return resultOfParse
    }

    private static func componentByOperators(from input: String) -> [String] {
//        return input.split(with: " ")
        var components: [String] = []
        var tempOperand: String = ""
        
        for char in input {
            let str = String(char)
            if str == "+" || str == "−" || str == "÷" || str == "×" {
                components.append(tempOperand)
                components.append(str)
                tempOperand = ""
            } else {
                tempOperand.append(str)
            }
        }
        
        if tempOperand != "" {
            components.append(tempOperand)
        }
        
        return components
    }
}
