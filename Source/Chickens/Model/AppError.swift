//
//  AppError.swift
//  Chickens
//
//  Created by Alexander Yakovlev on 11/15/17.
//  Copyright © 2017 Alexander Yakovlev. All rights reserved.
//

import Foundation

enum ErrorType: Int {
  case noInternet
}

struct AppError: BaseError {
  let type: ErrorType
  var description: String {
    get {
      switch type {
      case .noInternet: return "No internet"
      }
    }
  }
}

