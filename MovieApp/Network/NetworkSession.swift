//
//  NetworkSession.swift
//  MovieApp
//
//  Created by Muhammad Affan on 05/01/24.
//

import Foundation
import RxSwift

protocol NetworkSession {
    func loadData(from request: URLRequest) -> Observable<(Data?, URLResponse?)>
}

final class NetworkSessionImpl: NetworkSession {
    
    func loadData(from request: URLRequest) -> Observable<(Data?, URLResponse?)> {
        return Observable.create { observer in
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error {
                    observer.onError(error)
                } else {
                    observer.onNext((data, response))
                }
            }
            .resume()
            
            return Disposables.create()
        }
    }
    
}
