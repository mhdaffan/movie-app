//
//  BaseViewController.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

import RxSwift
import SnapKit

class BaseViewController: UIViewController {
    let disposeBag = DisposeBag()
    var scheduler: ImmediateSchedulerType = MainScheduler.asyncInstance
}

// MARK: - Loading Indicator

extension BaseViewController {
    
    func showLoadingIndicator() {
        guard view.viewWithTag(100001) == nil else {
            return
        }
        
        let indicator = UIActivityIndicatorView(style: .large).then {
            $0.startAnimating()
            $0.color = .black
            $0.tag = 100001
        }
        
        view.addSubview(indicator)
        indicator.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(200)
        }
    }
    
    func hideLoadingIndicator() {
        view.viewWithTag(100001)?.removeFromSuperview()
    }
    
    func loadingIndicator(isLoading: Bool) {
        isLoading ? showLoadingIndicator() : hideLoadingIndicator()
    }
    
}
