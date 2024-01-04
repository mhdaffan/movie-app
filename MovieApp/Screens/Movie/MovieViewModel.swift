//
//  MovieViewModel.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

import RxSwift
import RxCocoa

final class MovieViewModel: BaseViewModel {
    
    // MARK: - Injected
    
    @Injected(\.movieUseCase) var movieUseCase
    
    // MARK: - Observables
    
    var movies = BehaviorRelay<[MovieModel]>(value: [])
    
    // MARK: - Network Calls
    
    func getMovies() {
        stateSubject.onNext(.loading)
        movieUseCase.getMovies(keyword: "star", country: "au").subscribe(
            scheduler: scheduler,
            onNext: { [weak self] response in
                self?.movies.accept(response)
                self?.stateSubject.onNext(.loaded)
            },
            onError: { [weak self] error in
                self?.stateSubject.onNext(.failed(error))
            })
        .disposed(by: disposeBag)
    }
    
}
