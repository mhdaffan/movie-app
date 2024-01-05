//
//  MovieDetailView.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

import UIKit
import SnapKit

final class MovieDetailView: UIStackView {
    
    // MARK: - Closures
    
    var onTapLoveButton: ((Bool) -> Void)?
    
    // MARK: - UI Properties
    let artworkImageView = UIImageView(image: UIImage(resource: .icEmpty)).then {
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFit
    }
    let titleLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.numberOfLines = 0
    }
    let descLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 12, weight: .medium)
        $0.numberOfLines = 0
    }
    let infoLabel = UILabel().then {
        $0.textColor = .darkGray
        $0.font = .systemFont(ofSize: 12, weight: .medium)
        $0.numberOfLines = 0
    }
    private(set) lazy var loveButton = UIButton().then {
        $0.setImage(.icHeartFill?.resize(to: CGSize(width: 20, height: 20))?.color(.darkGray), for: .normal)
        $0.setImage(.icHeartFill?.resize(to: CGSize(width: 20, height: 20))?.color(.red), for: .selected)
        $0.setTitle("Favorite", for: .normal)
        $0.setTitle("Favorite", for: .selected)
        $0.setTitleColor(.black, for: .normal)
        $0.setTitleColor(.black, for: .selected)
        $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.contentHorizontalAlignment = .leading
    }
    
    // MARK: - Initialized
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal Methods
    
    func configureUI() {
        axis = .vertical
        spacing = 8
        addArrangedSubview(artworkImageView)
        addArrangedSubview(titleLabel)
        addArrangedSubview(infoLabel)
        addArrangedSubview(loveButton)
        addArrangedSubview(descLabel)
        let size = AppConstants.sizeRatio(67, 100, fromWidth: AppConstants.screenWidth / 2)
        artworkImageView.snp.makeConstraints {
            $0.width.equalTo(size.width)
            $0.height.equalTo(size.height)
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
        titleLabel.text = movie.trackName
        descLabel.text = movie.longDescription
        infoLabel.text = "\(movie.artistName) • \(movie.primaryGenreName) • \(movie.price)"
        loveButton.isSelected = movie.loved
        artworkImageView.load(movie.artworkUrl, placeholder: .icEmpty, contentMode: .scaleAspectFit)
    }
    
}
