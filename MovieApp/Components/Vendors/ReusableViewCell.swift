//
//  ReusableViewCell.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

import UIKit

public protocol ReusableViewCell: AnyObject {
    static var cellIdentifier: String { get }
}

public extension ReusableViewCell {
    static var cellIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: ReusableViewCell {}

extension UICollectionView {
    
    final func register<T: UICollectionViewCell>(cell: T.Type) where T: ReusableViewCell {
        self.register(T.self, forCellWithReuseIdentifier: cell.cellIdentifier)
    }
    
    final func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath, cell: T.Type = T.self) -> T where T: ReusableViewCell {
        guard let reusableCell = self.dequeueReusableCell(withReuseIdentifier: cell.cellIdentifier, for: indexPath) as? T else {
            fatalError("Failed to dequeue cell with identifier \(cell.cellIdentifier) matching type \(cell.self)")
        }
        
        return reusableCell
    }
    
}
