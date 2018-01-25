//
//  Credentials.swift
//  CryptoExchange
//
//  Created by Joe Blau on 1/21/18.
//

import Foundation

public enum Credentials {
    case keyAuthorization(keyCredentials: KeyCredentials)
}

public struct KeyCredentials {
    var apiKey: String?
    var secretKey: String?
}
