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
    @Injected(\.userDefaultsUseCase) var userDefaultsUseCase
    
    func getMovies(keyword: String, country: String) -> Observable<MovieList> {
        return repo.getMovies(keyword: keyword, country: country).flatMap { movies in
            let favoriteMovies = userDefaultsUseCase.getFavoriteMovies()
            let _movies = movies.map { movie in
                movie.loved = favoriteMovies.contains(where: { $0.trackId == movie.trackId})
                return movie
            }
            
            return Observable.just(MovieList(movies: _movies))
        }
    }
    
}
