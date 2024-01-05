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
    
    var keyword = BehaviorRelay<String>(value: "")
    var data: [ListDiffable] = []
    var movieList = MovieList(movies: [])
    var favoriteMovieList = FavoriteMovieList(movies: [])
    
    var filteredData: [ListDiffable] = []
    var filteredMovieList = MovieList(movies: [])
    var filteredFavoriteMovieList = FavoriteMovieList(movies: [])
    
    // MARK: - Internal Methods
    
    func sortData() {
        data.removeAll()
        
        if keyword.value.isEmpty {
            sortRealData()
        } else {
            sortFilteredData()
        }
        
        stateSubject.onNext(.loaded)
    }
    
    func sortRealData() {
        if !favoriteMovieList.movies.isEmpty {
            data.append(favoriteMovieList)
        }
        if !movieList.movies.isEmpty {
            data.append(movieList)
        }
    }
    
    func sortFilteredData() {
        if !filteredFavoriteMovieList.movies.isEmpty {
            data.append(filteredFavoriteMovieList)
        }
        if !filteredMovieList.movies.isEmpty {
            data.append(filteredMovieList)
        }
    }
    
    // update movie's loved status if needed
    func validateMovieList() {
        let favoriteMovies = userDefaultsUseCase.getFavoriteMovies()
        movieList.movies = movieList.movies.map { movie in
            movie.loved = favoriteMovies.contains(where: { $0.trackId == movie.trackId})
            return movie
        }
        sortData()
    }
    
    func search(keyword: String) {
        filteredMovieList.movies = movieList.movies.filter { $0.trackName.contains(keyword) }
        filteredFavoriteMovieList.movies = favoriteMovieList.movies.filter { $0.trackName.contains(keyword) }
        sortData()
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
        movieList.movies.first(where: { $0.trackId == movie.trackId })?.loved = true
        updateFavoriteMovies()
    }
    
    func removeFromFavorite(movie: MovieModel) {
        userDefaultsUseCase.removeFromFavorite(movie: movie)
        movieList.movies.first(where: { $0.trackId == movie.trackId })?.loved = false
        updateFavoriteMovies()
    }
    
    func updateFavoriteMovies() {
        self.favoriteMovieList.movies = userDefaultsUseCase.getFavoriteMovies()
        sortData()
    }
    
}
