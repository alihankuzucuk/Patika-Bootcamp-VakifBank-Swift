//
//  GetPopularMoviesResponseModel.swift
//  MovieMVVMArch
//
//  Created by Alihan KUZUCUK on 6.12.2022.
//

import Foundation

struct GetPopularMoviesResponseModel: Decodable {
    let results: [MovieModel]
}
