//
//  OutputCell.swift
//  Chickens
//
//  Created by Sasha Kid on 1/15/18.
//  Copyright © 2018 Alexander Yakovlev. All rights reserved.
//

import UIKit

class OutputCell: UITableViewCell {
  @IBOutlet private weak var outputLabel: UILabel!
  @IBOutlet private weak var iconImageView: UIImageView!

  func setup(output: String, icon: UIImage) {
    outputLabel.text = output
    iconImageView.image = icon
  }
}
