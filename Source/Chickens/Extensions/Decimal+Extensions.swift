//
//  Decimal+Extensions.swift
//  Chickens
//
//  Created by Sasha Kid on 11/13/17.
//  Copyright © 2017 Alexander Yakovlev. All rights reserved.
//

import Foundation

extension Decimal {
  /*
  func toCurrency() -> String {
    let currencyFormatter = NumberFormatter()
    currencyFormatter.usesGroupingSeparator = true
    currencyFormatter.numberStyle = .currency
    currencyFormatter.locale = Locale(identifier: "en_US")
    return currencyFormatter.string(from: self as NSDecimalNumber)!
  }
 */
  func toString() -> String? {
    let formatter = NumberFormatter()
    formatter.minimumFractionDigits = 2
    formatter.maximumFractionDigits = 2
    formatter.locale = Locale.current
    guard let string = formatter.string(for: self) else {
      return nil
    }
    return string
  }
}
