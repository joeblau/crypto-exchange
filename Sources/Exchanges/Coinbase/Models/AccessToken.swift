//
//  AccessToken.swift
//  CryptoExchange
//
//  Created by Joe Blau on 1/26/18.
//

import Foundation

struct AccessToken: Codable {
    var accessToken: String
    var tokenType: String
    var expiresIn: UInt
    var refreshToken: String
    var scope: String

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case refreshToken = "refresh_token"
        case scope = "scope"
    }
}
