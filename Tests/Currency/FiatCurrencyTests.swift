//
//  FiatCurrencyTests.swift
//  CryptoExchangeTests
//
//  Created by Joe Blau on 1/20/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import XCTest
@testable import CryptoExchange

class FiatCurrencyTests: XCTestCase {

    func testDebugDescription() {
        FiatCurrency
            .enumerations
            .forEach { (fiatCurrency) in
                let longName = FiatCurrency(rawValue: fiatCurrency.1)!.longName
                XCTAssertEqual(longName, "\(fiatCurrency.0.name) (\(fiatCurrency.0.symbol))")
        }
    }

    func testPrecision() {
        XCTAssertEqual(FiatCurrency.usd.scale, 2)
        XCTAssertEqual(FiatCurrency.jpy.scale, 0)
        XCTAssertEqual(FiatCurrency.omr.scale, 3)
    }

}
