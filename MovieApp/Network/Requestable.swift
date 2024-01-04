//
//  Requestable.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

import Foundation

enum HTTPMethod: String {
    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
    case delete  = "DELETE"
}

protocol Requestable {
    var path: String { get }
    var isFullPath: Bool { get }
    var method: HTTPMethod { get }
    var queryParameters: [String: Any] { get }
    var headerParamaters: [String: String] { get }
    var bodyParamaters: [String: Any] { get }
    func urlRequest(with networkConfig: NetworkConfigurable) throws -> URLRequest
}

extension Requestable {
    
    func configureUrl(with config: NetworkConfigurable) throws -> URL {
        let endpoint = isFullPath ? path : config.baseURL.appending(path)
        
        guard var urlComponents = URLComponents(string: endpoint) else {
            throw APIError.badURL
        }
        
        var urlQueryItems = [URLQueryItem]()
        
        queryParameters.forEach {
            urlQueryItems.append(URLQueryItem(name: $0.key, value: "\($0.value)"))
        }
        urlComponents.queryItems = !urlQueryItems.isEmpty ? urlQueryItems : nil
        
        guard let url = urlComponents.url else {
            throw APIError.badURL
        }
        
        return url
    }
    
    func urlRequest(with config: NetworkConfigurable) throws -> URLRequest {
        let url = try self.configureUrl(with: config)
        var urlRequest = URLRequest(url: url)
        var allHeaders: [String: String] = config.headers
        headerParamaters.forEach({ allHeaders.updateValue($1, forKey: $0) })
        
        if !bodyParamaters.isEmpty {
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: bodyParamaters, options: .prettyPrinted)
        }
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = allHeaders
        
        return urlRequest
    }
    
}
