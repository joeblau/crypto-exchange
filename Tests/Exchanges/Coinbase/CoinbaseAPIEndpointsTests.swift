//
//  CoinbaseAPIEndpointsTests.swift
//  CryptoExchange
//
//  Created by Joe Blau on 1/23/18.
//

import XCTest
@testable import CryptoExchange

class CoinbaseAPIEndpointsTests: XCTestCase {

    let endpoints = CoinbaseAPIEndpoints()

    func testOAuthAuthorize() {
        let mockURL = endpoints.oAuthAuthorize
        XCTAssertEqual(mockURL.absoluteString, "https://www.coinbase.com/oauth/authorize")
    }

    func testOAuthToken() {
        let mockURL = endpoints.oAuthToken
        XCTAssertEqual(mockURL.absoluteString, "http://www.coinbase.com/oauth/token")
    }

    func testShowUser_forUserId() {
        let mockURL = endpoints.showUser(userId: "ABC")
        XCTAssertEqual(mockURL.absoluteString, "https://api.coinbase.com/v2/users/ABC")
    }

    func testShowCurrentUser() {
        let mockURL = endpoints.showCurrentUser
        XCTAssertEqual(mockURL.absoluteString, "https://api.coinbase.com/v2/user")
    }

    func testShowAuthorizationInfo() {
        let mockURL = endpoints.showAuthorizationInfo
        XCTAssertEqual(mockURL.absoluteString, "https://api.coinbase.com/v2/user/auth")
    }

    func testListAccounts() {
        let mockURL = endpoints.listAccounts
        XCTAssertEqual(mockURL.absoluteString, "https://api.coinbase.com/v2/accounts")
    }

    func testShowAccount_forAcocuntId() {
        let mockURL = endpoints.showAccount(accountId: "ABC")
        XCTAssertEqual(mockURL.absoluteString, "https://api.coinbase.com/v2/accounts/ABC")
    }

    func testListAccountAddresses_forAcocuntId() {
        let mockURL = endpoints.listAccountAddresses(accountId: "ABC")
        XCTAssertEqual(mockURL.absoluteString, "https://api.coinbase.com/v2/accounts/ABC/addresses")
    }
    func testShowAccountAddress_forAcocuntId_andAddressId() {
        let mockURL = endpoints.showAccountAddress(accountId: "ABC", addressId: "DEF")
        XCTAssertEqual(mockURL.absoluteString, "https://api.coinbase.com/v2/accounts/ABC/addresses/DEF")
    }

    func testListAccountAddressTransactions_forAcocuntId() {
        let mockURL = endpoints.listAccountAddressTransactions(accountId: "ABC", addressId: "DEF")
        XCTAssertEqual(mockURL.absoluteString, "https://api.coinbase.com/v2/accounts/ABC/addresses/DEF/transactions")
    }

    func testListAccountTransactions_forAcocuntId() {
        let mockURL = endpoints.listAccountTransactions(accountId: "ABC")
        XCTAssertEqual(mockURL.absoluteString, "https://api.coinbase.com/v2/accounts/ABC/transactions")
    }

    func testShowAccountTransaction_forAcocuntId_andAddressId() {
        let mockURL = endpoints.showAccountTransaction(accountId: "ABC", transactionId: "DEF")
        XCTAssertEqual(mockURL.absoluteString, "https://api.coinbase.com/v2/accounts/ABC/transactions/DEF")
    }
}

