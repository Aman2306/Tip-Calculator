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
        // Do any additional setup after loading the view.
    }

    // MARK:- IBOutlets
    
    // Header
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var themeSwitch: UISwitch!
    @IBOutlet weak var headerView: UIView!
    
    // Tip Input
    @IBOutlet weak var inputCardView: UIView!
    @IBOutlet weak var billAmountTextField: UITextField!
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
        print(sender.selectedSegmentIndex)
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        print("Reset button tapped!")
    }
    
    
}

