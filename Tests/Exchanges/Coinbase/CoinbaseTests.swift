//
//  CoinbaseTests.swift
//  CryptoExchange
//
//  Created by Joe Blau on 1/25/18.
//

import XCTest
@testable import CryptoExchange

class CoinbaseTests: XCTestCase {
    
    func testInit() {
        let oAuthCredentialsMock = OAuthCredentials(clientId: "ABC", clientSecret: "DEF")
        let requestBuilderMock = RequestBuilder()

        let coinbaseMock = Coinbase(credentials: oAuthCredentialsMock,
                                    requestBuildable: requestBuilderMock,
                                    apiEndpointable: CoinbaseAPIEndpoints())
        XCTAssertNotNil(coinbaseMock)
    }

    func testAuthenticationURL() {
        let oAuthCredentialsMock = OAuthCredentials(clientId: "ABC", clientSecret: "DEF")
        let requestBuilderMock = RequestBuilder()

        let coinbaseMock = Coinbase(credentials: oAuthCredentialsMock,
                                    requestBuildable: requestBuilderMock,
                                    apiEndpointable: CoinbaseAPIEndpoints())
        let mockURL = coinbaseMock.authenticate()
        XCTAssertNotNil(mockURL)
    }

    func testTokenURL() {
        let oAuthCredentialsMock = OAuthCredentials(clientId: "ABC", clientSecret: "DEF")
        let requestBuilderMock = RequestBuilder()

        let coinbaseMock = Coinbase(credentials: oAuthCredentialsMock,
                                    requestBuildable: requestBuilderMock,
                                    apiEndpointable: CoinbaseAPIEndpoints())
        let mockURL = coinbaseMock.token(code: "XYZ")
        XCTAssertNotNil(mockURL)
    }

    func testGetAccountBalances() {
        class RequestBuilderMock: RequestBuildable {
            func build(urlComponents: URLComponents?, httpMethod: HTTPMethod, requestEncoding: RequestEncoding?, queryItems: [URLQueryItem]?) throws -> URLRequest {
                return URLRequest(url: URL(string: "https://www.cryptostream.com")!)
            }

            func execute(request: URLRequest, queue: DispatchQueue, completion: ((Data?, URLResponse?, Error?) -> Void)?) -> URLSessionTask {
                let mockDataResponse =
                """
                {
                  "pagination": {
                    "ending_before": null,
                    "starting_after": null,
                    "limit": 25,
                    "order": "desc",
                    "previous_uri": null,
                    "next_uri": null
                  },
                  "data": [
                    {
                      "id": "58542935-67b5-56e1-a3f9-42686e07fa40",
                      "name": "My Vault",
                      "primary": false,
                      "type": "vault",
                      "currency": "BTC",
                      "balance": {
                        "amount": "4.00000000",
                        "currency": "BTC"
                      },
                      "created_at": "2015-01-31T20:49:02Z",
                      "updated_at": "2015-01-31T20:49:02Z",
                      "resource": "account",
                      "resource_path": "/v2/accounts/58542935-67b5-56e1-a3f9-42686e07fa40",
                      "ready": true
                    },
                    {
                      "id": "2bbf394c-193b-5b2a-9155-3b4732659ede",
                      "name": "My Wallet",
                      "primary": true,
                      "type": "wallet",
                      "currency": "BTC",
                      "balance": {
                        "amount": "39.59000000",
                        "currency": "BTC"
                      },
                      "created_at": "2015-01-31T20:49:02Z",
                      "updated_at": "2015-01-31T20:49:02Z",
                      "resource": "account",
                      "resource_path": "/v2/accounts/2bbf394c-193b-5b2a-9155-3b4732659ede"
                    }
                  ]
                }
                """
                completion?(mockDataResponse.data(using: .utf8), nil, nil)
                return URLSessionTask()
            }
        }

        let oAuthCredentialsMock = OAuthCredentials(clientId: "ABC", clientSecret: "DEF")

        let coinbaseMock = Coinbase(credentials: oAuthCredentialsMock,
                                    requestBuildable: RequestBuilderMock(),
                                    apiEndpointable: CoinbaseAPIEndpoints())

        let expectResponse = expectation(description: "get account balances")

        coinbaseMock.getAccountBalances { (mockCoinbaseAccounts) in
            XCTAssertEqual(mockCoinbaseAccounts?.count, 2)
            expectResponse.fulfill()
        }

        waitForExpectations(timeout: 5) { error in
        }
    }

