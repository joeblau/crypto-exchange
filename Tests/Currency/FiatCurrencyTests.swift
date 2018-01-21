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
                let debugDescription = FiatCurrency(rawValue: fiatCurrency.1)!.debugDescription
                XCTAssertEqual(debugDescription, fiatCurrency.0.debugDescription)
        }
    }

    func testPrecision() {
        XCTAssertEqual(FiatCurrency.usd.scale, 2)
        XCTAssertEqual(FiatCurrency.jpy.scale, 0)
        XCTAssertEqual(FiatCurrency.omr.scale, 3)
    }

}
