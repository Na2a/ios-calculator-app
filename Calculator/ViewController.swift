//
//  ViewController.swift
//  Calculator
//
//  Created by na2a on 16.04.17.
//  Copyright © 2017 na2a. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    
    var brain = Calculator()
    
    var isTyping = false
    var afterFloatingPoint = false
    
    override func viewDidLoad() {
        display.text = "0.0"
        super.viewDidLoad()
    }
    
    @IBAction func clear(_ sender: Any) {
        isTyping = false
        display.text = "0.0"
        afterFloatingPoint = false
        brain.clear()
    }
    
    @IBAction func touchDigit(_ sender: UIButton) {
        if (isTyping) {
            display.text = display.text! + sender.currentTitle!
        } else {
            isTyping = true
            display.text = sender.currentTitle
        }
    }
    
    @IBAction func touchDot(_ sender: Any) {
        if (!isTyping) {
            display.text = "0."
            isTyping = true
            afterFloatingPoint = true
        } else if (!afterFloatingPoint) {
            display.text = display.text! + "."
            afterFloatingPoint = true
        }
    }
    
    @IBAction func touchOperation(_ sender: UIButton) {
        brain.setValue(Double(display.text!)!)
        brain.performOperation(sender.currentTitle!)
        display.text = String(brain.getValue())
        isTyping = false
        afterFloatingPoint = false
    }
}

