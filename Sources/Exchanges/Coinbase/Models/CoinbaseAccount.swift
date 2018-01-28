//
//  CoinbaseAccount.swift
//  CryptoExchange
//
//  Created by Joe Blau on 1/26/18.
//

import Foundation

struct CoinbaseAccounts: Codable {
    var data: [CoinbaseAccount]?
}

struct CoinbaseAccount: Codable {
    var id: UUID
    var name: String
    var type: String
    var currency: String
    var balance: CoinbaseBalance
}

struct CoinbaseBalance: Codable {
    var amount: String
    var currency: String
}
