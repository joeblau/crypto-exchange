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

    public func authenticate() -> URL? {
        return URLComponents(url: apiEndpoints.oAuthAuthorize, resolvingAgainstBaseURL: false)?
            .authenticate(oAuthCredentials: oAuthCredentials)
    }

    public func token(code: String) -> URL? {
        return URLComponents(url: apiEndpoints.oAuthToken, resolvingAgainstBaseURL: false)?
            .token(code: code, oAuthCredentials: oAuthCredentials)

    }

    public func updateAccessToken(tokenURL: URL) {
        let urlComponents = URLComponents(url: tokenURL, resolvingAgainstBaseURL: false)
        do {
            let request = try requestBuilder.build(urlComponents: urlComponents, httpMethod: .post, requestEncoding: nil, queryItems: nil, headers: nil)
            _ = requestBuilder.execute(request: request, queue: DispatchQueue.main, completion: { (data, response, error) in
                guard let data = data else { return }
                self.accessToken = try? self.jsonDecoder.decode(AccessToken.self, from: data)
            })
        } catch {
            debugPrint(error)
        }
    }

    public func getAccountBalances(completion: @escaping (_ accounts:  [CoinbaseAccount]?) -> ()) {
        let urlComponents = URLComponents(url: apiEndpoints.listAccounts, resolvingAgainstBaseURL: false)
        guard let accessToken = accessToken else { return }
        do {
            let headers = [(httpHeaderField: "Authorization", value: "\(accessToken.tokenType) \(accessToken.accessToken)")]
            let request = try requestBuilder.build(urlComponents: urlComponents, httpMethod: .get, requestEncoding: .json, queryItems: nil, headers: headers)
            _ = requestBuilder.execute(request: request, queue: DispatchQueue.main, completion: { (data, response, error) in
                completion(self.jsonDecodeAccounts(data: data)?.data)
            })
        } catch {
            debugPrint(error)
            completion(nil)
        }
    }

    // MARK: - Private

    fileprivate func jsonDecodeAccounts(data: Data?) -> CoinbaseAccounts? {
        guard let data = data else { return nil }
        return try? jsonDecoder.decode(CoinbaseAccounts.self, from: data)
    }

}
