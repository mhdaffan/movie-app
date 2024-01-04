//
//  FavoriteMovieListCell.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

import UIKit
import SnapKit

class FavoriteMovieListCell: UICollectionViewCell {
    
    // MARK: - UI Properties
    
    lazy var flowLayout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
    }
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout).then {
        $0.backgroundColor = .white
        $0.showsHorizontalScrollIndicator = false
        $0.alwaysBounceVertical = false
        $0.alwaysBounceHorizontal = true
        $0.contentInset = .init(top: 10, left: 8, bottom: 10, right: 8)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        contentView.backgroundColor = .lightGray.withAlphaComponent(0.3)
        contentView.addSubviews(collectionView)
        collectionView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(5)
            $0.leading.trailing.equalToSuperview()
        }
    }
        
}
