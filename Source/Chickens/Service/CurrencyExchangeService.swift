//
//  CurrencyExchangeService.swift
//  Chickens
//
//  Created by Alexander Yakovlev on 4/18/17.
//  Copyright © 2017 Alexander Yakovlev. All rights reserved.
//

import Foundation
import Moya
import Moya_SwiftyJSONMapper
import SwiftyJSON

enum CurrencyExchange {
  case pair(from: String, to: String)
}

extension CurrencyExchange: TargetType {
  var headers: [String : String]? {
    return nil
  }
  
  var baseURL: URL {
    return URL(string: "http://free.currencyconverterapi.com/api/v3")!
  }
  
  var path: String {
    switch self {
    case .pair:
      return "convert"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .pair:
      return .get
    }
  }
  
  var parameters: [String : Any] {
    switch self {
    case .pair(let from, let to):
      return ["q" : "\(from)_\(to)"]
    }
  }
  
  var parameterEncoding: ParameterEncoding {
    switch self {
    case .pair:
      return URLEncoding.default
    }
  }
  
  var task: Task {
    switch self {
    case .pair:
      return .requestParameters(parameters: parameters, encoding: parameterEncoding)
    }
  }
  
  public var sampleData: Data {
    switch self {
    case .pair:
      let jsonStr = "{\"query\":{\"count\":1},\"results\":{\"USD_BYN\":{\"fr\":\"USD\",\"id\":\"USD_BYN\",\"to\":\"BYN\",\"val\":1.919924}}}"
      if let data = jsonStr.data(using: String.Encoding.utf8) {
        return data
      } else {
        print("Couldn't serialize string")
        return Data()
      }
    }
  }
}

final class CurrencyExchangeService {
  
  //Private
  
  private let provider = MoyaProvider<CurrencyExchange>()
  
  //Public
  
  static let shared: CurrencyExchangeService = CurrencyExchangeService()
  
  func getRate(for pair: CurrencyPair, completion:@escaping ((CurrencyExchangeRate?, Error?) -> ())) {
    if let pair = pair {
      provider.request(.pair(from: pair.0.rawValue, to:pair.1.rawValue)) { result in
        switch result {
        case let .success(moyaResponse):
          do {
            let rate = try moyaResponse.map(to: CurrencyExchangeRate.self)
            completion(rate, nil)
            print("[CurrencyExchangeService]: \(String(describing: rate.value))")
          } catch {
            completion(nil, error)
            print(error)
          }
        case let .failure(error):
          completion(nil, error)
          print(error)
          break
        }
      }
    }
  }
}
