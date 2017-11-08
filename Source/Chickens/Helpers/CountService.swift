//
//  CountService.swift
//  Chickens
//
//  Created by Alexander Yakovlev on 4/19/17.
//  Copyright © 2017 Alexander Yakovlev. All rights reserved.
//

import Foundation
import Money

final class CountService {
    
    static let shared: CountService = CountService()
    
    func chickensFrom(sum: Double?) -> String {
        if let sum = sum, sum > 0 {
            return String(format: "%.2f", sum / PriceService.shared.price.floatValue)
        } else {
            return "\(0)"
        }
    }
    
    func currencyExchangeFrom(sum: Double?) -> String {
        if let sum = sum, sum > 0 {
            let sum = Money(floatLiteral: sum)
            return "\(sum * (CurrencyExchangeService.shared.rate?.value)!)"
        } else {
            return "\(0)"
        }
    }
}
