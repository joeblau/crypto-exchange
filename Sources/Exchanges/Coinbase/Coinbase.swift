//
//  Coinbase.swift
//  CryptoExchange
//
//  Created by Joe Blau on 1/21/18.
//

import Foundation

public class Coinbase: CryptocurrencyExchangable {
    var authorized: Bool

    public init() {
        authorized = false
    }

    // MARK: - CryptocurrencyExchangable

    public func authenticate(credentials: Credentials) -> URL? {
        guard case let Credentials.oAuth(oAuthCredentials) = credentials else {
            return nil
        }

        var urlComponents = URLComponents(url: Coinbase.oAuthAuthorize, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = [URLQueryItem(name: "client_id", value: oAuthCredentials.clientId),
                                     URLQueryItem(name: "redirect_uri", value: "urn:ietf:wg:oauth:2.0:oob"),
                                     URLQueryItem(name: "response_type", value: "code"),
                                     URLQueryItem(name: "scope", value: "wallet:accounts:read")]

        return urlComponents?.url
    }

    public func token(code: String, credentials: Credentials) -> URL? {
        guard case let Credentials.oAuth(oAuthCredentials) = credentials else {
            return nil
        }

        var urlComponents = URLComponents(url: Coinbase.oAuthToken, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = [URLQueryItem(name: "grand_tpye", value: "authorization_code"),
                                     URLQueryItem(name: "code", value: code),
                                     URLQueryItem(name: "client_id", value: oAuthCredentials.clientId),
                                     URLQueryItem(name: "client_secret", value: oAuthCredentials.clientSecret),
                                     URLQueryItem(name: "redirect_uri", value: "wallet:accounts:read")]

        return urlComponents?.url
    }



    
}
