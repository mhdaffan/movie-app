//
//  Endpoint.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

import Foundation

class Endpoint: Requestable {
    var path: String
    var isFullPath: Bool = false
    var useBaseResponse: Bool = true
    var method: HTTPMethod = .get
    var queryParameters: [String: Any] = [:]
    var headerParamaters: [String: String] = [:]
    var bodyParamaters: [String : Any] = [:]
    
    init(path: String,
         isFullPath: Bool = false,
         useBaseResponse: Bool = true,
         method: HTTPMethod = .get,
         queryParameters: [String: Any] = [:],
         headerParamaters: [String: String] = [:],
         bodyParamaters: [String : Any] = [:]) {
        self.path = path
        self.isFullPath = isFullPath
        self.useBaseResponse = useBaseResponse
        self.method = method
        self.queryParameters = queryParameters
        self.headerParamaters = headerParamaters
        self.bodyParamaters = bodyParamaters
    }
}

final class DataEndpoint<T>: Endpoint {}
