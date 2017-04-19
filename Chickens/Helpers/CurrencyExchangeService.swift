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

final class Rate : ALSwiftyJSONAble {
    let value: String
    
    required init?(jsonData: JSON){
        self.value = jsonData["results"]["BYN_USD"]["val"].stringValue
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
    
    func updateRate() {
        provider.request(.pair(from:"BYN", to:"USD")) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let rate = try moyaResponse.map(to: Rate.self)
                    print("[CurrencyExchangeService]: \(rate.value)")
                } catch {
                    print(error)
                }
            case let .failure(error):
                
                break
            }
        }
    }
}
