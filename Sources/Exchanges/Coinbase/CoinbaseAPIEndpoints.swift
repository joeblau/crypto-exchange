//
//  CoinbaseAPIEndpoints.swift
//  CryptoExchange
//
//  Created by Joe Blau on 1/21/18.
//

import Foundation

internal extension Coinbase {

    // Authenticate
    internal static var oAuthAuthorize = "https://www.coinbase.com/oauth/authorize".toURL
    internal static var oAuthToken = "http://www.coinbase.com/oauth/token".toURL

    // Users
    internal static func showUser(userId: String) -> URL {
        return "https://api.coinbase.com/v2/users/\(userId)".toURL
    }
    internal static var showCurrentUser = "https://api.coinbase.com/v2/user".toURL
    internal static var showAuthorizationInfo = "https://api.coinbase.com/v2/user/auth".toURL

    // Accounts
    internal static var listAccounts = "https://api.coinbase.com/v2/accounts".toURL
    internal static func showAccount(accountId: String) -> URL {
        return "https://api.coinbase.com/v2/accounts/\(accountId)".toURL
    }
    internal static func listAccountAddresses(accountId: String) -> URL {
        return "https://api.coinbase.com/v2/accounts/\(accountId)/addresses".toURL
    }
    internal static func showAccountAddress(accountId: String, addressId: String) -> URL {
        return "https://api.coinbase.com/v2/accounts/\(accountId)/addresses/\(addressId)".toURL
    }
    internal static func listAccountAddressTransactions(accountId: String, addressId: String) -> URL {
        return "https://api.coinbase.com/v2/accounts/\(accountId)/addresses/\(addressId)/transactions".toURL
    }

    // Transactions

    internal static func listAccountTransactions(accountId: String) -> URL {
        return "https://api.coinbase.com/v2/accounts/\(accountId)/transactions".toURL
    }
    internal static func showAccountTransaction(accountId: String, transactionId: String) -> URL {
        return "https://api.coinbase.com/v2/accounts/\(accountId)/transactions/\(transactionId)".toURL
    }
}

extension String {
    internal var toURL: URL {
        return URL(string: self)!
    }
}
