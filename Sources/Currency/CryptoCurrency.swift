//
//  CryptoCurrency.swift
//  CryptoExchange
//
//  Created by Joe Blau on 1/20/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import Foundation


public enum CryptoCurrency: String, EnumCollection {
    case btc   = "BTC"
    case xbt   = "XBT" // Alternate symbol for BTC
    case bch   = "BCH"
    case eth   = "ETH"
    case ltc   = "LTC"
    case zec   = "ZEC"
    case dash  = "DASH"
    case xrp   = "XRP"
    case xmr   = "XMR"
    case gnt   = "GNT"
    case zrx   = "ZRX"
    case usdt  = "USDT"
    case miota = "MIOTA"
    case iota  = "IOTA" // Alternate symbol for MIOTA
    case iot   = "IOT"  // Alternate symbol for MIOTA
    case votes = "VOTES"
    case amm   = "AMM"
    case qash  = "QASH"
    case xlm   = "XLM"
    case str   = "STR" // Alternate symbol for XLM
}

extension CryptoCurrency: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String {
        switch self {
        case .btc, .xbt:          return "Bitcoin"
        case .bch:                return "Bitcoin Cash"
        case .eth:                return "Ether"
        case .ltc:                return "Litecoin"
        case .zec:                return "Zcash"
        case .dash:               return "Dash"
        case .xrp:                return "Ripple"
        case .xmr:                return "Monero"
        case .gnt:                return "Golem"
        case .zrx:                return "0x"
        case .usdt:               return "Tether"
        case .miota, .iota, .iot: return "IOTA"
        case .votes:              return "VOTES"
        case .amm:                return "MicroMoney"
        case .qash:               return "QASH"
        case .xlm, .str:          return "Stellar"
        }
    }

    public var debugDescription: String {
        return description
    }
}

extension CryptoCurrency: Equatable {
    public static func ==(lhs: CryptoCurrency, rhs: CryptoCurrency) -> Bool {
        return lhs.standard.rawValue == rhs.standard.rawValue
    }
}

extension CryptoCurrency: Precisionable {
    var scale: Int {
        switch self {
        case .votes: return 10
        case .amm, .qash: return 14
        default: return 8
        }
    }
}

extension CryptoCurrency: Standardizable {
    typealias Standard = CryptoCurrency
    var standard: CryptoCurrency {
        switch self {
        case .btc, .xbt: return CryptoCurrency.btc
        case .miota, .iota, .iot: return CryptoCurrency.miota
        case .xlm, .str: return .xlm
        default: return self
        }
    }
}


