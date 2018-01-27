//
//  Exchanges.swift
//  CryptoExchange
//
//  Created by Joe Blau on 1/21/18.
//

import Foundation

protocol ExchangeEnpointable {
}

protocol CryptocurrencyExchangable {
    var authorized: Bool { get }
    func authenticate(credentials: Credentials) -> URL?
}

public struct Exchanges {
    static var list: [CryptocurrencyExchangable] {
        return [Coinbase()]
    }
}
