//
//  CurrencyProtocols.swift
//  CryptoExchange
//
//  Created by Joe Blau on 1/20/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import Foundation

protocol Precisionable {
    var scale: Int { get }
}

protocol Standardizable {
    associatedtype Standard
    var standard: Standard { get }
}

protocol Currencyable: Precisionable  {
    var symbol: String { get }
    var name: String { get }
    var longName: String { get }
}
