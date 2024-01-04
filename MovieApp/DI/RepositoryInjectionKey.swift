//
//  RepositoryInjectionKey.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

struct MovieRepositoryInjectionKey: InjectionKey {
    static var currentValue: MovieRepository = MovieRepositoryImpl()
}

struct UserDefaultsRepositoryInjectionKey: InjectionKey {
    static var currentValue: UserDefaultsRepository = UserDefaultsRepositoryImpl()
}

extension InjectedValue {
    
    var movieRepository: MovieRepository {
        get { Self[MovieRepositoryInjectionKey.self] }
        set { Self[MovieRepositoryInjectionKey.self] = newValue }
    }
    
    var userDefaultsRepository: UserDefaultsRepository {
        get { Self[UserDefaultsRepositoryInjectionKey.self] }
        set { Self[UserDefaultsRepositoryInjectionKey.self] = newValue }
    }
}
