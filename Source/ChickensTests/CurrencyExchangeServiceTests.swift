//
//  CurrencyExchangeServiceTests.swift
//  Chickens
//
//  Created by Alexander Yakovlev on 9/6/17.
//  Copyright © 2017 Alexander Yakovlev. All rights reserved.
//

import XCTest
@testable import Moya

class CurrencyExchangeServiceTests: XCTestCase {
    var testProvider: MoyaProvider<CurrencyExchange>!
    
    override func setUp() {
        super.setUp()
        
        let testProvider = MoyaProvider<CurrencyExchange>(
            endpointClosure: MoyaProvider.defaultEndpointMapping,
            requestClosure: MoyaProvider.defaultRequestMapping,
            stubClosure: MoyaProvider.immediatelyStub
        )
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRate() {
        XCTAssertNotEqual(CurrencyExchangeService.shared.rate?.value, 0)
    }
}
