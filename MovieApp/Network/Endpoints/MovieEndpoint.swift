//
//  MovieEndpoint.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

struct MovieEndpoint {
    
    static func searchMovies(keyword: String, country: String) -> DataEndpoint<[MovieModel]> {
        return DataEndpoint(
            path: "/search",
            method: .get,
            queryParameters: [
                "term": keyword,
                "country": country,
                "media": "movie"
            ]
        )
    }
    
}
