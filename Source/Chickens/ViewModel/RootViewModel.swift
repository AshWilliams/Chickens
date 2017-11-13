//
//  RootViewModel.swift
//  Chickens
//
//  Created by Sasha Kid on 11/12/17.
//  Copyright © 2017 Alexander Yakovlev. All rights reserved.
//

import Foundation

protocol ViewModel {
  
}

struct RootViewModel: ViewModel {
  private var rate: CurrencyExchangeRate
  private var product: Product

  var sum: String = ""
  var icon: String {
    return self.product.icon
  }
  var kg: String {
    return String(format: "%.2f", (Decimal(string: self.sum)! / self.product.price) as CVarArg)
  }
  var currency: String {
    return String(format: "%.2f", (Decimal(string: self.sum)! / self.rate.value) as CVarArg)
  }
  
  init(rate: CurrencyExchangeRate, product: Product) {
    self.rate = rate
    self.product = product.icon as! Product
  }
}
