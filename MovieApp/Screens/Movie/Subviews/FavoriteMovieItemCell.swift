//
//  FavoriteMovieItemCell.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

import UIKit
import SnapKit

final class FavoriteMovieItemCell: UICollectionViewCell {
    
    // MARK: - UI Properties
    
    let artworkImageView = UIImageView(image: UIImage(resource: .icEmpty)).then {
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFit
        $0.layer.borderColor = UIColor.blue.withAlphaComponent(0.5).cgColor
        $0.layer.borderWidth = 2
    }
    
    // MARK: - Initialized
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        artworkImageView.image = UIImage(resource: .icEmpty)
    }
    
    // MARK: - Internal Methods
    
    func configureUI() {
        contentView.backgroundColor = .white
        contentView.addSubview(artworkImageView)
        artworkImageView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func updateUI(movie: MovieModel) {
        let url = movie.artworkUrl100.orEmpty.replacingOccurrences(of: "100x100", with: "500x500")
        artworkImageView.load(url, placeholder: UIImage(resource: .icEmpty))
    }
    
}

