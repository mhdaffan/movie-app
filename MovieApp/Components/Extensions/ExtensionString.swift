//
//  ExtensionString.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

import Foundation

extension String {
    
    func toJsonData() -> Data {
        return Data(self.utf8)
    }
    
}

extension Optional where Wrapped == String {
    
    var orEmpty: String {
        return self ?? ""
    }
    
}
