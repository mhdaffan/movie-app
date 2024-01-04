//
//  ExtensionObservableType.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

import RxSwift

extension ObservableType {
    
    func subscribe(scheduler: ImmediateSchedulerType, onNext: ((Element) -> Void)?, onError: ((Swift.Error) -> Void)? = nil) -> Disposable {
        return self.observe(on: scheduler).subscribe(onNext: onNext, onError: onError)
    }
    
}
