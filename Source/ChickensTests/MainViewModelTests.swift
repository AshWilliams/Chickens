//
//  MainViewModelTests.swift
//  ChickensTests
//
//  Created by Sasha Kid on 12/2/17.
//  Copyright © 2017 Alexander Yakovlev. All rights reserved.
//

import XCTest

class MainViewModelTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testMainViewModel() {
    let rate = CurrencyExchangeRate(jsonData: "{\"query\":{\"count\":1},\"results\":{\"BYN_USD\":{\"id\":\"BYN_USD\",\"val\":0.497414,\"to\":\"USD\",\"fr\":\"BYN\"}}}\")")
    let chicken = Chicken()
    chicken.price = 3.79
    chicken.icon = ""
    
    let viewModel = MainViewModel(rate: rate!, product: chicken)
    
    XCTAssertEqual(viewModel.kg, "\((5.26 / 3.79).toString()!)")
    XCTAssertEqual(viewModel.currency, "\((5.26 * 0.497414).toString()!)")
  }
}
