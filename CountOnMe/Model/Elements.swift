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
    
    func elementsChoice (text:String) -> [String]{
        return text.split(separator: " ").map { "\($0)" }
    }
    
    func updateElementsChoice(text:String) {
        elements = text.split(separator: " ").map { "\($0)" }
    }
    
    // Error check computed variables
    func expressionIsCorrect() -> Bool {
        return elements.last != "+" && elements.last != "-"
    }
    
    func mulitiplication() -> Bool {
        return elements.last != "+" && elements.last != "-"
        
    }
    
    func expressionHaveEnoughElement() -> Bool {
        return elements.count >= 3
    }
    
    func canAddOperator() ->Bool {
        return elements.last != "+" && elements.last != "-"
    }
    
    func expressionHaveResult()-> Bool {
        return elements.contains("=")
       
    }
    
    func calculate ()-> String {
        operationsToReduce = elements
        
    while operationsToReduce.count > 3 {
        let left = Int(operationsToReduce[0])!
        let operand = operationsToReduce[1]
        let right = Int(operationsToReduce[2])!
        
        var result = Int()
        if operand == "X" {
            result = left*right
                  }
        if operand  == "+" {
            result = left + right
        } else if operand == "-" {
            result = left - right
        }
        if operand == "/" {
            result = left / right
        }
        
        operationsToReduce = Array(operationsToReduce.dropFirst(3))
        operationsToReduce.insert("\(result)", at: 0)
    }
        
       
        return operationsToReduce.first!
        
    }
    
}



