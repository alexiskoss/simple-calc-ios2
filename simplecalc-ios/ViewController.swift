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
    
    @IBAction func pressed(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func numberPress(_ sender: UIButton) {
        currentNumber += sender.currentTitle!
        outputLabel.text = currentNumber
    }
    
    @IBAction func clearPress(_ sender: UIButton) {
        currentNumber = ""
        outputLabel.text = "0"
    }
}

