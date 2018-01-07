//
//  ViewController.swift
//  Calculator
//
//  Created by knail1 on 7/7/17.
//  Copyright © 2017 knail1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel?

    var userIsInTheMiddleOfTyping = false
    
    
    @ IBAction func touchDigit(_ sender: UIButton) {
        

    // func drawHorizontalLine(from startX: Double, to endX: Double, using color: UIColor) {}
    //    drawHorizontalLine(from: <#T##Double#>, to: <#T##Double#>, using: <#T##UIColor#>)
    let digit =  sender.currentTitle!
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInLabel = display!.text!
            display!.text = textCurrentlyInLabel + digit
            print("\(digit) touchDigit was called, yo!")
        } else {
            display!.text = digit
            userIsInTheMiddleOfTyping = true
        }
    
    }


    @IBAction func performOperation(_ sender: UIButton) {
            userIsInTheMiddleOfTyping = false
        if let mathematicalSymbol = sender.currentTitle {
            switch mathematicalSymbol {
            case "pi":
                display!.text = \(Double.pi)
            default:
                break
             }
        }
        
        
    }
}
 
