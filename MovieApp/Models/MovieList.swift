//
//  MovieList.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

import Foundation

class MovieList: NSObject {
    var movies: [MovieModel]
    
    init(movies: [MovieModel]) {
        self.movies = movies
    }
}
