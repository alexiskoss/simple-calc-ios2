//
//  ViewController.swift
//  simplecalc-ios
//
//  Created by Alexis Koss on 1/31/18.
//  Copyright © 2018 Alexis Koss. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outputLabel: UILabel!
    var currentNumber: String = ""
    var listOfNumbers: [Double] = []
    var operation: String = ""
    var sign: String = "+"
    var total: Double = 0

    @IBAction func numberPress(_ sender: UIButton) {
        currentNumber += sender.currentTitle!
        outputLabel.text = currentNumber
    }
    
    @IBAction func clearPress(_ sender: UIButton) {
        if(outputLabel.text != "0" && operation == "") {
            outputLabel.text = "0"
            total = 0
            currentNumber = ""
        } else if(outputLabel.text != "0" && operation != "") {
            outputLabel.text = "0"
            currentNumber = ""
        }
    }

    @IBAction func pressAdd(_ sender: UIButton) {
        if(currentNumber != "") {
            listOfNumbers.append(Double(currentNumber)!)
            currentNumber = ""
        }
        operation = "+"
    }
    
    @IBAction func pressSubtract(_ sender: UIButton) {
        if(currentNumber != "") {
            listOfNumbers.append(Double(currentNumber)!)
            currentNumber = ""
        }
        operation = "-"
    }
    
    @IBAction func pressMultiply(_ sender: UIButton) {
        if(currentNumber != "") {
            listOfNumbers.append(Double(currentNumber)!)
            currentNumber = ""
        }
        operation = "*"
    }
    
    @IBAction func pressDivide(_ sender: UIButton) {
        if(currentNumber != "") {
            listOfNumbers.append(Double(currentNumber)!)
            currentNumber = ""
        }
        operation = "/"
    }
    
    @IBAction func pressCount(_ sender: UIButton) {
        if(currentNumber != "") {
            listOfNumbers.append(Double(currentNumber)!)
            currentNumber = ""
        }
        operation = "count"
    }
    
    @IBAction func pressAvg(_ sender: UIButton) {
        if(currentNumber != "") {
            listOfNumbers.append(Double(currentNumber)!)
            currentNumber = ""
        }
        operation = "avg"
    }
    
    @IBAction func pressFact(_ sender: UIButton) {
        //var factorial = Int(currentNumber)
        var factorialTotal: Int = 1
        if(currentNumber != "") {
            if let number = Int(currentNumber) {
                for index in 2...number {
                    factorialTotal *= index
                }
            }
        }
        total = Double(factorialTotal)
        outputLabel.text = String(total)
        currentNumber = ""
        listOfNumbers = []
    }
    
    @IBAction func pressMod(_ sender: UIButton) {
        if(currentNumber != "") {
            listOfNumbers.append(Double(currentNumber)!)
            currentNumber = ""
        }
        operation = "%"
    }
    
    @IBAction func pressEqual(_ sender: UIButton) {
        if(currentNumber != "") {
            listOfNumbers.append(Double(currentNumber)!)
            currentNumber = ""
        }
        
        if(listOfNumbers.count >= 2) {
            switch operation {
            case "+":
                total += listOfNumbers[0] + listOfNumbers[1]
                checkIfDecimalIsZero(total: total)
            case "-":
                total += listOfNumbers[0] - listOfNumbers[1]
                checkIfDecimalIsZero(total: total)
            case "*":
                total += listOfNumbers[0] * listOfNumbers[1]
                checkIfDecimalIsZero(total: total)
            case "/":
                total += listOfNumbers[0] / listOfNumbers[1]
                checkIfDecimalIsZero(total: total)
            case "%":
                total += listOfNumbers[0].truncatingRemainder(dividingBy: listOfNumbers[1])
                checkIfDecimalIsZero(total: total)
            case "count":
                outputLabel.text = String(listOfNumbers.count)
            case "avg":
                var sumTotal: Double = 0
                for number in listOfNumbers {
                    sumTotal += number
                }
                total = sumTotal / Double(listOfNumbers.count)
                checkIfDecimalIsZero(total: total)
            default:
                total = 0
            }
            listOfNumbers = []
            operation = ""
        } else if(total != 0) { //allows you to perform operations on equaled totals
            switch operation {
            case "+":
                total += listOfNumbers[0]
                checkIfDecimalIsZero(total: total)
            case "-":
                total -= listOfNumbers[0]
                checkIfDecimalIsZero(total: total)
            case "*":
                total *= listOfNumbers[0]
                checkIfDecimalIsZero(total: total)
            case "/":
                total /= listOfNumbers[0]
                checkIfDecimalIsZero(total: total)
            default:
                total = 0
            }
            listOfNumbers = []
            operation = ""
        }
    }
    
    func checkIfDecimalIsZero(total: Double) {
        if(String(total).hasSuffix(".0")) {
            let decimal: String.Index = String(total).index(of: ".")!
            outputLabel.text = String(String(total)[..<decimal])
        } else {
            outputLabel.text = String(total)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

