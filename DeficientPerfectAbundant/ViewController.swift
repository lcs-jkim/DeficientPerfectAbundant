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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Clear errormessage
        errorMessage.text = ""
    }
    
    @IBAction func check(_ sender: Any) {
        guard let numberInput = Int(input.text!) else {
            errorMessage.text = "Please enter an integer"
            return
        }
        
        guard numberInput > 1, numberInput < 32500 else {
            errorMessage.text = "Enter a number between 1 and 32500"
            return
        }
    }
    
}

