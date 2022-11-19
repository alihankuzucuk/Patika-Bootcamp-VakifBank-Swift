//
//  MyCollectionViewCell.swift
//  ListComponents
//
//  Created by Alihan KUZUCUK on 19.11.2022.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    // Class & Views connected to the CollectionViewCell
    // Reuse Identifier given as ItemCollectionViewCell
    
    @IBOutlet private weak var lblName: UILabel!
    @IBOutlet private weak var lblCount: UILabel!
    
    func configure(model: ItemModel) {
        lblName.text = model.name
        lblCount.text = String(model.count)
    }
}
