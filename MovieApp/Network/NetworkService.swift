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

    func request(with endpoint: Requestable) -> Observable<Data> {
        do {
            let request = try endpoint.urlRequest(with: networkConfig)
            return Observable.create({ observer in
                URLSession.shared.dataTask(with: request) { data, _, error in
                    if let error = error {
                        observer.onError(error)
                    }
                    
                    guard let data = data else {
                        observer.onError(APIError.noData)
                        return
                    }
                    
                    observer.onNext(data)
                }.resume()
                
                return Disposables.create()
            })
        } catch {
            return Observable.error(error)
        }
        
    }
    
}
