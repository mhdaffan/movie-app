//
//  ExtensionListAdapter.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

import IGListKit

extension ListAdapter {
    
    func refreshVisibleControllers() {
        visibleSectionControllers().forEach {
            if let controller = $0 as? FavoriteMovieListSectionController {
                controller.adapter.reloadData()
            }
        }
    }
    
}
