//
//  CoinbaseAccount.swift
//  CryptoExchange
//
//  Created by Joe Blau on 1/26/18.
//

import Foundation

public struct CoinbaseAccounts: Codable {
    public var data: [CoinbaseAccount]?
}

public struct CoinbaseAccount: Codable {
    public var id: UUID
    public var name: String
    public var type: String
    public var currency: String
    public var balance: CoinbaseBalance
}

public struct CoinbaseBalance: Codable {
    public var amount: String
    public var currency: String
}
