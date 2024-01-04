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
        guard !favoriteMovieList.movies.contains(where: { $0.trackId == movie.trackId }) else {
            return
        }
        favoriteMovieList.movies.append(movie)
        sortData()
    }
    
    func removeFromFavorite(movie: MovieModel) {
        guard let index = favoriteMovieList.movies.firstIndex(of: movie) else {
            return
        }
        favoriteMovieList.movies.remove(at: index)
        sortData()
    }
    
}
