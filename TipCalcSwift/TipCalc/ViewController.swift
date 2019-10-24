//
//  ViewController.swift
//  TipCalc
//
//  Created by Jacob Dangler on 10/8/19.
//  Copyright © 2019 Jacob Dangler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //People
    @IBOutlet weak var amountofPeople: UILabel!
    @IBAction func peopleSlider(_ sender: UISlider) {
        amountofPeople.text = String(Int(sender.value))
        people = Int(sender.value)
        tipCalculate()
    }
    
    //Initial Amount
    //@IBOutlet weak var beforeTaxField: UITextField!
    @IBOutlet weak var beforeTaxLabel: UITextField!
    @IBAction func beforeTaxFieldChanged(_ textField: UITextField) {
        beforeTaxLabel.text = textField.text
        tipCalculate()
    }
    
    //Tax
    @IBOutlet weak var taxLabel: UILabel!
    @IBAction func taxSlider(_ sender: UISlider) {
        taxLabel.text = String(Double(round(sender.value*100))/100)
        tax = Float(sender.value)
        tipCalculate()
    }
    
    //Tip
    @IBOutlet weak var tipLabel: UILabel!
    @IBAction func tipSlider(_ sender: UISlider) {
        tipLabel.text = String(Double(round(sender.value*100))/100)
        tipPercent = Float(sender.value)
        tipCalculate()
    }
    var tax = Float()
    var people = Int()
    var tipPercent = Float()
    var tipAmount = Float()
    var perPerson = Float()
    var total = Float()
    var billAmount = Float()
    
    func tipCalculate() {
        if var billAmount = Float(beforeTaxLabel.text!) {
            billAmount = billAmount + (billAmount * (tax/100))
            print(tax)
            tipAmount = billAmount * (tipPercent/100)
            print(tipPercent/100)
            total = tipAmount + billAmount
            print(billAmount)
            perPerson = total/Float(people)
            updateDividedTotal()
            updateTotalBill()
            //amountperPerson.text! = String(perPerson)
        }
    }
    
    //UI
    override func viewDidLoad() {
        super.viewDidLoad()
        //beforeTaxField.becomeFirstResponder()
    }
    
    func updateUI() {
        updateTotalBill()
    }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        tipCalculate()
    }
    
    @IBOutlet weak var totalBillLabel: UILabel!
    func updateTotalBill() {
        totalBillLabel.text! = String(total)
    }
    
    @IBOutlet weak var amountperPerson: UILabel!
    func updateDividedTotal() {
        amountperPerson.text! = String(perPerson)
    }
}
