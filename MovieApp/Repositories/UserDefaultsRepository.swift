//
//  UserDefaultsRepository.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

protocol UserDefaultsRepository {
    func getFavoriteMovies() -> [MovieModel]
    func savedToFavorite(movie: MovieModel)
    func removeFromFavorite(movie: MovieModel)
}

struct UserDefaultsRepositoryImpl: UserDefaultsRepository {
    
    func getFavoriteMovies() -> [MovieModel] {
        return UserDefaultStorage.favoriteMovies
    }
    
    func savedToFavorite(movie: MovieModel) {
        guard !UserDefaultStorage.favoriteMovies.contains(where: { $0.trackId == movie.trackId }) else {
            return
        }
        UserDefaultStorage.favoriteMovies.append(movie)
    }
    
    func removeFromFavorite(movie: MovieModel) {
        guard let index = UserDefaultStorage.favoriteMovies.firstIndex(where: { $0.trackId == movie.trackId }) else {
            return
        }
        UserDefaultStorage.favoriteMovies.remove(at: index)
    }
    
}
