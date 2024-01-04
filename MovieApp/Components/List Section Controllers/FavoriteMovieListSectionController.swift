//
//  FavoriteMovieListSectionController.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

import IGListKit

protocol MoviesSectionDelegate: AnyObject {
    func didSelectItem(item: MovieModel)
    func didSelectLove(item: MovieModel, loved: Bool)
}

final class FavoriteMovieListSectionController: ListSectionController {
    
    weak var delegate: MoviesSectionDelegate?
    
    private var cellModel: FavoriteMovieList?
    
    lazy private(set) var adapter: ListAdapter = {
        let adapter = ListAdapter(updater: ListAdapterUpdater(),
                                  viewController: self.viewController)
        adapter.dataSource = self
        return adapter
    }()
    
    init(delegate: MoviesSectionDelegate?) {
        self.delegate = delegate
        super.init()
        inset = .init(top: 16, left: 0, bottom: 0, right: 0)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCell(
            of: FavoriteMovieListCell.self,
            for: self,
            at: index) as? FavoriteMovieListCell else {
            return UICollectionViewCell()
        }
        adapter.collectionView = cell.collectionView
        
        return cell
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext?.containerSize.width ?? 200, height: 180)
    }
    
    override func didUpdate(to object: Any) {
        self.cellModel = object as? FavoriteMovieList
    }

}

extension FavoriteMovieListSectionController: ListAdapterDataSource {
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        guard let cellModel = cellModel else {
            return []
        }
        
        return [cellModel]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return FavoriteMovieItemListSectionController(delegate: delegate)
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
}
