//
//  BaseViewController.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

import RxSwift

class BaseViewController: UIViewController {
    let disposeBag = DisposeBag()
    var scheduler: ImmediateSchedulerType = MainScheduler.asyncInstance
}
