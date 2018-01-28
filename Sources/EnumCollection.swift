//
//  EnumCollection.swift
//  CryptoExchangeTests
//
//  Created by Joe Blau on 1/20/18.
//  Copyright © 2018 Joe Blau. All rights reserved.
//

import Foundation

protocol EnumCollection {}

// codebeat:disable[BLOCK_NESTING]
extension EnumCollection where Self: Hashable, Self: RawRepresentable {
    static var enumerations: AnySequence<(Self,Self.RawValue)> {
        return AnySequence { () -> AnyIterator<(Self, Self.RawValue)> in
            var raw = 0
            return AnyIterator {
                let `case` : Self = withUnsafePointer(to: &raw) { $0.withMemoryRebound(to: Self.self, capacity: 1) { $0.pointee } }
                let value = `case`.rawValue
                guard `case`.hashValue == raw else { return nil }
                raw += 1
                return (`case`, value)
            }
        }
    }

}
// codebeat:enable[BLOCK_NESTING]
