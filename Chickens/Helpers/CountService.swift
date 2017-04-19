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
    
    func chickensFrom(sum: Double) -> String {
        if sum > 0 {
            let sum = Money(sum)
            return "\(sum.dividing(by: PriceService.shared.price).decimal)"
        } else {
            return "\(0)"
        }
    }
}
