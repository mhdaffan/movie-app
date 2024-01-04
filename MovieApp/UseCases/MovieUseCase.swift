//
//  MovieUseCase.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

import RxSwift

protocol MovieUseCase {
    func getMovies(keyword: String, country: String) -> Observable<MovieList>
}

struct MovieUseCaseImpl: MovieUseCase {
    
    @Injected(\.movieRepository) var repo
    
    func getMovies(keyword: String, country: String) -> Observable<MovieList> {
        return repo.getMovies(keyword: keyword, country: country).flatMap { movies in
            return Observable.just(MovieList(movies: movies))
        }
    }
    
}
