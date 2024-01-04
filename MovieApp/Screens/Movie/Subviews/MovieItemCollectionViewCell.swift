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
        contentView.addSubviews(artworkImageView, loveButton)
        artworkImageView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
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
        let url = movie.artworkUrl100.orEmpty.replacingOccurrences(of: "100x100", with: "500x500")
        artworkImageView.load(url, placeholder: UIImage(resource: .icEmpty))
        loveButton.isSelected = movie.loved
    }
    
}
