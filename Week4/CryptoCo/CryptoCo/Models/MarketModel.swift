//
//  MarketModel.swift
//  CryptoCo
//
//  Created by Alihan KUZUCUK on 21.11.2022.
//

import Foundation

struct MarketModel: Codable {
    let marketName: String
    let marketAsset: String
    let baseAsset: String
    let marketAssetLong: String
    
    enum CodingKeys: String, CodingKey {
        case marketName = "MarketName"
        case marketAsset = "MarketAsset"
        case baseAsset = "BaseAsset"
        case marketAssetLong = "MarketAssetLong"
    }
}
