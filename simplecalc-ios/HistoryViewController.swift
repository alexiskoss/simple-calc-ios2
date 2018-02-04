//
//  historyViewController.swift
//  simplecalc-ios
//
//  Created by Alexis Koss on 2/3/18.
//  Copyright © 2018 Alexis Koss. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
    

    @IBOutlet weak var historyScrollView: UIScrollView!
    var history: [String] = []
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let mainView = segue.destination as! ViewController
        mainView.history = history
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyScrollView.contentSize = CGSize(width: 600, height: 1500)
        var calculationSpacing = 0
        for calculation in history {
            let calculationLabel = UILabel(frame: CGRect(x: 0, y: calculationSpacing, width: 600, height: 50))
            calculationLabel.text = calculation
            calculationLabel.textColor = UIColor.white
            calculationSpacing = calculationSpacing + 50
            historyScrollView.addSubview(calculationLabel)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
