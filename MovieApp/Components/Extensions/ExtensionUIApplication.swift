//
//  ExtensionUIApplication.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

import UIKit

extension UIApplication {
    
    var keyWindow: UIWindow? {
        return self.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .first(where: { $0 is UIWindowScene })
            .flatMap({ $0 as? UIWindowScene })?.windows
            .first(where: \.isKeyWindow)
    }
    
}
