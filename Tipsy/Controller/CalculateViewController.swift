//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var billTextField: UITextField!
    
    var tipValue: Float?
    var totalBillValue: Float?
    var stepperValue: Float?
    var splitValue: Float?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        if zeroPctButton.isSelected{
            tipValue = 0.0
        }
        else if tenPctButton.isSelected{
            tipValue = 0.1
        }
        else if twentyPctButton.isSelected{
            tipValue = 0.2
        }
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        totalBillValue = (Float(billTextField.text ?? "0.0") ?? 0.0)*(tipValue ?? 0.0) + (Float(billTextField.text ?? "0.0") ?? 0.0)
        splitValue = (totalBillValue ?? 0.0)/(stepperValue ?? 1.0)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    @IBAction func stepperPressed(_ sender: UIStepper) {
        //sender.value += sender.stepValue
        splitNumberLabel.text = String(Int(sender.value))
        stepperValue = Float(sender.value)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.perPersonSplit = splitValue
            destinationVC.splitDetails = "Split between \(Int(stepperValue ?? 0.0)) people, with \(Int((tipValue ?? 0.0)*100))% tip."
        }
    }
}


