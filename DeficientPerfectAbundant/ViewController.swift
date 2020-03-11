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
            output.text = ""
            errorMessage.text = "Please enter an integer"
            return
        }
        
        guard numberInput >= 1, numberInput < 32500 else {
            output.text = ""
            errorMessage.text = "Enter a number between 1 and 32500"
            return
        }
        
        
        func sumOfAllDivisors(number: Int) -> Int{
            
            var sum = 0
            for m in stride(from: 1, to: Int(sqrt(Double(number))) + 1, by: 1){
                
                if number % m == 0 {
                    sum += m
                    sum += number/m
                    
                }
                if number / m == m && number % m == 0 {
                    sum -= m
                    
                }
                
            }
            
            sum -= number
            return sum
            
        }
        
        errorMessage.text = ""
        
        if numberInput == 1 {
            output.text = "\(numberInput) is a deficient number."
        }
        else if sumOfAllDivisors(number: numberInput) > numberInput {
            output.text = "\(numberInput) is an abundant number."
        } else if sumOfAllDivisors(number: numberInput) == numberInput {
            output.text = "\(numberInput) is a perfect number."
        } else if sumOfAllDivisors(number: numberInput) < numberInput {
            output.text = "\(numberInput) is a deficient number."
        }
    }
    
}

