//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Aman Meena on 28/04/20.
//  Copyright © 2020 Aman Meena. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        billAmountTextField.calculateButtonAction = {
            self.calculate()
        }
    }
    
    
    // MARK:- IBOutlets
    
    // Header
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var themeSwitch: UISwitch!
    @IBOutlet weak var headerView: UIView!
    
    // Tip Input
    @IBOutlet weak var inputCardView: UIView!
    @IBOutlet weak var billAmountTextField: BillAmountTextField!
    @IBOutlet weak var tipPercentSegmentedControl: UISegmentedControl!
    
    // Tip Output
    @IBOutlet weak var outputCardView: UIView!
    @IBOutlet weak var tipAmountTitleLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalAmountTitleLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    // Reset Button
    @IBOutlet weak var resetButton: UIButton!
    
    // MARK:- IBActions
    
    @IBAction func themeToggled(_ sender: UISwitch) {
        if sender.isOn {
            print("switch toggled on")
        } else {
            print("switch toggled off")
        }
    }
    
    @IBAction func tipPercentChanged(_ sender: UISegmentedControl) {
        calculate()
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        print("Reset button tapped!")
        clear()
    }
    
    // MARK:- Methods
    
    func calculate() {
        
        if self.billAmountTextField.isFirstResponder {
            self.billAmountTextField.resignFirstResponder()
        }
        
        // 1
        guard let billAmountText = self.billAmountTextField.text,
            let billAmount = Double(billAmountText) else {
                clear()
                return
        }
        var roundedBillAmount: Double {
            return (100 * billAmount.rounded()) / 100
        }
        
        // 2
        let tipPercent: Double
        switch tipPercentSegmentedControl.selectedSegmentIndex {
        case 0:
            tipPercent = 0.15
        case 1:
            tipPercent = 0.18
        case 2:
            tipPercent = 0.20
        default:
            preconditionFailure("Unexpected index.")
        }
        
        var tipAmount: Double {
            return roundedBillAmount * tipPercent
        }
        var roundedTipAmount: Double {
            return (100 * tipAmount).rounded() / 100
        }
        
        var totalAmount: Double {
            return roundedBillAmount + roundedTipAmount
        }
        
        print("Bill Amount: \(roundedBillAmount)")
        print("Tip Amount: \(roundedTipAmount)")
        print("Total Amount: \(totalAmount)")
        
        
        // Update UI
        self.billAmountTextField.text = String(format: "%.2f", roundedBillAmount)
        self.tipAmountLabel.text = String(format: "₹%0.2f", roundedTipAmount)
        self.totalAmountLabel.text = String(format: "₹%0.02f", totalAmount)
        
    }
    
    func clear() {
        billAmountTextField.text = nil
        tipPercentSegmentedControl.selectedSegmentIndex = 0
        tipAmountLabel.text = String(format: "₹%0.2f", 0.0)
        totalAmountLabel.text = String(format: "₹%0.02f", 0)
    }
}

