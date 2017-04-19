//
//  PriceService.swift
//  Chickens
//
//  Created by Aleksey Gorbachevskiy on 21/03/17.
//  Copyright © 2017 Alexander Yakovlev. All rights reserved.
//

import UIKit
import Money

final class PriceService {
    
    static let shared: PriceService = PriceService()
    
    var price: Money {
        get {
            if let numberPrice = settings!.value(forKey: "Price") as? Double {
                return Money(numberPrice)
            } else {
                return 0
            }
        }
        
        set {
            settings?["Price"] = newValue
        }
    }
    
    private var settings: NSMutableDictionary? {
        get {
            if let path = Bundle.main.path(forResource: "Settings", ofType: "plist") {
                if let dict = NSMutableDictionary(contentsOfFile: path) {
                    return dict
                }
            }
            return nil
        }
    }
    
    func updatePrice() {
        if let url = URL.init(string:"https://e-dostavka.by/catalog/item_440852.html") {
            if let data = NSData.init(contentsOf: url) {
                let doc = TFHpple(htmlData: data as Data!)
                if let elements = doc?.search(withXPathQuery: "//div[@class='right']/div[@class='services_wrap']/div[@class='prices_block']/div[@class='price_byn']/div[@class='price']") as? [TFHppleElement] {
                    for element in elements {
                        let components = element.content.components(separatedBy:".")
                        var stringPrice = ""
                        for (i, component) in components.enumerated() {
                            if let newComponent = Int(component.components(separatedBy: CharacterSet.decimalDigits.inverted).joined(separator: "")) {
                                if component.characters.count > 0 {
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
                        price = Money(Double(stringPrice)!)
                        //print("[PriceService]: \(price.formatted(withStyle: .currencyPlural, forLocale: .Belarusian))")
                        print("[PriceService]: \(price.decimal)")
                    }
                }
            }
        }
    }
}
