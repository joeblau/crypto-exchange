//
//  Credentials.swift
//  CryptoExchange
//
//  Created by Joe Blau on 1/21/18.
//

import Foundation

public enum Credentials {
    case keyAuthorization(keyCredentials: KeyCredentials)
    case oAuth(oAuthCredentials: OAuthCredentials)
    case none
}

public struct KeyCredentials {
    var apiKey: String
    var secretKey: String
}

public struct OAuthCredentials {
    var clientId: String
    var clientSecret: String
}
