//
//  UserDefaultStorage.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

import Foundation

enum UserDefaultsKey: String {
    case favoriteMovies
}

struct UserDefaultStorage {
    
    @UserDefaultObject(.favoriteMovies, defaultValue: [])
    static var favoriteMovies: [MovieModel]
    
}
