//
//  CoinbaseAPIEndpoints.swift
//  CryptoExchange
//
//  Created by Joe Blau on 1/21/18.
//

import Foundation

public extension Coinbase {

    // Users
    public static func showUser(userId: String) -> URL {
        return "https://api.coinbase.com/v2/users/\(userId)".toURL
    }
    public static var showCurrentUser = "https://api.coinbase.com/v2/user".toURL
    public static var showAuthorizationInfo = "https://api.coinbase.com/v2/user/auth".toURL

    // Accounts
    public static var listAccounts = "https://api.coinbase.com/v2/accounts".toURL
    public static func showAccount(accountId: String) -> URL {
        return "https://api.coinbase.com/v2/accounts/\(accountId)".toURL
    }
    public static func listAccountAddresses(accountId: String) -> URL {
        return "https://api.coinbase.com/v2/accounts/\(accountId)/addresses".toURL
    }
    public static func showAccountAddress(accountId: String, addressId: String) -> URL {
        return "https://api.coinbase.com/v2/accounts/\(accountId)/addresses/\(addressId)".toURL
    }
    public static func listAccountAddressTransactions(accountId: String, addressId: String) -> URL {
        return "https://api.coinbase.com/v2/accounts/\(accountId)/addresses/\(addressId)/transactions".toURL
    }

    // Transactions

    public static func listAccountTransactions(accountId: String) -> URL {
        return "https://api.coinbase.com/v2/accounts/\(accountId)/transactions".toURL
    }
    public static func showAccountTransaction(accountId: String, transactionId: String) -> URL {
        return "https://api.coinbase.com/v2/accounts/\(accountId)/transactions/\(transactionId)".toURL
    }
}

extension String {
    var toURL: URL {
        return URL(string: self)!
    }
}
