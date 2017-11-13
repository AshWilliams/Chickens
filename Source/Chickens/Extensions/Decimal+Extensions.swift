//
//  Decimal+Extensions.swift
//  Chickens
//
//  Created by Sasha Kid on 11/13/17.
//  Copyright © 2017 Alexander Yakovlev. All rights reserved.
//

import Foundation

extension Decimal {
  func toCurrency() -> String {
    let currencyFormatter = NumberFormatter()
    currencyFormatter.usesGroupingSeparator = true
    currencyFormatter.numberStyle = .currency
    currencyFormatter.locale = Locale(identifier: "en_US")
    return currencyFormatter.string(from: self as NSDecimalNumber)!
  }
}
