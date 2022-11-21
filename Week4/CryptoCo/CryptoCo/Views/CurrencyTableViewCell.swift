//
//  CurrencyTableViewCell.swift
//  CryptoCo
//
//  Created by Alihan KUZUCUK on 21.11.2022.
//

import UIKit

final class CurrencyTableViewCell: UITableViewCell {

    @IBOutlet private weak var lblName: UILabel!
    @IBOutlet private weak var lblSymbol: UILabel!
    
    func configureCell(model: AssetModel) {
        lblName.text = model.assetLong
        lblSymbol.text = model.asset
    }
    
}
