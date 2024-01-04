//
//  RepositoryInjectionKey.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

struct MovieRepositoryInjectionKey: InjectionKey {
    static var currentValue: MovieRepository = MovieRepositoryImpl()
}

extension InjectedValue {
    
    var movieRepository: MovieRepository {
        get { Self[MovieRepositoryInjectionKey.self] }
        set { Self[MovieRepositoryInjectionKey.self] = newValue }
    }
}
