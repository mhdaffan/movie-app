//
//  ExtensionUIView.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
    
}
