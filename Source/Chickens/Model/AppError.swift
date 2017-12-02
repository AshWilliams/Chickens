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
  case wrongURL
  case unknown
}

struct AppError: BaseError {
  typealias T = ErrorType
  var type: ErrorType
  var description: String {
    get {
      switch type {
      case .noInternet: return "No internet"
      case .wrongURL: return "Wrong URL"
      case .unknown: return "Unknown error"
      }
    }
  }
}

