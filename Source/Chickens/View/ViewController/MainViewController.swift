//
//  MainViewController.swift
//  Chickens
//
//  Created by Alexander Yakovlev on 3/21/17.
//  Copyright © 2017 Alexander Yakovlev. All rights reserved.
//

import UIKit
import ChameleonFramework

class MainViewController: UIViewController, BaseViewController {
  var viewModel: MainViewModel?
  
  @IBOutlet weak var sumTextfield: UITextField! {
    didSet {
      sumTextfield.text = ""
      sumTextfield.becomeFirstResponder()
    }
  }
  
  @IBOutlet weak var exchangeTextfield: UITextField! {
    didSet {
      exchangeTextfield.text = "\(0)"
    }
  }
  
  @IBOutlet weak var chickenTextfield: UITextField! {
    didSet {
      chickenTextfield.text = "\(0)"
    }
  }
  //MARK: UIViewController
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.hidesBackButton = true
    title = "Chickens"
  }
  
  //MARK: BaseViewController
  
  func handle(error: AppError) {
    switch error.type {
    case .noInternet:
      print("")
    default:
      print("")
    }
  }
}

extension MainViewController: UITextFieldDelegate {
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    if textField == sumTextfield {
      let currentString = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? string
      viewModel?.sum = currentString
      chickenTextfield.text = viewModel?.kg
      exchangeTextfield.text = viewModel?.currency
      return true
    } else {
      return false
    }
  }
}
