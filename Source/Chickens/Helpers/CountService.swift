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
            let sum = Money(sum)
            return "\(sum.dividing(by: PriceService.shared.price).decimal)"
        } else {
            return "\(0)"
        }
    }
    
    func currencyExchangeFrom(sum: Double?) -> String {
        if let sum = sum, sum > 0 {
            let sum = Money(sum)
            return "\(sum.multiplying(by: (CurrencyExchangeService.shared.rate?.value)!).decimal)"
        } else {
            return "\(0)"
        }
    }
}
