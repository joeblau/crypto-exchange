//
//  CryptoCurrencyTests.swift
//  CryptoExchangeTests
//
//  Created by Joe Blau on 1/20/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import XCTest
@testable import CryptoExchange

class CryptoCurrencyTests: XCTestCase {

    func testDebugDescription() {
        CryptoCurrency
            .enumerations
            .forEach { (cryptoCurrency) in
                let debugDescription = CryptoCurrency(rawValue: cryptoCurrency.1)!.debugDescription
                XCTAssertEqual(debugDescription, cryptoCurrency.0.debugDescription)
        }
    }

    func testEquality() {
        XCTAssertEqual(CryptoCurrency.eth, CryptoCurrency.eth)
        XCTAssertNotEqual(CryptoCurrency.eth, CryptoCurrency.btc)
    }

    func testHash() {
        XCTAssertEqual(CryptoCurrency.eth.hashValue, CryptoCurrency.eth.hashValue)
        XCTAssertNotEqual(CryptoCurrency.eth.hashValue, CryptoCurrency.btc.hashValue)
    }

    func testBitcoinEquality() {
        XCTAssertEqual(CryptoCurrency.btc, CryptoCurrency.btc)
        XCTAssertEqual(CryptoCurrency.xbt, CryptoCurrency.xbt)
        XCTAssertEqual(CryptoCurrency.btc, CryptoCurrency.xbt)
        XCTAssertEqual(CryptoCurrency.xbt, CryptoCurrency.btc)
    }

    func testStellarEquality() {
        XCTAssertEqual(CryptoCurrency.xlm, CryptoCurrency.xlm)
        XCTAssertEqual(CryptoCurrency.str, CryptoCurrency.str)
        XCTAssertEqual(CryptoCurrency.xlm, CryptoCurrency.str)
        XCTAssertEqual(CryptoCurrency.str, CryptoCurrency.xlm)
    }

    func testiotaEquality() {
        XCTAssertEqual(CryptoCurrency.iot, CryptoCurrency.iot)
        XCTAssertEqual(CryptoCurrency.iota, CryptoCurrency.iota)
        XCTAssertEqual(CryptoCurrency.miota, CryptoCurrency.miota)
        XCTAssertEqual(CryptoCurrency.iot, CryptoCurrency.iota)
        XCTAssertEqual(CryptoCurrency.iot, CryptoCurrency.miota)
        XCTAssertEqual(CryptoCurrency.iota, CryptoCurrency.iot)
        XCTAssertEqual(CryptoCurrency.miota, CryptoCurrency.iot)
        XCTAssertEqual(CryptoCurrency.iota, CryptoCurrency.miota)
        XCTAssertEqual(CryptoCurrency.miota, CryptoCurrency.iota)
    }

    func testPrecision() {
        XCTAssertEqual(CryptoCurrency.btc.scale, 8)
        XCTAssertEqual(CryptoCurrency.votes.scale, 10)
        XCTAssertEqual(CryptoCurrency.qash.scale, 14)
    }
}

