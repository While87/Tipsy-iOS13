//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by Vladimir Gorbunov on 09/09/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    var tip = 0.1
    var split = 2
    var bill = 0.0
    var total = 0.0
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        if sender.titleLabel?.text == "0%"
        {
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tip = 0
        }else if sender.titleLabel?.text == "10%"
        {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            tip = 0.1
        }else
        {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            tip = 0.2
        }
        
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        split = Int(sender.value)
        splitNumberLabel.text = String(split)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        if Double(billTextField.text!) == nil || billTextField.text == "0" {
            
        }
        else{
            bill = Double(billTextField.text!)!
            total = (bill + (bill * tip)) / Double(split)
            self.performSegue(withIdentifier: "resultSegue", sender: self)
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultSegue"
        {
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.totalResult = total
            destinationVC.textResult = "Split between \(split) people, with \(tip * 100)% tip."
        }
    }
    
}

