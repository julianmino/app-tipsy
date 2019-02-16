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
    
    var tip = TipModel(billAmount: 0.0, tipPercent: 0.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTipCalculationValues()
        updateUI()

    }
    
    func setTipCalculationValues() {
        tip.tipPercent = Double(percentSlider.value)
        tip.billAmount = ((textField.text)! as NSString).doubleValue
        tip.calculateTip()
    }
    
    func updateUI() {
        tipAmountLabel.text = String(format: "$%0.2f", tip.tipAmount)
        totalAmountLabel.text = String(format: "$%0.2f", tip.totalAmount)
        tipPercentLabel.text = "Tip: \(Int(percentSlider.value * 100))%"
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

