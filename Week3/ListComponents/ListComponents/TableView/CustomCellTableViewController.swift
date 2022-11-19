//
//  CustomCellTableViewController.swift
//  ListComponents
//
//  Created by Alihan KUZUCUK on 19.11.2022.
//

import UIKit

class CustomCellTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var items: [ItemModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        items.append(ItemModel(name: "Pencil", count: 1))
        items.append(ItemModel(name: "Eraser", count: 2))
        items.append(ItemModel(name: "Pen", count: 3))
        items.append(ItemModel(name: "Notbook", count: 4))
        
        tableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemCell")
        // If you specify nil, this method looks for the nib file in the main bundle
    }
}

extension CustomCellTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row selected \(items[indexPath.row])")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as? ItemTableViewCell else {
            // If we register more than one TableViewCell, we can check with guard let to ensure it is ItemTableViewCell
            return UITableViewCell() // It will return empty UITableViewCell
        }
        cell.lblName.text = items[indexPath.row].name
        cell.lblCount.text = String(items[indexPath.row].count)
        return cell
    }
}
