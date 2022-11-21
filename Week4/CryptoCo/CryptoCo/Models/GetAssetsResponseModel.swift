//
//  GetAssetsResponseModel.swift
//  CryptoCo
//
//  Created by Alihan KUZUCUK on 21.11.2022.
//

import Foundation

struct GetAssetsResponseModel: Codable {
    let success: Bool
    let message: String
    let result: [AssetModel]
}
