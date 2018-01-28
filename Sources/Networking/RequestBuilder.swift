//
//  RequestBuilder.swift
//  CryptoExchange
//
//  Created by Joe Blau on 1/27/18.
//

import Foundation

public protocol RequestBuildable {
    func build(urlComponents: URLComponents?,
               httpMethod: HTTPMethod,
               requestEncoding: RequestEncoding?,
               queryItems: [URLQueryItem]?) throws -> URLRequest

    func execute(request: URLRequest,
                 queue: DispatchQueue,
                 completion: ((_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void)?) -> URLSessionTask
}

public enum RequestError: Error {
    case invalidURL
}

public enum HTTPMethod: CustomStringConvertible {
    case get
    case put
    case post
    case head
    case delete

    public var description: String {
        switch self {
        case .get: return "GET"
        case .put: return "PUT"
        case .post: return "POST"
        case .head: return "HEAD"
        case .delete: return "DELETE"
        }
    }
}

public enum RequestEncoding: CustomStringConvertible {
    case json
    case form
    case textHTML

    public var description: String {
        switch self {
        case .json: return "application/json; charset=utf-8; v=2"
        case .form: return "application/x-www-form-urlencoded; charset=utf-8; v=2"
        case .textHTML: return "text/html"
        }
    }
}

public class RequestBuilder: RequestBuildable {
    private let urlSession = URLSession.shared
    private let timeoutInterval: TimeInterval = 10

    public func build(urlComponents: URLComponents?,
                      httpMethod: HTTPMethod = .get,
                      requestEncoding: RequestEncoding? = nil,
                      queryItems: [URLQueryItem]? = nil) throws -> URLRequest {
        var urlComponentsMutable = urlComponents
        urlComponentsMutable?.queryItems = queryItems
        guard let url = urlComponentsMutable?.url else { throw RequestError.invalidURL }

        var request = URLRequest(url: url,
                                 cachePolicy: .reloadIgnoringLocalCacheData,
                                 timeoutInterval: timeoutInterval)
        request.httpMethod = "\(httpMethod)"

        if let requestEncoding = requestEncoding {
            request.addValue("\(requestEncoding)", forHTTPHeaderField: "Content-Type")
        }
        request.httpShouldHandleCookies = false

        return request
    }

    public func execute(request: URLRequest,
                        queue: DispatchQueue = DispatchQueue.main,
                        completion: ((_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void)? = nil) -> URLSessionTask {
        let task = urlSession.dataTask(with: request) { data, response, error in
            queue.async {
                completion?(data, response, error)
            }
        }

        task.resume()
        return task
    }
}
