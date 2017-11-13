//
//  PriceService.swift
//  Chickens
//
//  Created by Aleksey Gorbachevskiy on 21/03/17.
//  Copyright © 2017 Alexander Yakovlev. All rights reserved.
//

class PriceService {
  
  //Private
  
  //Public
  
  static let shared: PriceService = PriceService()
  
  func getPrice<T: Product>(for product: T, completion: (Decimal, Error?) -> ()) {
    if let url = getURL(for: product.type), let data = NSData.init(contentsOf: url) {
      let doc = TFHpple(htmlData: data as Data!)
      if let elements = doc?.search(withXPathQuery: "//div[@class='right']/div[@class='services_wrap']/div[@class='prices_block']/div[@class='price_byn']/div[@class='price']") as? [TFHppleElement] {
        for element in elements {
          let components = element.content.components(separatedBy:".")
          var stringPrice = ""
          for (i, component) in components.enumerated() {
            if let newComponent = Int(component.components(separatedBy: CharacterSet.decimalDigits.inverted).joined(separator: "")) {
              if !component.isEmpty {
                switch i {
                case 0:
                  stringPrice.append("\(newComponent).")
                case 1:
                  stringPrice.append("\(newComponent)")
                default:
                  break
                }
              }
            }
          }
          completion(Decimal(string: stringPrice)!, nil)
          print("[PriceService]: \(stringPrice)")
        }
      }
    }
  }
  
  func getURL(for productType: ProductType) -> URL? {
    switch productType {
    case .chicken:
      return URL.init(string:"https://e-dostavka.by/catalog/item_440852.html")
    case .apple:
      return URL.init(string:"https://e-dostavka.by/catalog/item_39290.html")
    }
  }
}
