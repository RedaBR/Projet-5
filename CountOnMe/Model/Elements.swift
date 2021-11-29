//
//  Elements.swift
//  CountOnMe
//
//  Created by Reda on 18/10/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import Foundation
class Elements  {
    
    var operationsToReduce : [String] = []
    
    var elements : [String] = []
    
    func updateElementsChoice(text:String) {
        elements = text.split(separator: " ").map { "\($0)" }
    }
    
    // Error check computed variables
    func expressionIsCorrect() -> Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "X" && elements.last != "/"
    }

    
    func expressionHaveEnoughElement() -> Bool {
        return elements.count >= 3
    }
    
    func canAddOperator() ->Bool {
        return !elements.isEmpty && elements.last != "+" && elements.last != "-" && elements.last != "X" && elements.last != "/"
    }
    
    func canAddZero() ->Bool {
        return elements.last != "/"
    }
    
    func expressionHaveResult()-> Bool {
        return elements.contains("=")
       
    }
    
    func managePriorities () -> [String] {
        var listPrio = elements
        
        while listPrio.contains("X") {
            
            let operandIndex = listPrio.firstIndex(of: "X") // index = 8
            let left = Float(listPrio[operandIndex! - 1])! // index 7 (4)
            let right = Float(listPrio[operandIndex! + 1])! // index 9 (2)
            
            let result = left * right
            
            listPrio.remove(at: operandIndex! - 1)
            listPrio.remove(at: operandIndex! - 1)
            listPrio.remove(at: operandIndex! - 1)
            
            listPrio.insert("\(result)", at: operandIndex! - 1)
        }
        
        while listPrio.contains("/") {
            
            let operandIndex = listPrio.firstIndex(of: "/") // index = 8
            let left = Float(listPrio[operandIndex! - 1])! // index 7 (4)
            let right = Float(listPrio[operandIndex! + 1])! // index 9 (2)
            
            let result = left / right
            
            listPrio.remove(at: operandIndex! - 1)
            listPrio.remove(at: operandIndex! - 1)
            listPrio.remove(at: operandIndex! - 1)
            
            listPrio.insert("\(result)", at: operandIndex! - 1)
        }
        
        
        return listPrio
        
    }
    func calculate ()-> String {
        
        operationsToReduce = managePriorities()
        while operationsToReduce.count > 3 {
           
            let left = Float(operationsToReduce[0])!
            let operand = operationsToReduce[1]
            let right = Float(operationsToReduce[2])!
            
            var result = Float()
            
            if operand  == "+" {
                result = left + right
            }
            else if operand == "-" {
                result = left - right
            }
            
            operationsToReduce = Array(operationsToReduce.dropFirst(3))
            operationsToReduce.insert("\(result)", at: 0)
        }
        
        return operationsToReduce.first!
        
    }
    
}



