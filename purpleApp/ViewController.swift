//
//  ViewController.swift
//  purpleApp
//
//  Created by 黃曉柔 on 2021/3/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func numbers(_ sender: UIButton) {
        let inputNumber = sender.tag - 1
       // if inputNumber.length
        if label.text != nil{
            if label.text == "0"{
                label.text = "\(inputNumber)"
            }else{
                label.text = label.text! + "\(inputNumber)"
            }
        }
    }
    
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

