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
import Money

final class Rate : ALSwiftyJSONAble {
    let value: Money
    
    required init?(jsonData: JSON){
        self.value = Money(jsonData["results"]["BYN_USD"]["val"].double!)
    }
    
}

enum CurrencyExchange {
    case pair(from: String, to: String)
}

extension CurrencyExchange: TargetType {
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
    
    var parameters: [String : Any]? {
        switch self {
        case .pair(let base, let to):
            return ["q" : "\(base)_\(to)"]
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
            return .request
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
}

final class CurrencyExchangeService {
    static let shared: CurrencyExchangeService = CurrencyExchangeService()
    private let provider = MoyaProvider<CurrencyExchange>()
    var rate: Rate?

    func updateRate() {
        provider.request(.pair(from:"BYN", to:"USD")) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    self.rate = try moyaResponse.map(to: Rate.self)
                    print("[CurrencyExchangeService]: \(self.rate?.value.decimal)")
                } catch {
                    print(error)
                }
            case let .failure(error):
                print(error)
                break
            }
        }
    }
}
