//
//  PriceUpdater.swift
//  Chickens
//
//  Created by Aleksey Gorbachevskiy on 21/03/17.
//  Copyright © 2017 Alexander Yakovlev. All rights reserved.
//

import UIKit

final class PriceUpdater {
    
    private init() { }
    
    //MARK: Shared Instance
    
    static let sharedInstance: PriceUpdater = PriceUpdater()
    
    private var _settings: NSMutableDictionary?
    private var settings: NSMutableDictionary? {
        
        get {
            
            if _settings == nil {
                
                if let path = Bundle.main.path(forResource: "Settings", ofType: "plist") {
                    
                    if let dict = NSMutableDictionary(contentsOfFile: path) {
                        
                        _settings = dict
                    }
                }
            }
            
            return _settings
        }
    }
    
    private var _price: Double = 0
    var price : Double {
        
        get {
                
            if settings != nil {
                
                if let numberPrice = settings!.value(forKey: "Price") as? NSNumber {
                    
                    _price = Double(numberPrice)
                }
            }
            
            return _price
        }
        
        set {
            
            _price = newValue
            
            if settings != nil {
                
                settings!["Price"] = newValue
            }
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
                                        
                                    default: break
                                    }
                                }
                            }
                        }
                        
                        if let doublePrice = Double(stringPrice) {
                            
                            price = doublePrice
                        }
                    }
                }
            }
        }
    }
}
