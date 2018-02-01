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
    //var listOfOperations: [String] = []
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
    
    @IBAction func changeSign(_ sender: UIButton) {
       /* if(currentNumber == "" && total == 0) {
            outputLabel.text = "0"
        } else if(sign == "+") {
            sign = "-"
            if(total != 0) {
                total = -total
                outputLabel.text = String(total)
            } else {
                currentNumber = sign + currentNumber
                outputLabel.text = currentNumber
            }
        } else if(sign == "-"){
            sign = "+"
            if(total != 0) {
                total = abs(total)
                outputLabel.text = String(total)
            } else {
                currentNumber = String(currentNumber.suffix(currentNumber.count - 1))
                outputLabel.text = currentNumber
            }
        }*/
        
        if(sign == "+") {
            sign = "-"
            currentNumber = "-" + currentNumber
            outputLabel.text = currentNumber
        } else if (sign == "-") {
            sign = "+"
            if(currentNumber != "") {
                currentNumber = String(currentNumber.suffix(currentNumber.count - 1))
                outputLabel.text = currentNumber
           // let output = outputLabel.text?.index((outputLabel.text?.startIndex)!, offsetBy: (outputLabel.text?.count)!);
                outputLabel.text = currentNumber
            }
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

    /*@IBAction func pressAdvancedOperation(_ sender: UIButton) {
        let advancedOperation: String = sender.currentTitle!
        var operationCount: Int = 0
        switch advancedOperation {
        case "count":
            operationCount += operationCount
            
        /*case "avg":
        case "fact":
        case "mod":*/
        case "default":
            total = 0
        }
    }*/
    @IBAction func pressCount(_ sender: UIButton) {
        if(currentNumber != "") {
            listOfNumbers.append(Double(currentNumber)!)
            currentNumber = ""
        }
        operation = "count"
    }
    
    @IBAction func pressAvg(_ sender: UIButton) {
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
        
        if(listOfNumbers.count == 2) {
            switch operation {
            case "+":
                total += listOfNumbers[0] + listOfNumbers[1]
                outputLabel.text = String(total)
            case "-":
                total += listOfNumbers[0] - listOfNumbers[1]
                outputLabel.text = String(total)
            case "*":
                total += listOfNumbers[0] * listOfNumbers[1]
                outputLabel.text = String(total)
            case "/":
                total += listOfNumbers[0] / listOfNumbers[1]
                outputLabel.text = String(total)
            case "%":
                total += listOfNumbers[0].truncatingRemainder(dividingBy: listOfNumbers[1])
                outputLabel.text = String(total)
            default:
                total = 0
            }
            listOfNumbers = []
            operation = ""
        } else if(total != 0) {
            switch operation {
            case "+":
                total += listOfNumbers[0]
                outputLabel.text = String(total)
            case "-":
                total -= listOfNumbers[0]
                outputLabel.text = String(total)
            case "*":
                total *= listOfNumbers[0]
                outputLabel.text = String(total)
            case "/":
                total /= listOfNumbers[0]
                outputLabel.text = String(total)
            default:
                total = 0
            }
            listOfNumbers = []
            operation = ""
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

