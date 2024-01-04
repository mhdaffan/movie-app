//
//  MovieViewModel.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

import RxSwift
import RxCocoa

final class MovieViewModel: BaseViewModel {
    
    var movies = BehaviorRelay<[MovieModel]>(value: [])
    
    func getMovies() {
        stateSubject.onNext(.loading)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.movies.accept(MovieModel.mock())
            self.stateSubject.onNext(.loaded)
        })
    }
    
}
