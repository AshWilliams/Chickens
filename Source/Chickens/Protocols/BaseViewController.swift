//
//  BaseViewController.swift
//  Chickens
//
//  Created by Alexander Yakovlev on 11/15/17.
//  Copyright © 2017 Alexander Yakovlev. All rights reserved.
//

import Foundation
import UIKit

protocol Loadable {
  func startActivity()
  func stopActivity()
}

extension Loadable {
  func startActivity() {
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
  }
  
  func stopActivity() {
    UIApplication.shared.isNetworkActivityIndicatorVisible = false
  }
}

protocol BaseViewController {
  associatedtype T
  func inject(viewModel: T)
  func assertDependencies()
  func handle(error: AppError)
}
