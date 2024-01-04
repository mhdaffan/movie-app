//
//  NetworkConfig.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

import Foundation

protocol NetworkConfigurable {
    var baseURL: String { get }
    var headers: [String: String] { get set }
}

struct NetworkConfiguration: NetworkConfigurable {
    let baseURL: String
    var headers: [String: String]
    
    init(baseURL: String, headers: [String: String] = [:]) {
        self.baseURL = baseURL
        self.headers = headers
    }
}
