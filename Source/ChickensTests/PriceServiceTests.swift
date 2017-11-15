//
//  ChickensTests.swift
//  ChickensTests
//
//  Created by Alexander Yakovlev on 3/21/17.
//  Copyright © 2017 Alexander Yakovlev. All rights reserved.
//

import XCTest
@testable import Chickens

class PriceServiceTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testPrice() {
    XCTAssertNotEqual(PriceService.shared.price, 0)
  }
}
