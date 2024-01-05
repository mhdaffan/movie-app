//
//  MovieDetailViewController.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

import UIKit
import SnapKit

final class MovieDetailViewController: BaseViewController {
    
    // MARK: - UI Properties
    
    let detailView = MovieDetailView()
    let scrollView = UIScrollView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentInset = .init(top: 0, left: 24, bottom: 0, right: 24)
    }
    
    let viewModel: MovieDetailViewModel
    
    init(viewModel: MovieDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        updateUI()
        handleClosures()
    }
    
    func configureUI() {
        view.backgroundColor = .white
        title = "Detail"
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        scrollView.addSubview(detailView)
        detailView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(view).inset(24)
        }
    }
    
    func handleClosures() {
        detailView.onTapLoveButton = { [weak self] loved in
            guard let `self` else {
                return
            }
            if loved {
                self.viewModel.savedToFavorite(movie: self.viewModel.movie)
            } else {
                self.viewModel.removeFromFavorite(movie: self.viewModel.movie)
            }
        }
    }
    
    func updateUI() {
        detailView.updateUI(movie: viewModel.movie)
    }
    
}

extension MovieDetailViewController {
    
    static func build(movie: MovieModel) -> MovieDetailViewController {
        let viewModel = MovieDetailViewModel(movie: movie)
        let viewController = MovieDetailViewController(viewModel: viewModel)
        
        return viewController
    }
    
}
