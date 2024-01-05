//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

import RxSwift

final class MovieDetailViewModel: BaseViewModel {
    
    init(movie: MovieModel) {
        self.movie = movie
    }
    
    // MARK: - Injected
    
    @Injected(\.userDefaultsUseCase) var userDefaultsUseCase
    
    // MARK: - Internal Properties
    
    var movie: MovieModel
    
    // MARK: - Local Data
    
    func savedToFavorite(movie: MovieModel) {
        userDefaultsUseCase.savedToFavorite(movie: movie)
    }
    
    func removeFromFavorite(movie: MovieModel) {
        userDefaultsUseCase.removeFromFavorite(movie: movie)
        
    }
    
}
