//
//  MovieRepository.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

import RxSwift

protocol MovieRepository {
    func getMovies(keyword: String, country: String) -> Observable<[MovieModel]>
}

struct MovieRepositoryImpl: MovieRepository {
    
    @Injected(\.dataTransferService) var service
    
    func getMovies(keyword: String, country: String) -> Observable<[MovieModel]> {
        return service.request(with: MovieEndpoint.searchMovies(keyword: keyword, country: country))
    }
    
}
