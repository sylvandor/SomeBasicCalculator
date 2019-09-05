//
//  ViewController.swift
//  SomeBasicCalculator
//
//  Created by Scott Johnson on 5/12/19.
//  Copyright © 2019 Scott Johnson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var currentNumLabel: UILabel!
    @IBOutlet weak var functionLabel: UILabel!
    @IBOutlet weak var finalNumLabel: UILabel!
    
    var finalNum = 0
    var currentNum = 0
    var currentFunction = Function.ADDITION
    
    @IBAction func numButtonClicked(_ sender: UIButton) {
        if sender.tag >= 0 && sender.tag <= 9 {
            currentNum = Int("\(currentNum)" + "\(sender.tag)")!
            updateUi()
        }
    }
    
    @IBAction func functionButtonClicked(_ sender: UIButton) {
        switch sender.tag {
            case Function.ADDITION.rawValue:
                currentFunction = Function.ADDITION
            case Function.SUBTRACTION.rawValue:
                currentFunction = Function.SUBTRACTION
            case Function.MULTIPLICATION.rawValue:
                currentFunction = Function.MULTIPLICATION
            case Function.DIVISION.rawValue:
                currentFunction = Function.DIVISION
            default:
                break
        }
        updateUi()
    }
    
    @IBAction func doTheMath(_ sender: UIButton) {
        switch currentFunction {
            case .ADDITION:
                finalNum = finalNum + currentNum
            case .SUBTRACTION:
                finalNum = finalNum - currentNum
            case .MULTIPLICATION:
                finalNum  = finalNum * currentNum
            case .DIVISION:
                finalNum = finalNum / currentNum
        }
        updateUi()
    }
    
    @IBAction func clearCurrentNum(_ sender: UIButton) {
        if currentNum != 0 {
            currentNum = 0
        } else {
            finalNum = 0
        }
        
        updateUi()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func updateUi() {
        finalNumLabel.text = "\(finalNum)"
        currentNumLabel.text = "\(currentNum)"
        functionLabel.text = currentFunction.description
    }
    
    enum Function: Int, CustomStringConvertible{
        case ADDITION = 0,
        SUBTRACTION = 1,
        MULTIPLICATION = 2,
        DIVISION = 3
        
        var description: String {
            switch self {
            case .ADDITION:
                return "+"
            case .SUBTRACTION:
                return "-"
            case .MULTIPLICATION:
                return "x"
            case .DIVISION:
                return "/"
            }
        }
    }
}
