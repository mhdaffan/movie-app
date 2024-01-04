//
//  BaseViewModel.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

import RxSwift

class BaseViewModel {
    var scheduler: ImmediateSchedulerType = MainScheduler.asyncInstance
    var disposeBag = DisposeBag()
    var stateSubject = PublishSubject<ScreenState>()
}
