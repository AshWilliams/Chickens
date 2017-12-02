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

class Chicken: BaseProduct {
  var price: Decimal = 0.0
  var type = ProductType.chicken
  var icon: String = ""
}

