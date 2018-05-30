//
//  URL+Extensions.swift
//  CryptoExchange
//
//  Created by Joe Blau on 1/26/18.
//

import Foundation

protocol OAuthAuthenticatable {
    func authenticate(oAuthCredentials: OAuthCredentials) -> URL?
    func token(code: String, oAuthCredentials: OAuthCredentials) -> URL?
}

extension URLComponents: OAuthAuthenticatable {
    public func authenticate(oAuthCredentials: OAuthCredentials) -> URL? {
        var urlComponents = self
        urlComponents.queryItems = [URLQueryItem(name: "client_id", value: oAuthCredentials.clientId),
                                     URLQueryItem(name: "response_type", value: "code"),
                                     URLQueryItem(name: "scope", value: "wallet:accounts:read")]

        return urlComponents.url
    }

    public func token(code: String, oAuthCredentials: OAuthCredentials) -> URL? {
        var urlComponents = self
        urlComponents.queryItems = [URLQueryItem(name: "grand_tpye", value: "authorization_code"),
                                     URLQueryItem(name: "code", value: code),
                                     URLQueryItem(name: "client_id", value: oAuthCredentials.clientId),
                                     URLQueryItem(name: "client_secret", value: oAuthCredentials.clientSecret),
                                     URLQueryItem(name: "redirect_uri", value: oAuthCredentials.redirectURI)]

        return urlComponents.url
    }
}
