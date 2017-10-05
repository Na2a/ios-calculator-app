//
//  CalculatorModel.swift
//  Calculator
//
//  Created by na2a on 16.04.17.
//  Copyright © 2017 na2a. All rights reserved.
//

import Foundation

struct Calculator {
    private var savedValue: Double?
    private var savedOperation: String?
    var expression: String = "..."
    private var currentValue: Double = 0
    mutating func clear() {
        currentValue = 0
    }
    mutating func setValue(_ value: Double) {
        currentValue = value
    }
    func getValue() -> Double {
        return currentValue
    }
    private func performBinaryOperation(_ x: Double, _ y: Double, _ type: String) -> Double {
        switch type {
        case "＋":
            return x + y
        case "－":
            return x - y
        case "×":
            return x * y
        case "÷":
            return x / y
        default:
            assert(false)
        }
    }
    mutating func performOperation(_ type: String) {
        switch type {
        case "sin":
            currentValue = sin(currentValue)
        case "cos":
            currentValue = cos(currentValue)
        case "π":
            currentValue = Double.pi
        case "＝":
            if let x = savedValue {
                print(x, savedOperation!, currentValue)
                print(performBinaryOperation(x, currentValue, savedOperation!))
                currentValue = performBinaryOperation(x, currentValue, savedOperation!)
                savedValue = nil
            }
        default:
            let temp = currentValue
            if savedValue != nil {
                currentValue = performBinaryOperation(savedValue!, currentValue, savedOperation!)
                savedValue = nil
                savedOperation = nil
            }
            savedValue = temp
            savedOperation = type
        }
    }
}
