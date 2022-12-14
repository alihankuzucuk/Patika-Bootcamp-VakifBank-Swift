//
//  HistoryModel.swift
//  CryptoCo
//
//  Created by Alihan KUZUCUK on 21.11.2022.
//

import Foundation

struct HistoryModel: Codable {
    let orderType: String
    let price: Double
    let quantity: Double
    let total: Double
    
    enum CodingKeys: String, CodingKey {
        case orderType = "OrderType"
        case price = "Price"
        case quantity = "Quantity"
        case total = "Total"
    }
}
