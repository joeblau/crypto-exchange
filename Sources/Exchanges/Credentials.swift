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
}

public struct OAuthCredentials {
    public var clientId: String
    public var clientSecret: String
    public var redirectURI: String

    public init(clientId: String, clientSecret: String, redirectURI: String) {
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.redirectURI = redirectURI
    }
}
