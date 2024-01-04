//
//  ExtensionData.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

import Foundation

extension Data {
    
    func toObject<T: Decodable>(_ object: T.Type) -> T? {
        return try? JSONDecoder().decode(object, from: self)
    }
    
}
