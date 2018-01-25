//
//  CoinbaseTests.swift
//  CryptoExchange
//
//  Created by Joe Blau on 1/25/18.
//

import XCTest
@testable import CryptoExchange

class CoinbaseTests: XCTestCase {
    

    func testInit() {
        let coinbaseMock = Coinbase()
        XCTAssertNotNil(coinbaseMock)
    }
    
    func testCoinbaseAuthenticate() {
        let keyCrednetialsMock = KeyCredentials(apiKey: "ABC", secretKey: "DEF")
        let credentialsMock = Credentials.keyAuthorization(keyCredentials: keyCrednetialsMock)

        let coinbaseMock = Coinbase()
        coinbaseMock.authenticate(credentials: credentialsMock)

        XCTAssertNotNil(keyCrednetialsMock)
        XCTAssertNotNil(credentialsMock)
        XCTAssertNotNil(coinbaseMock)

    }
    
}
