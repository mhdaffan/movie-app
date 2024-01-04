//
//  MovieViewModel.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

import RxSwift
import RxCocoa
import IGListKit

final class MovieViewModel: BaseViewModel {
    
    // MARK: - Injected
    
    @Injected(\.movieUseCase) var movieUseCase
    @Injected(\.userDefaultsUseCase) var userDefaultsUseCase
    
    // MARK: - Observables
    
    var data: [ListDiffable] = []
    var movieList = MovieList(movies: [])
    var favoriteMovieList = FavoriteMovieList(movies: [])
    
    // MARK: - Internal Methods
    
    func sortData() {
        data.removeAll()
        
        if !favoriteMovieList.movies.isEmpty {
            data.append(favoriteMovieList)
        }
        
        if !movieList.movies.isEmpty {
            data.append(movieList)
        }
        
        stateSubject.onNext(.loaded)
    }
    
    // MARK: - Network Calls
    
    func getMovies() {
        stateSubject.onNext(.loading)
        movieUseCase.getMovies(keyword: "star", country: "au").subscribe(
            scheduler: scheduler,
            onNext: { [weak self] response in
                self?.movieList = response
                self?.sortData()
            },
            onError: { [weak self] error in
                self?.stateSubject.onNext(.failed(error))
            })
        .disposed(by: disposeBag)
    }
    
    // MARK: - Local Data
    
    func savedToFavorite(movie: MovieModel) {
        userDefaultsUseCase.savedToFavorite(movie: movie)
        updateFavoriteMovies()
    }
    
    func removeFromFavorite(movie: MovieModel) {
        userDefaultsUseCase.removeFromFavorite(movie: movie)
        updateFavoriteMovies()
    }
    
    func updateFavoriteMovies() {
        self.favoriteMovieList.movies = userDefaultsUseCase.getFavoriteMovies()
        sortData()
    }
    
}
