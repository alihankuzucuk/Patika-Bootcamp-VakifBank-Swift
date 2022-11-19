//
//  BasicTableViewController.swift
//  ListComponents
//
//  Created by Alihan KUZUCUK on 19.11.2022.
//

import UIKit

class BasicTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var items: [ItemModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        items.append(ItemModel(name: "Milk", count: 3))
        items.append(ItemModel(name: "Water", count: 5))
        items.append(ItemModel(name: "Cake", count: 10))
    }

}

extension BasicTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell pressed")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row].name
        return cell
    }
    
}
