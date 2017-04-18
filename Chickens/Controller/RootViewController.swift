//
//  RootViewController.swift
//  Chickens
//
//  Created by Alexander Yakovlev on 3/21/17.
//  Copyright © 2017 Alexander Yakovlev. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    @IBOutlet weak var chickenTextfield: UITextField! {
        didSet {
            chickenTextfield.text = "\(0)"
        }
    }
    @IBOutlet weak var sumTextfield: UITextField! {
        didSet {
            sumTextfield.text = ""
            sumTextfield.becomeFirstResponder()
        }
    }
    
    //MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

extension RootViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == sumTextfield {
            let currentString = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? string
            let sum = Double(currentString)
            if let sum = sum {
                chickenTextfield.text = "\(round(10 * sum / PriceService.shared.price) / 10)"
            } else {
                chickenTextfield.text = "\(0)"
            }
            return true
        } else {
            return false
        }
    }
}
