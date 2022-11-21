//
//  HistoryTableViewCell.swift
//  CryptoCo
//
//  Created by Alihan KUZUCUK on 21.11.2022.
//

import UIKit

final class HistoryTableViewCell: UITableViewCell {

    @IBOutlet private weak var lblPrice: UILabel!
    @IBOutlet private weak var lblQuantity: UILabel!
    @IBOutlet private weak var lblTotal: UILabel!
    
    func configureCell(model: HistoryModel) {
        lblPrice.text = "Price: " + String(model.price)
        lblQuantity.text = "Quantity: " + String(model.quantity)
        lblTotal.text = "Total: " + String(model.total)
        decideBackgroundColor(type: model.orderType)
    }
    
    private func decideBackgroundColor(type: String) {
        if type == "SELL" {
            backgroundColor = .red
        } else {
            backgroundColor = .green
        }
    }
    
}
