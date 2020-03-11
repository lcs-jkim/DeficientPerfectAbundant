//
//  ViewController.swift
//  DeficientPerfectAbundant
//
//  Created by Kim, Jenis on 2020-03-09.
//  Copyright © 2020 Kim, Jenis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Properties
    @IBOutlet weak var errorMessage: UILabel!
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var output: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Clear error message
        errorMessage.text = ""
        output.text = ""
    }
    
    @IBAction func check(_ sender: Any) {
        guard let inputAsString = input.text else {
            return
        }
        guard let numberInput = Int(inputAsString) else {
            errorMessage.text = "Please enter an integer"
            return
        }
        
        guard numberInput > 1, numberInput < 32500 else {
            errorMessage.text = "Enter a number between 1 and 32500"
            return
        }
        
        
        func sumOfAllDivisors(number: Int) -> Int{
            
            var sum = 0
            for m in stride(from: 1, to: Int(sqrt(Double(number))), by: 1){
                
                if number % m == 0 {
                    sum += m
                    sum += number/m
                    
                }
                if number/m == m {
                    sum -= m
             
                }
                
            }
            
            sum -= number
            return sum
            
        }
        output.text = "\(sumOfAllDivisors(number: numberInput))"
        
    }
    
}

