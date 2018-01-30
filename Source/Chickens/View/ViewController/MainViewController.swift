//
//  MainViewController.swift
//  Chickens
//
//  Created by Alexander Yakovlev on 3/21/17.
//  Copyright © 2017 Alexander Yakovlev. All rights reserved.
//

import UIKit
import ChameleonFramework

class MainViewController: UIViewController {
  fileprivate var viewModel: MainViewModel?
  @IBOutlet fileprivate weak var tableView: UITableView!

  //MARK: UIViewController
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    assertDependencies()
    
    navigationItem.hidesBackButton = true
    title = "Chickens"
  }
}

extension MainViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.row == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "InputCell", for: indexPath) as! InputCell
      cell.setup(input: "123", description: "321")
      return cell
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: "OutputCell", for: indexPath) as! OutputCell
      cell.setup(output: "qwerty", icon: UIImage())
      return cell
    }
  }
}

//extension MainViewController: UITextFieldDelegate {
//  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//    if textField == sumTextfield {
//      let currentString = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? string
//      viewModel?.sum = currentString
//      chickenTextfield.text = viewModel?.kg
//      exchangeTextfield.text = viewModel?.currency
//      return true
//    } else {
//      return false
//    }
//  }
//}

extension MainViewController: BaseViewController {
  typealias T = MainViewModel
  
  func inject(viewModel: T) {
    self.viewModel = viewModel
  }
  
  func assertDependencies() {
    assert(viewModel != nil)
  }
  
  func handle(error: AppError) {
    switch error.type {
    case .noInternet:
      print("")
    default:
      print("")
    }
  }
}

