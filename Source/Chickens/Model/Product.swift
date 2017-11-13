//
//  Product.swift
//  Chickens
//
//  Created by Sasha Kid on 11/12/17.
//  Copyright © 2017 Alexander Yakovlev. All rights reserved.
//

import Foundation

enum ProductType {
  case chicken
  case apple
}

protocol Product {
  var price: Decimal {get}
  var type: ProductType {get}
  var icon: String {get}
}

class Chicken: Product {
  var price: Decimal = 0.0
  var type = ProductType.chicken
  var icon = ""
}

