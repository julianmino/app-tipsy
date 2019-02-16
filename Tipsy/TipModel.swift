//
//  TipModel.swift
//  Tipsy
//
//  Created by Julian Mino on 2/16/19.
//  Copyright © 2019 Julian Mino. All rights reserved.
//

import Foundation

class TipModel {
    private var _billAmount: Double = 0
    private var _tipPercent: Double = 0
    private var _tipAmount: Double = 0
    private var _totalAmount: Double = 0
    private var _perPerson: Double = 0
    private var _quantity: Double = 0
    
    var billAmount: Double {
        get {
            return _billAmount
        }
        set {
            _billAmount = newValue
        }
    }
    
    var tipPercent: Double {
        get {
            return _tipAmount
        }
        set {
            _tipAmount = newValue
        }
    }
    
    var tipAmount: Double {
            
            return _tipAmount
        
    }
    
    var totalAmount: Double {
        
            return _totalAmount
        
    }
    
    var perPerson: Double {
        
        return _perPerson
    }
    
    var quantity: Double {
        
        get {
        return _quantity
        } set {
            _quantity = newValue
        }
    }
    

    init(billAmount: Double, tipPercent: Double, quantity: Double) {
        self._billAmount = billAmount
        self._tipPercent = tipPercent
        self._quantity = quantity
    }
    
    
    func calculateTip () {
        _tipAmount = billAmount * tipPercent
        _totalAmount = billAmount + tipAmount
        _perPerson = totalAmount / quantity 
    }
    
}
