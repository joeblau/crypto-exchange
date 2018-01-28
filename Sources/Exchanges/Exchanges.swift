//
//  Exchanges.swift
//  CryptoExchange
//
//  Created by Joe Blau on 1/21/18.
//

import Foundation

protocol ExchangeEnpointable {}

protocol CryptocurrencyExchangable {}

public struct Exchanges {
    static var types: [CryptocurrencyExchangable.Type] {
        return [Coinbase.self]
    }
}
