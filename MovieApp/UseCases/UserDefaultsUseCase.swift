//
//  UserDefaultsUseCase.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

protocol UserDefaultsUseCase {
    func getFavoriteMovies() -> [MovieModel]
    func savedToFavorite(movie: MovieModel)
    func removeFromFavorite(movie: MovieModel)
}

struct UserDefaultsUseCaseImpl: UserDefaultsUseCase {
    
    @Injected(\.userDefaultsRepository) var repo
    
    func getFavoriteMovies() -> [MovieModel] {
        return repo.getFavoriteMovies().map { movie in
            movie.loved = true
            return movie
        }
    }
    
    func savedToFavorite(movie: MovieModel) {
        repo.savedToFavorite(movie: movie)
    }
    
    func removeFromFavorite(movie: MovieModel) {
        repo.removeFromFavorite(movie: movie)
    }
    
}
