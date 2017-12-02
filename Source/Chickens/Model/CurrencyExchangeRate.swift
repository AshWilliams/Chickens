//
//  CurrencyExchangeRate.swift
//  Chickens
//
//  Created by Sasha Kid on 11/10/17.
//  Copyright © 2017 Alexander Yakovlev. All rights reserved.
//

import Foundation
import SwiftyJSON
import Moya_SwiftyJSONMapper

typealias CurrencyPair = (CurrencyType, CurrencyType)?

enum CurrencyType: String {
  case BYN
  case USD
}

struct CurrencyExchangeRate: ALSwiftyJSONAble {
  var value: Decimal = 0.0
  var pair: CurrencyPair = nil
  
  init?(jsonData: JSON) {
    if jsonData["results"] != JSON.null {
      let dictionary = jsonData["results"]
      for (pairString, _) in dictionary {
        if let doubleValue = dictionary[pairString]["val"].double, let pair = CurrencyExchangeRate.pairFrom(pairString) {
          self.pair = pair
          self.value = Decimal(doubleValue)
          break
        }
      }
    }
  }
}

extension CurrencyExchangeRate {
  static func stringFrom(_ pair: (CurrencyType, CurrencyType)) -> String? {
    return "\(pair.0)_\(pair.1)"
  }
  
  static func pairFrom(_ string: String) -> (CurrencyType, CurrencyType)? {
    let strings = string.components(separatedBy: "_")
    guard let type0 = CurrencyType.init(rawValue: strings[0]), let type1 = CurrencyType.init(rawValue: strings[1]) else {
      return nil
    }
    var pair: (CurrencyType, CurrencyType)
    pair.0 = type0
    pair.1 = type1
    return pair
  }
}

