//
//  UseCaseInjectionKey.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

struct MovieUseCaseInjectionKey: InjectionKey {
    static var currentValue: MovieUseCase = MovieUseCaseImpl()
}

struct UserDefaultsUseCaseInjectionKey: InjectionKey {
    static var currentValue: UserDefaultsUseCase = UserDefaultsUseCaseImpl()
}

extension InjectedValue {
    
    var movieUseCase: MovieUseCase {
        get { Self[MovieUseCaseInjectionKey.self] }
        set { Self[MovieUseCaseInjectionKey.self] = newValue }
    }
    
    var userDefaultsUseCase: UserDefaultsUseCase {
        get { Self[UserDefaultsUseCaseInjectionKey.self] }
        set { Self[UserDefaultsUseCaseInjectionKey.self] = newValue }
    }
    
}
