//
//  MovieModel.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

import Foundation

class MovieModel: NSObject, Codable {
    let trackId: Int
    let artistName: String
    let trackName: String
    let artworkUrl100: String?
    let longDescription: String
    let currency: String
    let primaryGenreName: String
    let trackPrice: Double
    
    var loved: Bool = false
    var price: String {
        return "\(currency) \(trackPrice)"
    }
    var artworkUrl: String {
        return artworkUrl100.orEmpty.replacingOccurrences(of: "100x100", with: "500x500")
    }
    
    enum CodingKeys: String, CodingKey {
        case trackId, artistName, trackName, artworkUrl100, longDescription, currency, primaryGenreName, trackPrice
    }
}
