//
//  MarketTableViewCell.swift
//  CryptoCo
//
//  Created by Alihan KUZUCUK on 21.11.2022.
//

import UIKit

final class MarketTableViewCell: UITableViewCell {

    @IBOutlet private weak var lblName: UILabel!
    @IBOutlet private weak var lblAsset: UILabel!
    @IBOutlet private weak var lblAssetLong: UILabel!
    
    func configureCell(model: MarketModel) {
        lblName.text = model.marketName
        lblAsset.text = model.marketAsset
        lblAssetLong.text = model.marketAssetLong
    }
    
}
