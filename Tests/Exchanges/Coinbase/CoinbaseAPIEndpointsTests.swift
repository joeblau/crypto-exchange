//
//  CoinbaseAPIEndpointsTests.swift
//  CryptoExchange
//
//  Created by Joe Blau on 1/23/18.
//

import XCTest
@testable import CryptoExchange

class CoinbaseAPIEndpointsTests: XCTestCase {

    func testOAuthAuthorize() {
        let mockURL = Coinbase.oAuthAuthorize
        XCTAssertEqual(mockURL.absoluteString, "https://www.coinbase.com/oauth/authorize")
    }

    func testOAuthToken() {
        let mockURL = Coinbase.oAuthToken
        XCTAssertEqual(mockURL.absoluteString, "http://www.coinbase.com/oauth/token")
    }

    func testShowUser_forUserId() {
        let mockURL = Coinbase.showUser(userId: "ABC")
        XCTAssertEqual(mockURL.absoluteString, "https://api.coinbase.com/v2/users/ABC")
    }

    func testShowCurrentUser() {
        let mockURL = Coinbase.showCurrentUser
        XCTAssertEqual(mockURL.absoluteString, "https://api.coinbase.com/v2/user")
    }

    func testShowAuthorizationInfo() {
        let mockURL = Coinbase.showAuthorizationInfo
        XCTAssertEqual(mockURL.absoluteString, "https://api.coinbase.com/v2/user/auth")
    }

    func testListAccounts() {
        let mockURL = Coinbase.listAccounts
        XCTAssertEqual(mockURL.absoluteString, "https://api.coinbase.com/v2/accounts")
    }

    func testShowAccount_forAcocuntId() {
        let mockURL = Coinbase.showAccount(accountId: "ABC")
        XCTAssertEqual(mockURL.absoluteString, "https://api.coinbase.com/v2/accounts/ABC")
    }

    func testListAccountAddresses_forAcocuntId() {
        let mockURL = Coinbase.listAccountAddresses(accountId: "ABC")
        XCTAssertEqual(mockURL.absoluteString, "https://api.coinbase.com/v2/accounts/ABC/addresses")
    }
    func testShowAccountAddress_forAcocuntId_andAddressId() {
        let mockURL = Coinbase.showAccountAddress(accountId: "ABC", addressId: "DEF")
        XCTAssertEqual(mockURL.absoluteString, "https://api.coinbase.com/v2/accounts/ABC/addresses/DEF")
    }

    func testListAccountAddressTransactions_forAcocuntId() {
        let mockURL = Coinbase.listAccountAddressTransactions(accountId: "ABC", addressId: "DEF")
        XCTAssertEqual(mockURL.absoluteString, "https://api.coinbase.com/v2/accounts/ABC/addresses/DEF/transactions")
    }

    func testListAccountTransactions_forAcocuntId() {
        let mockURL = Coinbase.listAccountTransactions(accountId: "ABC")
        XCTAssertEqual(mockURL.absoluteString, "https://api.coinbase.com/v2/accounts/ABC/transactions")
    }

    func testShowAccountTransaction_forAcocuntId_andAddressId() {
        let mockURL = Coinbase.showAccountTransaction(accountId: "ABC", transactionId: "DEF")
        XCTAssertEqual(mockURL.absoluteString, "https://api.coinbase.com/v2/accounts/ABC/transactions/DEF")
    }
}

