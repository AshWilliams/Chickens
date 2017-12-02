//
//  RootViewModel.swift
//  Chickens
//
//  Created by Sasha Kid on 11/12/17.
//  Copyright © 2017 Alexander Yakovlev. All rights reserved.
//

import Foundation

struct MainViewModel: BaseViewModel {
  private var rate: CurrencyExchangeRate
  private var product: BaseProduct
  
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
  
  init(rate: CurrencyExchangeRate, product: BaseProduct) {
    self.rate = rate
    self.product = product
  }
}
