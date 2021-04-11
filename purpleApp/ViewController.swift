//
//  ViewController.swift
//  purpleApp
//
//  Created by 黃曉柔 on 2021/3/25.
//

import UIKit

enum OperationType{
    case add
    case minus
    case multiply
    case divide
    case remind
    case none
}

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0 //螢幕顯示0
    var previousNumber:Double = 0
    var performingMath:Bool = false
    var operation: OperationType = .none
    var newStart = true//重啟新運算
    
    
    @IBOutlet weak var label: UILabel!
   
    
    //Numbers
    @IBAction func numbers(_ sender: UIButton) {
        guard ((label.text?.count ?? 0) < 4)
        else{
            return
        }
        
        let inputNumber = sender.tag - 1
        
        if label.text != nil{
            if label.text == "0"{
                label.text = "\(inputNumber)"
            }else{
                if label.text == "0" || label.text == "+" || label.text == "-" || label.text == "x" || label.text == "/" || label.text == "%"{
                    label.text = "\(inputNumber)"} else {
                label.text = label.text! + "\(inputNumber)"
                }
            }
            numberOnScreen = Double(label.text!) ?? 0
        }
    }
    
    @IBAction func dot(_ sender: UIButton) {
        if (label.text != nil) {
            if (newStart == true) {
                label.text = "0."
                newStart = false
            } else {
                label.text = label.text! + "."
            }
        }
    }
    
    @IBAction func add(_ sender: UIButton) {
        label.text = "+"
        operation = .add
        performingMath = true
        previousNumber = numberOnScreen
        newStart = false
    }
    
    @IBAction func minus(_ sender: UIButton) {
        label.text = "-"
        operation = .minus
        performingMath = true
        previousNumber = numberOnScreen
        newStart = false
    }
    
    @IBAction func multiply(_ sender: UIButton) {
        label.text = "x"
        operation = .multiply
        performingMath = true
        previousNumber = numberOnScreen
        newStart = false
    }
    
    
    @IBAction func divide(_ sender: UIButton) {
        label.text = "/"
        operation = .divide
        performingMath = true
        previousNumber = numberOnScreen
        newStart = false
    }
    
    @IBAction func remind(_ sender: UIButton) {
        label.text = "%"
        operation = .remind
        performingMath = true
        previousNumber = numberOnScreen
        newStart = false
    }
    
   
    
    @IBAction func gimmeAnswer(_ sender: UIButton) {
        if (performingMath == true) {
            switch operation {
                case .add:
                    numberOnScreen = previousNumber + numberOnScreen
                    okNumberString(number: numberOnScreen)
                case .minus:
                    numberOnScreen = previousNumber - numberOnScreen
                    okNumberString(number: numberOnScreen)
                case .multiply:
                    numberOnScreen = previousNumber * numberOnScreen
                    okNumberString(number: numberOnScreen)
                case .divide:
                    numberOnScreen = previousNumber / numberOnScreen
                    okNumberString(number: numberOnScreen)
                case .remind:
                    numberOnScreen = previousNumber - (previousNumber/numberOnScreen) * numberOnScreen
                    okNumberString(number: numberOnScreen)
                case .none:
                    label.text = ""
            }
            performingMath = false
            newStart = true
        }
    }
    
    //運算結果檢查
    func okNumberString (number:Double) {
        var okText:String
        
        if (floor(number) == number) {
            okText = "\(Int(number))"
        } else {
            okText = "\(number)"
        }
        if okText.count >= 9 {
            okText = String(okText.prefix(9))
        }
        label.text = okText
    }
    
    
    
    @IBAction func allClear(_ sender: UIButton) {
        label.text = "0"
        numberOnScreen = 0
        previousNumber = 0
        performingMath = false
        operation = .none
        newStart = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

