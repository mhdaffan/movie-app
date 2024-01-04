//
//  AppConstants.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

import UIKit

struct AppConstants {
    
    static var screenWidth: CGFloat {
        return UIScreen.main.bounds.size.width
    }

    static var screenHeight: CGFloat {
        return UIScreen.main.bounds.size.height
    }
    
    static func sizeRatio(_ width: CGFloat, _ height: CGFloat, fromWidth: CGFloat) -> CGSize {
        let height = (height / width) * fromWidth
        return CGSize(width: fromWidth, height: height)
    }
    
}
