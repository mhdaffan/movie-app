//
//  ExtensionNSObject.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

import IGListKit

extension NSObject: ListDiffable {
    
    public func diffIdentifier() -> NSObjectProtocol {
        return self
    }
    
    public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return isEqual(object)
    }
    
}
