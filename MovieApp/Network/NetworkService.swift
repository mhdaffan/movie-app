//
//  NetworkService.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

import Foundation
import RxSwift

protocol NetworkService {
    func request(with endpoint: Requestable) -> Observable<Data>
}

class NetworkServiceImpl: NetworkService {
    
    @Injected(\.networkConfiguration) var networkConfig: NetworkConfigurable
    @Injected(\.networkSession) var session: NetworkSession
    
    func request(with endpoint: Requestable) -> Observable<Data> {
        do {
            let request = try endpoint.urlRequest(with: networkConfig)
            return session.loadData(from: request).flatMap { data, _ in
                if let data {
                    return Observable.just(data)
                } else {
                    return Observable.error(APIError.noData)
                }
            }
        } catch {
            return Observable.error(error)
        }
        
    }
    
}
