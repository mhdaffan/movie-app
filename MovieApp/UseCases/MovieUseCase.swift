//
//  MovieUseCase.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

import RxSwift

protocol MovieUseCase {
    func getMovies(keyword: String, country: String) -> Observable<[MovieModel]>
}

struct MovieUseCaseImpl: MovieUseCase {
    
    @Injected(\.movieRepository) var repo
    
    func getMovies(keyword: String, country: String) -> Observable<[MovieModel]> {
        return repo.getMovies(keyword: keyword, country: country)
    }
    
}
