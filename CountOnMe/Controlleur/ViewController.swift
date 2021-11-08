//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
var objects = Elements()
    
    
    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
        }
        
        //objects.elements = ["1", "+", "2"]
        //let result = objects.calculate()
        
        //objects.elements  = objects.elementsChoice(text:textView.text)
        
        if objects.expressionHaveResult() {
            textView.text = ""
        }
        
        textView.text.append(numberText)
        
        objects.updateElementsChoice(text:textView.text)
    }
    
    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        if objects.canAddOperator() {
            textView.text.append(" + ")
        } else {
           alert()
        }
    }
    
    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        if objects.canAddOperator() {
            textView.text.append(" - ")
        } else {
        alert()
        }
    }
    
    @IBAction func tappedDivisionButton(_ sender: UIButton) {
        if objects.canAddOperator() {
            textView.text.append(" / ")
        } else { alert()
            
        }
    }
    
   
    
    
    @IBAction func tappedMultiplicationButton(_ sender: UIButton) {
        if objects.canAddOperator() {
            textView.text.append(" X ")
        } else {
          alert()
        }
    }
    
    @IBAction func tappedDivision(_ sender: UIButton) {
        
            if objects.canAddOperator() {
                textView.text.append(" / ")
            } else { alert()
                
            }
        
    }
    
    

    @IBAction func tappedEqualButton(_ sender: UIButton) {
        if objects.canAddOperator() {
            textView.text.append(" = ")
        }else {
          alert()
            return
        }
        
        objects.updateElementsChoice(text:textView.text)
        let ope = objects.expressionHaveResult()
        guard ope else {
            let alertVC = UIAlertController(title: "Zéro!", message: "Entrez une expression correcte !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return self.present(alertVC, animated: true, completion: nil)
        }
        let oper = objects.expressionHaveEnoughElement()
        guard oper else {
            let alertVC = UIAlertController(title: "Zéro!", message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return self.present(alertVC, animated: true, completion: nil)
        }

        let result = objects.calculate()
        textView.text = result
    }
    
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
     
    func alert () {
        let alertVC = UIAlertController(title: "Zéro!", message: "Un operateur est déja mis !", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    

}