    func testGetAccountBalances_failed_jsonParsing() {
        class RequestBuilderMock: RequestBuildable {
            func build(urlComponents: URLComponents?, httpMethod: HTTPMethod, requestEncoding: RequestEncoding?, queryItems: [URLQueryItem]?) throws -> URLRequest {
                return URLRequest(url: URL(string: "https://www.cryptostream.com")!)
            }

            func execute(request: URLRequest, queue: DispatchQueue, completion: ((Data?, URLResponse?, Error?) -> Void)?) -> URLSessionTask {
                let mockDataResponse =
                """
                {
                  "pagination": {
                    "ending_before": null,
                    "starting_after": null,
                    "limit": 25,
                    "order": "desc",
                    "previous_uri": null,
                    "next_uri": null
                  },
                  "data": [
                    {
                      "id": "58542935-67b5-56e1-a3f9-42686e07fa40",
                      "name": "My Vault",
                      "primary": false,
                      "type": "vault",
                      "currency": "BTC",
                      "balance": {
                        "amount": 4.00000000,
                        "currency": "BTC"
                      },
                      "created_at": "2015-01-31T20:49:02Z",
                      "updated_at": "2015-01-31T20:49:02Z",
                      "resource": "account",
                      "resource_path": "/v2/accounts/58542935-67b5-56e1-a3f9-42686e07fa40",
                      "ready": true
                    }
                  ]
                }
                """
                completion?(mockDataResponse.data(using: .utf8), nil, nil)
                return URLSessionTask()
            }
        }

        let oAuthCredentialsMock = OAuthCredentials(clientId: "ABC", clientSecret: "DEF")

        let coinbaseMock = Coinbase(credentials: oAuthCredentialsMock,
                                    requestBuildable: RequestBuilderMock(),
                                    apiEndpointable: CoinbaseAPIEndpoints())

        let expectResponse = expectation(description: "get account balances failed JSON parsing")

        coinbaseMock.getAccountBalances { (mockCoinbaseAccounts) in
            XCTAssertNil(mockCoinbaseAccounts)
            expectResponse.fulfill()
        }

        waitForExpectations(timeout: 5) { error in
        }
    }

    func testGetAccountBalances_failed_notData() {
        class RequestBuilderMock: RequestBuildable {
            func build(urlComponents: URLComponents?, httpMethod: HTTPMethod, requestEncoding: RequestEncoding?, queryItems: [URLQueryItem]?) throws -> URLRequest {
                return URLRequest(url: URL(string: "https://www.cryptostream.com")!)
            }

            func execute(request: URLRequest, queue: DispatchQueue, completion: ((Data?, URLResponse?, Error?) -> Void)?) -> URLSessionTask {
                completion?(nil, nil, nil)
                return URLSessionTask()
            }
        }

        let oAuthCredentialsMock = OAuthCredentials(clientId: "ABC", clientSecret: "DEF")

        let coinbaseMock = Coinbase(credentials: oAuthCredentialsMock,
                                    requestBuildable: RequestBuilderMock(),
                                    apiEndpointable: CoinbaseAPIEndpoints())

        let expectResponse = expectation(description: "get account balances failed not data")

        coinbaseMock.getAccountBalances { (mockCoinbaseAccounts) in
            XCTAssertNil(mockCoinbaseAccounts)
            expectResponse.fulfill()
        }

        waitForExpectations(timeout: 5) { error in
        }
    }

    func testGetAccountBalances_failed_endpoint() {
        class RequestBuilderMock: RequestBuildable {
            func build(urlComponents: URLComponents?, httpMethod: HTTPMethod, requestEncoding: RequestEncoding?, queryItems: [URLQueryItem]?) throws -> URLRequest {
                throw RequestError.invalidURL
            }

            func execute(request: URLRequest, queue: DispatchQueue, completion: ((Data?, URLResponse?, Error?) -> Void)?) -> URLSessionTask {
                completion?(nil, nil, nil)
                return URLSessionTask()
            }
        }

        let oAuthCredentialsMock = OAuthCredentials(clientId: "ABC", clientSecret: "DEF")
        let urlReeuestMock = URLRequest(url: URL(string: "https://www.cryptostream.com")!)
        let requestBuilderMock = RequestBuilderMock()

        let coinbaseMock = Coinbase(credentials: oAuthCredentialsMock,
                                    requestBuildable: requestBuilderMock,
                                    apiEndpointable: CoinbaseAPIEndpoints())

        let expectResponse = expectation(description: "get account balances")

        coinbaseMock.getAccountBalances { (mockCoinbaseAccounts) in
            XCTAssertNil(mockCoinbaseAccounts)
            _ = requestBuilderMock.execute(request: urlReeuestMock, queue: DispatchQueue.main, completion: { (data, response, error) in
                XCTAssertNil(data)
                XCTAssertNil(response)
                XCTAssertNil(error)
            })
            expectResponse.fulfill()
        }

        waitForExpectations(timeout: 5) { error in
        }
    }

}
