//
//  RootViewModel.swift
//  Chickens
//
//  Created by Sasha Kid on 11/12/17.
//  Copyright © 2017 Alexander Yakovlev. All rights reserved.
//

import UIKit

struct MainViewModel: BaseViewModel {
  //BaseViewModel
  var cellCount: Int
  
  func cellInstance(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.row {
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: "InputCell", for: indexPath) as! InputCell
      cell.setup(input: sum, description: "BYN")
      return cell

    case 1:
      let cell = tableView.dequeueReusableCell(withIdentifier: "OutputCell", for: indexPath) as! OutputCell
      cell.setup(output: kg, icon: UIImage())
      return cell

    case 2:
      let cell = tableView.dequeueReusableCell(withIdentifier: "OutputCell", for: indexPath) as! OutputCell
      cell.setup(output: currency, icon: UIImage())
      return cell
    default:
      return UITableViewCell()
    }
  }
  
  //Private
  private var rate: CurrencyExchangeRate
  private var product: BaseProduct
  
  //Public
  var sum: String = ""
  var icon: String {
    return self.product.icon
  }
  var kg: String {
    var result = "0.00"
    if product.price != 0 {
      guard let input = Decimal(string: sum) else {
        return result
      }
      guard let kg = (input / product.price).toString() else {
        return result
      }
      result = kg
    }
    return result
  }
  var currency: String {
    guard let input = Decimal(string: sum) else {
      return "0.00"
    }
    guard let result = (input * rate.value).toString() else {
      return "0.00"
    }
    return result
  }
  
  init?(rate: CurrencyExchangeRate, product: BaseProduct, cellCount: Int = 3) {
    self.rate = rate
    self.product = product
    self.cellCount = cellCount
  }
}
