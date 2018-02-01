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
    var listOfOperations: [String] = []
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
        if(sign == "+") {
            sign = "-"
            currentNumber = sign + currentNumber
            outputLabel.text = currentNumber
        } else {
            sign = "+"
            currentNumber = String(currentNumber.suffix(currentNumber.count - 1))
            outputLabel.text = currentNumber
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

    }
    
    @IBAction func pressMultiply(_ sender: UIButton) {

    }
    
    @IBAction func pressDivide(_ sender: UIButton) {

    }

    @IBAction func pressAdvancedOperation(_ sender: UIButton) {
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

