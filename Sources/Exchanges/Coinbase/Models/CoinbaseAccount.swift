//
//  CoinbaseAccount.swift
//  CryptoExchange
//
//  Created by Joe Blau on 1/26/18.
//

import Foundation

public struct CoinbaseAccounts: Codable {
    var data: [CoinbaseAccount]?
}

public struct CoinbaseAccount: Codable {
    var id: UUID
    var name: String
    var type: String
    var currency: String
    var balance: CoinbaseBalance
}

public struct CoinbaseBalance: Codable {
    var amount: String
    var currency: String
}
