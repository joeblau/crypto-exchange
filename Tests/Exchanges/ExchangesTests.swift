//
//  ExchangesTests.swift
//  CryptoExchange
//
//  Created by Joe Blau on 1/25/18.
//

import XCTest
@testable import CryptoExchange

class ExchangesTests: XCTestCase {
    
    func testExchangesList_count() {
        XCTAssertEqual(Exchanges.list.count, 1)
    }

}
