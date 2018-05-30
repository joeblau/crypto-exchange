//
//  CoinbaseAPIEndpoints.swift
//  CryptoExchange
//
//  Created by Joe Blau on 1/21/18.
//

import Foundation

public protocol APIEndpointable {
    var oAuthAuthorize: URL { get }
    var oAuthToken: URL { get }
    var listAccounts: URL { get }
}

public struct CoinbaseAPIEndpoints: APIEndpointable {

    public init() {}

    // Authenticate
    public var oAuthAuthorize = "https://www.coinbase.com/oauth/authorize".toURL
    public var oAuthToken = "https://www.coinbase.com/oauth/token".toURL

    // Users
    public func showUser(userId: String) -> URL {
        return "https://api.coinbase.com/v2/users/\(userId)".toURL
    }
    public var showCurrentUser = "https://api.coinbase.com/v2/user".toURL
    public var showAuthorizationInfo = "https://api.coinbase.com/v2/user/auth".toURL

    // Accounts
    public var listAccounts = "https://api.coinbase.com/v2/accounts".toURL
    public func showAccount(accountId: String) -> URL {
        return "https://api.coinbase.com/v2/accounts/\(accountId)".toURL
    }
    public func listAccountAddresses(accountId: String) -> URL {
        return "https://api.coinbase.com/v2/accounts/\(accountId)/addresses".toURL
    }
    public func showAccountAddress(accountId: String, addressId: String) -> URL {
        return "https://api.coinbase.com/v2/accounts/\(accountId)/addresses/\(addressId)".toURL
    }
    public func listAccountAddressTransactions(accountId: String, addressId: String) -> URL {
        return "https://api.coinbase.com/v2/accounts/\(accountId)/addresses/\(addressId)/transactions".toURL
    }

    // Transactions

    public func listAccountTransactions(accountId: String) -> URL {
        return "https://api.coinbase.com/v2/accounts/\(accountId)/transactions".toURL
    }
    public func showAccountTransaction(accountId: String, transactionId: String) -> URL {
        return "https://api.coinbase.com/v2/accounts/\(accountId)/transactions/\(transactionId)".toURL
    }
}

extension String {
    internal var toURL: URL {
        return URL(string: self)!
    }
}
