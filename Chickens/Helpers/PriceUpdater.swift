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
    
    var price : Double {
        
        get {
            
            var myDict: NSDictionary?
            if let path = Bundle.main.path(forResource: "Settings", ofType: "plist") {
                myDict = NSDictionary(contentsOfFile: path)
                
                if let dict = myDict {
                    
                    if let price = dict.value(forKey: "Price") as? NSNumber {
                        
                        return Double(price)
                    }
                }
            }
            
            return 0
        }
    }
    
    func updatePrice() {
        
        //FIXME: update
    }
}
