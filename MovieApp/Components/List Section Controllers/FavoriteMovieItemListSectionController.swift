//
//  FavoriteMovieItemListSectionController.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

import IGListKit

final class FavoriteMovieItemListSectionController: ListSectionController {
    
    private var cellModel: FavoriteMovieList?
    weak var delegate: MoviesSectionDelegate?
    var loadMore: (() -> Void)?
    
    init(delegate: MoviesSectionDelegate?) {
        self.delegate = delegate
        super.init()
        minimumLineSpacing = 8
    }
    
    override func numberOfItems() -> Int {
        return cellModel?.movies.count ?? 0
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let movies = cellModel?.movies, let cell = collectionContext?.dequeueReusableCell(
            of: FavoriteMovieItemCell.self,
            for: self,
            at: index) as? FavoriteMovieItemCell else {
            return UICollectionViewCell()
        }
        
        cell.updateUI(movie: movies[index])
        return cell
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: 100.5, height: 150)
    }
    
    override func didUpdate(to object: Any) {
        self.cellModel = object as? FavoriteMovieList
    }
    
    override func didSelectItem(at index: Int) {
        guard let movies = cellModel?.movies else {
            return
        }
        delegate?.didSelectItem(item: movies[index])
    }
    
}
