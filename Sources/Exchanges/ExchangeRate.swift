//
//  ExchangeRate.swift
//  CryptoExchange
//
//  Created by Joe Blau on 1/21/18.
//

import Foundation

public struct ExchangeRate {
    let exchange: CryptocurrencyExchangable
    let from: Currencyable
    let to: Currencyable
    let rate: Double
}
