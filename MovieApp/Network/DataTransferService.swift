//
//  DataTransferService.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

import Foundation
import RxSwift

protocol DataTransferService {
    func request<T: Decodable>(with endpoint: DataEndpoint<T>) -> Observable<T>
}

class DataTransferServiceImpl: DataTransferService {
    
    var networkService: NetworkService = NetworkServiceImpl()
    
    func request<T: Decodable>(with endpoint: DataEndpoint<T>) -> Observable<T> {
        networkService.request(with: endpoint)
            .flatMap { data in
                if endpoint.useBaseResponse, let response = data.toObject(ResponseResult<T>.self) {
                    return Observable.just(response.results)
                }
                
                if let response = data.toObject(T.self) {
                    return Observable.just(response)
                }
                
                return Observable.error(APIError.parseError)
            }
    }
    
}
