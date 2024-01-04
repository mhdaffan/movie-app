//
//  ExtensionUIImageView+ImageLoader.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func load(_ urlString: String, placeholder: UIImage? = nil, contentMode: UIView.ContentMode = .scaleAspectFill) {
        var newUrl = urlString
        if let url = newUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            newUrl = url
        }
        
        let url = URL(string: newUrl)
        
        self.kf.setImage(with: url, placeholder: placeholder, options: [.transition(.fade(0.2))], completionHandler: { result in
            switch result {
            case .success(_):
                self.contentMode = contentMode
            case .failure(_):
                self.contentMode = .center
            }
        })
    }
    
}
