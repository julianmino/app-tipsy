//
//  ViewController.swift
//  Tipsy
//
//  Created by Julian Mino on 2/16/19.
//  Copyright © 2019 Julian Mino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tipPercentLabel: UILabel!
    @IBOutlet weak var percentSlider: UISlider!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var quantityPeople: UITextField!
    @IBOutlet weak var perPersonLabel: UILabel!
    @IBOutlet weak var peopleLabel: UILabel!
    
    var tip = TipModel(billAmount: 0.0, tipPercent: 0.0, quantity: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTipCalculationValues()
        updateUI()

    }
    
    func setTipCalculationValues() {
        tip.tipPercent = Double(percentSlider.value)
        tip.billAmount = ((textField.text)! as NSString).doubleValue
        if quantityPeople.hasText {
            tip.quantity = ((quantityPeople.text)! as NSString).doubleValue
        } else {
            tip.quantity = 1
        }
        tip.calculateTip()
    }
    
    func updateUI() {
        tipAmountLabel.text = String(format: "$%0.2f", tip.tipAmount)
        totalAmountLabel.text = String(format: "$%0.2f", tip.totalAmount)
        tipPercentLabel.text = "Tip: \(Int(percentSlider.value * 100))%"
        perPersonLabel.text = String(format: "$%0.2f", tip.perPerson)
        peopleLabel.text = "We are: \(quantityPeople.text ?? "1")"
    }

    @IBAction func quantityDidChanged(_ sender: Any) {
        setTipCalculationValues()
        updateUI()
    }
    
    
    @IBAction func billAmountDidChanged(_ sender: Any) {
        setTipCalculationValues()
        updateUI()
    }

    @IBAction func tipPercentDidChanged(_ sender: Any) {
        let steps: Float = 100
        let roundedValue = round(percentSlider.value * steps) / steps
        percentSlider.value = roundedValue
        setTipCalculationValues()
        updateUI()
    }
}

