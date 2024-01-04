//
//  ExtensionUIImage.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

import UIKit

extension UIImage {
    
    func resize(to targetSize: CGSize) -> UIImage? {
        
        let size = self.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        var newSize: CGSize
        if (widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        let rect = CGRect(origin: .zero, size: newSize)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    func color(_ color: UIColor) -> UIImage? {
        return self.withTintColor(color, renderingMode: .alwaysOriginal)
    }
}
