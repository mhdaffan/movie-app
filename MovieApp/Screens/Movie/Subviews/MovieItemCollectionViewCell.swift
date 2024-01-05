//
//  MovieItemCollectionViewCell.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

import UIKit
import SnapKit

final class MovieItemCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Delegates
    
    var onTapLoveButton: ((Bool) -> Void)?
    
    // MARK: - UI Properties
    
    let artworkImageView = UIImageView(image: UIImage(resource: .icEmpty)).then {
        $0.layer.cornerRadius = 5
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFit
    }
    let titleLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 14, weight: .bold)
        $0.numberOfLines = 1
    }
    let genreLabel = UILabel().then {
        $0.textColor = .darkGray
        $0.font = .systemFont(ofSize: 12, weight: .semibold)
        $0.numberOfLines = 1
    }
    let priceLabel = UILabel().then {
        $0.textColor = .darkGray
        $0.font = .systemFont(ofSize: 12, weight: .medium)
        $0.numberOfLines = 1
    }
    private(set) lazy var loveButton = UIButton().then {
        $0.setImage(.icHeartFill?.resize(to: CGSize(width: 30, height: 30))?.color(.darkGray), for: .normal)
        $0.setImage(.icHeartFill?.resize(to: CGSize(width: 30, height: 30))?.color(.red), for: .selected)
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
        contentView.addSubviews(artworkImageView, loveButton, titleLabel, genreLabel, priceLabel)
        let size = AppConstants.movieSize
        artworkImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.width.equalTo(size.width)
            $0.height.equalTo(size.height)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(artworkImageView.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview()
        }
        genreLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(genreLabel.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        loveButton.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.top.trailing.equalToSuperview().inset(2)
            $0.width.height.equalTo(40)
        }
        loveButton.addAction(UIAction(handler: { [weak self] _ in
            self?.tapLoveButton()
        }), for: .primaryActionTriggered)
    }
    
    func tapLoveButton() {
        loveButton.isSelected.toggle()
        onTapLoveButton?(loveButton.isSelected)
    }
    
    func updateUI(movie: MovieModel) {
        artworkImageView.load(movie.artworkUrl, placeholder: UIImage(resource: .icEmpty))
        loveButton.isSelected = movie.loved
        titleLabel.text = movie.trackName
        genreLabel.text = movie.primaryGenreName
        priceLabel.text = movie.price
    }
    
}
