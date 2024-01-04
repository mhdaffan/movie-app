//
//  BaseViewModel.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

import RxSwift

class BaseViewModel {
    var disposeBag = DisposeBag()
    var stateSubject = PublishSubject<ScreenState>()
}
