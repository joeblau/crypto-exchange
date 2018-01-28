//
//  RequestBuilderTests.swift
//  CryptoExchange
//
//  Created by Joe Blau on 1/28/18.
//

import XCTest
@testable import CryptoExchange

class RequestBuilderTests: XCTestCase {

    let requestBuilderMock = RequestBuilder()

    func testHTTPMethods() {
        let getMock = HTTPMethod.get
        let postMock = HTTPMethod.post
        let putMock = HTTPMethod.put
        let deleteMock = HTTPMethod.delete
        let headMock = HTTPMethod.head

        XCTAssertEqual(String(describing: getMock), "GET")
        XCTAssertEqual(String(describing: postMock), "POST")
        XCTAssertEqual(String(describing: putMock), "PUT")
        XCTAssertEqual(String(describing: deleteMock), "DELETE")
        XCTAssertEqual(String(describing: headMock), "HEAD")
    }

    func testRequestEncodings() {
        let jsonMock = RequestEncoding.json
        let formMock = RequestEncoding.form
        let textHTMLMock = RequestEncoding.textHTML

        XCTAssertEqual(String(describing: jsonMock), "application/json; charset=utf-8; v=2")
        XCTAssertEqual(String(describing: formMock), "application/x-www-form-urlencoded; charset=utf-8; v=2")
        XCTAssertEqual(String(describing: textHTMLMock), "text/html")
    }

    func testRequestBuilder_build() {
        let urlComponentsMock = URLComponents(string: "https://www.crypostream.com")
        XCTAssertNoThrow(try requestBuilderMock.build(urlComponents: urlComponentsMock))
    }

    func testReqquestBuilder_build_withParams() {
        let urlComponentsMock = URLComponents(string: "https://www.crypostream.com")
        let postMock = HTTPMethod.post
        let jsonMock = RequestEncoding.json
        let queryItemsMock = [URLQueryItem(name: "ABC", value: "DEF")]
        XCTAssertNoThrow(try requestBuilderMock.build(urlComponents: urlComponentsMock,
                                                      httpMethod: postMock,
                                                      requestEncoding: jsonMock,
                                                      queryItems: queryItemsMock))
    }

    func testRequestBuilder_build_invalidURL() {
        let urlComponentsMock = URLComponents(string: "<>")
        XCTAssertThrowsError(try requestBuilderMock.build(urlComponents: urlComponentsMock))
    }

    func testRequestBuilder_execute() {
        let urlComponentsMock = URLComponents(string: "https://www.cryptostream.com")
        let urlRequestMock = try! requestBuilderMock.build(urlComponents: urlComponentsMock)

        let expectResponse = expectation(description: "successful response")

        let task = requestBuilderMock.execute(request: urlRequestMock, completion: { (data, response, error) in
            expectResponse.fulfill()
        })

        waitForExpectations(timeout: 5) { error in
            task.cancel()
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }

    func testRequestBuilder_execute_error() {
        let urlComponentsMock = URLComponents(string: "https://www.crypppptostream.com")
        let urlRequestMock = try! requestBuilderMock.build(urlComponents: urlComponentsMock)

        let expectResponse = expectation(description: "failed response")

        let task = requestBuilderMock.execute(request: urlRequestMock, completion: { (data, response, error) in
            expectResponse.fulfill()
        })

        waitForExpectations(timeout: 5) { error in
            task.cancel()
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }
}

