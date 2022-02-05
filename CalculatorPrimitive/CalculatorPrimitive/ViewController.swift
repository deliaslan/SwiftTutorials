//
//  ViewController.swift
//  CalculatorPrimitive
//
//  Created by Adem Deliaslan on 5.02.2022.
//

import UIKit

class ViewController: UIViewController {
    //bu değişkeni her yerde kullandığımızdan burada tanımladık
    var result = 0
    
    @IBOutlet weak var inputNum1: UITextField!
    @IBOutlet weak var inputNum2: UITextField!
    @IBOutlet weak var labelResult: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func btnSum(_ sender: Any) {
        if let firstNum = Int(inputNum1.text!) {
            if let secondNum = Int(inputNum2.text!) {
                result = firstNum + secondNum
            }
        }
        labelResult.text = String(result)
        
    }
    
    @IBAction func btnMinus(_ sender: Any) {
        if let firstNum = Int(inputNum1.text!) {
            if let secondNum = Int(inputNum2.text!) {
                result = firstNum - secondNum
            }
        }
        labelResult.text = String(result)
    }
    
    @IBAction func btnMultiply(_ sender: Any) {
        if let firstNum = Int(inputNum1.text!) {
            if let secondNum = Int(inputNum2.text!) {
                result = firstNum * secondNum
            }
        }
        labelResult.text = String(result)
    }
    
    @IBAction func btnDivide(_ sender: Any) {
        if let firstNum = Int(inputNum1.text!) {
            if let secondNum = Int(inputNum2.text!) {
                result = firstNum / secondNum
            }
        }
        labelResult.text = String(result)
    }
}

