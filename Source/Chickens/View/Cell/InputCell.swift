//
//  InputCell.swift
//  Chickens
//
//  Created by Sasha Kid on 1/15/18.
//  Copyright © 2018 Alexander Yakovlev. All rights reserved.
//

import UIKit

class InputCell: UITableViewCell {
  @IBOutlet fileprivate weak var inputTextfield: UITextField! {
    didSet {
      inputTextfield.text = ""
      inputTextfield.becomeFirstResponder()
    }
  }
  @IBOutlet private weak var descriptionLabel: UILabel!
  
  func setup(input: String, description: String) {
    inputTextfield.text = input
    descriptionLabel.text = description
  }
}
