//
//  APIError.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

import Foundation

struct APIError {
    static var noData = createError(code: NSURLErrorResourceUnavailable, description: "Data not found")
    static var parseError = createError(code: NSURLErrorCannotParseResponse, description: "Unable to parse data")
    static var noConnection = createError(code: NSURLErrorNotConnectedToInternet, description: "No internet connection")
    static var badURL = createError(code: NSURLErrorBadURL, description: "Bad URL")
    
    static func createError(code: Int, description: String) -> Error {
        return NSError(domain: "", code: code, userInfo: [NSLocalizedDescriptionKey: description])
    }
}
