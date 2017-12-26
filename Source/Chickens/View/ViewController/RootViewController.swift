//
//  RootViewController.swift
//  Chickens
//
//  Created by Sasha Kid on 11/24/17.
//  Copyright © 2017 Alexander Yakovlev. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, Loadable {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationController?.navigationBar.barTintColor = UIColor.flatSkyBlue
    navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.flatWhite]
    
    startActivity()

    var currencyRate: CurrencyExchangeRate?
    let dispatchGroup = DispatchGroup()
    
    dispatchGroup.enter()
    CurrencyExchangeService.shared.getRate(for: (.BYN, .USD)) { (rate, error) in
      if let rate = rate {
        currencyRate = rate
      }
      dispatchGroup.leave()
    }
    
    dispatchGroup.enter()
    let chicken = Chicken()
    PriceService.shared.getPrice(for: chicken) { (price, error) in
      chicken.price = price
      dispatchGroup.leave()
    }
    
    dispatchGroup.notify(queue: .main) { [weak self] in
      self?.stopActivity()

      if let currencyRate =  currencyRate {
        let viewModel = MainViewModel(rate: currencyRate, product: chicken)
        guard let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as? MainViewController else {
          return
        }
        viewController.viewModel = viewModel
        self?.navigationController?.pushViewController(viewController, animated: false)
      }
    }
  }
}
