//
//  NetworkSessionMockImpl.swift
//  MovieAppTests
//
//  Created by Muhammad Affan on 05/01/24.
//

import XCTest
import RxSwift
@testable import MovieApp

final class NetworkSessionMockImpl: NetworkSession {
    
    var data: Data?
    var httpResponse: HTTPURLResponse?
    var error: Error?
    
    func loadData(from request: URLRequest) -> Observable<(Data?, URLResponse?)> {
        if let error {
            return Observable.error(error)
        } else {
            return Observable.just((data, httpResponse))
        }
    }
    
}
