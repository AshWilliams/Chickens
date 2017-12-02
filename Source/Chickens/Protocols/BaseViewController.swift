//
//  BaseViewController.swift
//  Chickens
//
//  Created by Alexander Yakovlev on 11/15/17.
//  Copyright © 2017 Alexander Yakovlev. All rights reserved.
//

import Foundation

protocol BaseViewController {
  associatedtype M
  var viewModel: M {get set}
  func handle(error: AppError)
}
