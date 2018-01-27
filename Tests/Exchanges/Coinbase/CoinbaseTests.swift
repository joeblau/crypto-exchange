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
        let oAuthCredentialsMock = OAuthCredentials(clientId: "ABC", clientSecret: "DEF")
        let credentialsMock = Credentials.oAuth(oAuthCredentials: oAuthCredentialsMock)

        let coinbaseMock = Coinbase()
        let mockURL = coinbaseMock.authenticate(credentials: credentialsMock)

        XCTAssertNotNil(oAuthCredentialsMock)
        XCTAssertNotNil(credentialsMock)
        XCTAssertNotNil(coinbaseMock)
        XCTAssertNotNil(mockURL)
    }

    func testCoinbaseAuthenticate_incorrect() {
        let keyCredentialsMock = KeyCredentials(apiKey: "ABC", secretKey: "DEF")
        let credentialsMock = Credentials.keyAuthorization(keyCredentials: keyCredentialsMock)

        let coinbaseMock = Coinbase()
        let mockURL = coinbaseMock.authenticate(credentials: credentialsMock)

        XCTAssertNotNil(keyCredentialsMock)
        XCTAssertNotNil(credentialsMock)
        XCTAssertNotNil(coinbaseMock)
        XCTAssertNil(mockURL)
    }

    func testCoinbaseToken() {
        let oAuthCredentialsMock = OAuthCredentials(clientId: "ABC", clientSecret: "DEF")
        let credentialsMock = Credentials.oAuth(oAuthCredentials: oAuthCredentialsMock)

        let coinbaseMock = Coinbase()
        let mockURL = coinbaseMock.token(code: "ABC", credentials: credentialsMock)

        XCTAssertNotNil(oAuthCredentialsMock)
        XCTAssertNotNil(credentialsMock)
        XCTAssertNotNil(coinbaseMock)
        XCTAssertNotNil(mockURL)
    }

    func testCoinbaseToken_incorrect() {
        let keyCredentialsMock = KeyCredentials(apiKey: "ABC", secretKey: "DEF")
        let credentialsMock = Credentials.keyAuthorization(keyCredentials: keyCredentialsMock)

        let coinbaseMock = Coinbase()
        let mockURL = coinbaseMock.token(code: "ABC", credentials: credentialsMock)

        XCTAssertNotNil(keyCredentialsMock)
        XCTAssertNotNil(credentialsMock)
        XCTAssertNotNil(coinbaseMock)
        XCTAssertNil(mockURL)
    }
}
