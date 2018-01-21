//
//  Exchanges.swift
//  CryptoExchange
//
//  Created by Joe Blau on 1/21/18.
//

import Foundation

protocol CryptocurrencyExchangable {
    var rate: Int { get }
}

public struct Exchanges {
    static var list: [CryptocurrencyExchangable] {
        return [Coinbase()]
    }
}
