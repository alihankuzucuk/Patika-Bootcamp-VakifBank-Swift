//
//  SpellModel.swift
//  ServiceCall
//
//  Created by Alihan KUZUCUK on 20.11.2022.
//

import Foundation

struct SpellModel: Codable {
    let id: String?
    let name: String?
    let incantation: String?
    let effect: String?
    let canBeVerbal: Bool?
    let type: String?
    let light: String?
}
