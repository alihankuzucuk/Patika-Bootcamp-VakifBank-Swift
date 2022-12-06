//
//  MovieDetailModel.swift
//  MovieMVVMArch
//
//  Created by Alihan KUZUCUK on 6.12.2022.
//

import Foundation

struct MovieDetailModel: Decodable {
    let title: String
    let poster: String
    let tagline: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case poster = "poster_path"
        case tagline
    }
}
