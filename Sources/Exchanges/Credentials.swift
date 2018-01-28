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
    public var apiKey: String
    public var secretKey: String

    public init(apiKey: String, secretKey: String) {
        self.apiKey = apiKey
        self.secretKey = secretKey
    }
}

public struct OAuthCredentials {
    public var clientId: String
    public var clientSecret: String

    public init(clientId: String, clientSecret: String) {
        self.clientId = clientId
        self.clientSecret = clientSecret
    }
}
