//
//  ResponseResult.swift
//  MovieApp
//
//  Created by Muhammad Affan on 04/01/24.
//

struct ResponseResult<T: Decodable>: Decodable {
    var results: T
}
