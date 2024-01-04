//
//  HomeViewController.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

import UIKit
import RxSwift
import SnapKit

final class MovieViewController: BaseViewController {
    
    // MARK: - UI Properties
    
    private(set) lazy var searchController = UISearchController().then {
        $0.obscuresBackgroundDuringPresentation = false
        $0.hidesNavigationBarDuringPresentation = false
        $0.searchBar.placeholder = "Search"
        $0.searchBar.delegate = self
    }
    private lazy var flowLayout = UICollectionViewFlowLayout().then {
        $0.itemSize = AppConstants.sizeRatio(67, 100, fromWidth: (AppConstants.screenWidth - 72) / 2 )
        $0.scrollDirection = .vertical
        $0.minimumInteritemSpacing = 24
        $0.minimumLineSpacing = 24
    }
    private(set) lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout).then {
        $0.contentInset = .init(top: 0, left: 24, bottom: 0, right: 24)
        $0.backgroundColor = .white
        $0.dataSource = self
        $0.delegate = self
        $0.register(cell: MovieItemCollectionViewCell.self)
    }
    
    // MARK: Properties
    
    let viewModel: MovieViewModel
    
    // MARK: - Initialized
    
    init(viewModel: MovieViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Overidden Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        bindViewModel()
        viewModel.getMovies()
    }
    
    // MARK: - Internal Methods
    
    func configureUI() {
        view.backgroundColor = .white
        title = "Movies"
        navigationItem.searchController = searchController
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalTo(view)
        }
    }
    
    func bindViewModel() {
        disposeBag.insert(
            viewModel.stateSubject.subscribe(
                scheduler: scheduler,
                onNext: { [weak self] state in
                    switch state {
                    case .failed(let error):
                        print(error.localizedDescription)
                    case .loaded:
                        self?.collectionView.reloadData()
                    default:
                        break
                    }
                })
        )
    }
    
}

// MARK: - UISearchBarDelegate

extension MovieViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text, !text.isEmpty {
            searchBar.text = ""
            searchController.dismiss(animated: true)
        }
    }
}

// MARK: - UICollectionViewDelegate

extension MovieViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}

// MARK: - UICollectionViewDataSource

extension MovieViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.movies.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cell: MovieItemCollectionViewCell.self)
        cell.updateUI(movie: viewModel.movies.value[indexPath.row])
        
        return cell
    }
    
}

// MARK: - Static Methods

extension MovieViewController {
    
    static func build() -> MovieViewController {
        let viewModel = MovieViewModel()
        return MovieViewController(viewModel: viewModel)
    }
    
}
