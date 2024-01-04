//
//  MovieListSectionController.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

import IGListKit

final class MovieListSectionController: ListSectionController {
    
    private var cellModel: MovieList?
    weak var delegate: MoviesSectionDelegate?
    var loadMore: (() -> Void)?
    
    init(delegate: MoviesSectionDelegate?) {
        self.delegate = delegate
        super.init()
        inset = .init(top: 16, left: 0, bottom: 0, right: 0)
        minimumLineSpacing = 8
    }
    
    override func numberOfItems() -> Int {
        return cellModel?.movies.count ?? 0
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let movies = cellModel?.movies, let cell = collectionContext?.dequeueReusableCell(
            of: MovieItemCollectionViewCell.self,
            for: self,
            at: index) as? MovieItemCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.updateUI(movie: movies[index])
        cell.onTapLoveButton = { [weak self] loved in
            self?.delegate?.didSelectLove(item: movies[index], loved: loved)
        }
        return cell
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        return AppConstants.sizeRatio(67, 100, fromWidth: (AppConstants.screenWidth - 72) / 2)
    }
    
    override func didUpdate(to object: Any) {
        self.cellModel = object as? MovieList
    }
    
    override func didSelectItem(at index: Int) {
        guard let movies = cellModel?.movies else {
            return
        }
        delegate?.didSelectItem(item: movies[index])
    }
    
}
