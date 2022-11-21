//
//  HistoryTableViewCell.swift
//  CryptoCo
//
//  Created by Alihan KUZUCUK on 21.11.2022.
//

import UIKit

final class HistoryTableViewCell: UITableViewCell {
    
    /**
     Views in HistoryTableViewCell are intertwined
     We want HistoryTableViewCell to arrange it as much as it needs
     When we want it to set it automatically;
     1- We need to give automatic dimension
     2- The constraints of our cell must be complete (from below, from above, from right and left)
     
     Consider that we don't constraint below. Labels will continue to grow but not cell
     Why because it won't have a cell related constraint
     
     Visit the relevant folder to see the implementation stages
     ../Documents/Week4/CryptoCo/SettingAutomaticDimension
     */

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
