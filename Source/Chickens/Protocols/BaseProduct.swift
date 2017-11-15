//
//  BaseProduct.swift
//  Chickens
//
//  Created by Alexander Yakovlev on 11/15/17.
//  Copyright © 2017 Alexander Yakovlev. All rights reserved.
//

import Foundation

protocol BaseProduct {
  var price: Decimal {get}
  var type: ProductType {get}
  var icon: String {get}
}
