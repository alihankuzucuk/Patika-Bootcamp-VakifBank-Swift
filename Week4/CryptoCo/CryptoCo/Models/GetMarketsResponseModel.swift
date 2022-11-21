//
//  GetMarketsResponseModel.swift
//  CryptoCo
//
//  Created by Alihan KUZUCUK on 21.11.2022.
//

import Foundation

struct GetMarketsResponseModel: Codable {
    let success: Bool
    let message: String
    let result: [MarketModel]
}
