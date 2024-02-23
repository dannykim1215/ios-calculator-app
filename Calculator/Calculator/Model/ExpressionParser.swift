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
        
        let components = componentByOperators(from: input) // ["1","2","3","4"]
        let operatorSigns = input.compactMap(Operator.init)
        
//        for component in components {
//            if let operandComponent = Double(component) {
//                operands.push(operandComponent)
//                continue
//            }
//            
//            if let operatorComponent = Operator(rawValue: Character(component)) {
//                operators.push(operatorComponent)
//            }
//        }
        
        components.forEach { operands.push($0) }
        operatorSigns.forEach { operators.push($0) }
        
        let result = Formula(operands: operands, operators: operators)
        return result
    }

    private static func componentByOperators(from input: String) -> [String] {
//        return input.split(with: " ")
        var input = [input]
        
        Operator.allCases.forEach { sign in
            input = input.flatMap { $0.split(with: sign.rawValue) }
        }
        
        return input
    }
}
