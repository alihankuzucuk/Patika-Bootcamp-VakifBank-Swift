//
//  MovieModel.swift
//  MovieMVVMArch
//
//  Created by Alihan KUZUCUK on 6.12.2022.
//

import Foundation

struct MovieModel: Decodable {
    let id: Int
    let title: String
    let poster: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case poster = "poster_path"
    }
}
