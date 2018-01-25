//
//  Exchanges.swift
//  CryptoExchange
//
//  Created by Joe Blau on 1/21/18.
//

import Foundation

protocol ExchangeEnpointable {
//    var baseURL: URL { get }
}

protocol CryptocurrencyExchangable {
    func authenticate(credentials: Credentials)
}

public struct Exchanges {
    static var list: [CryptocurrencyExchangable] {
        return [Coinbase()]
    }
}
