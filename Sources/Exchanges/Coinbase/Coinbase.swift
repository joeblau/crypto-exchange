//
//  Coinbase.swift
//  CryptoExchange
//
//  Created by Joe Blau on 1/21/18.
//

import Foundation

public class Coinbase: CryptocurrencyExchangable {
    private var accessToken: AccessToken?
    private var oAuthCredentials: OAuthCredentials
    private var requestBuilder: RequestBuildable
    private var apiEndpoints: APIEndpointable
    private let jsonDecoder = JSONDecoder()

    public init(credentials: OAuthCredentials,
                requestBuildable: RequestBuildable,
                apiEndpointable: APIEndpointable) {
        oAuthCredentials = credentials
        requestBuilder = requestBuildable
        apiEndpoints = apiEndpointable
    }

    func authenticate() -> URL? {
        return URLComponents(url: apiEndpoints.oAuthAuthorize, resolvingAgainstBaseURL: false)?
            .authenticate(oAuthCredentials: oAuthCredentials)
    }

    func token(code: String) -> URL? {
        return URLComponents(url: apiEndpoints.oAuthToken, resolvingAgainstBaseURL: false)?
            .token(code: code, oAuthCredentials: oAuthCredentials)

    }

    func getAccountBalances(completion: @escaping (_ accounts:  [CoinbaseAccount]?) -> ()) {
        let urlComponents = URLComponents(url: apiEndpoints.listAccounts, resolvingAgainstBaseURL: false)
        do {
            let request = try requestBuilder.build(urlComponents: urlComponents, httpMethod: .get, requestEncoding: .json, queryItems: nil)
            _ = requestBuilder.execute(request: request, queue: DispatchQueue.main, completion: { (data, response, error) in
                guard let data = data else { completion(nil); return }

                do {
                    let coinbaseAccounts = try self.jsonDecoder.decode(CoinbaseAccounts.self, from: data)
                    completion(coinbaseAccounts.data)
                } catch {
                    debugPrint(error)
                    completion(nil)
                }
            })
        } catch {
            debugPrint(error)
            completion(nil)
        }
    }

}
