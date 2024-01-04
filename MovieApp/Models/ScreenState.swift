//
//  ScreenState.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

enum ScreenState {
    case none
    case loading
    case failed(Error)
    case loaded
    
    func isLoading() -> Bool {
        switch self {
        case .loading:
            return true
        default:
            return false
        }
    }
}
