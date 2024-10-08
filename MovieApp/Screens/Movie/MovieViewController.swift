//
//  HomeViewController.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

import UIKit
import RxSwift
import SnapKit
import IGListKit

final class MovieViewController: BaseViewController {
    
    // MARK: - UI Properties
    
    private(set) lazy var searchController = UISearchController().then {
        $0.searchBar.placeholder = "Search"
        $0.searchBar.delegate = self
    }
    lazy private(set) var adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    private lazy var flowLayout = UICollectionViewFlowLayout().then {
        $0.minimumLineSpacing = 24
    }
    private(set) lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout).then {
        $0.contentInset = .init(top: 0, left: 24, bottom: 0, right: 24)
        $0.backgroundColor = .white
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.updateFavoriteMovies()
        viewModel.validateMovieList()
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
        adapter.collectionView = collectionView
        adapter.dataSource = self
    }
    
    func bindViewModel() {
        disposeBag.insert(
            viewModel.stateSubject.subscribe(
                scheduler: scheduler,
                onNext: { [weak self] state in
                    self?.loadingIndicator(isLoading: state.isLoading())
                    switch state {
                    case .failed(let error):
                        print(error.localizedDescription)
                    case .loaded:
                        self?.adapter.reloadData()
                    default:
                        break
                    }
                }),
            viewModel.keyword
                .debounce(.milliseconds(500), scheduler: MainScheduler.asyncInstance)
                .subscribe(
                    scheduler: scheduler,
                    onNext: { [weak self] keyword in
                        self?.viewModel.search(keyword: keyword)
                    })
        )
    }
    
}

// MARK: - UISearchBarDelegate

extension MovieViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.keyword.accept(searchText)
    }
}

// MARK: - ListAdapterDataSource

extension MovieViewController: ListAdapterDataSource {
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return viewModel.data
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        switch object {
        case is MovieList:
            return MovieListSectionController(delegate: self)
        case is FavoriteMovieList:
            return FavoriteMovieListSectionController(delegate: self)
        default:
            return ListSectionController()
        }
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
}

// MARK: - MoviesSectionDelegate

extension MovieViewController: MoviesSectionDelegate {
    
    func didSelectItem(item: MovieModel) {
        navigationController?.pushViewController(MovieDetailViewController.build(movie: item), animated: true)
    }
    
    func didSelectLove(item: MovieModel, loved: Bool) {
        if loved {
            viewModel.savedToFavorite(movie: item)
        } else {
            viewModel.removeFromFavorite(movie: item)
        }
    }
    
}

// MARK: - Static Methods

extension MovieViewController {
    
    static func build() -> MovieViewController {
        let viewModel = MovieViewModel()
        return MovieViewController(viewModel: viewModel)
    }
    
}
