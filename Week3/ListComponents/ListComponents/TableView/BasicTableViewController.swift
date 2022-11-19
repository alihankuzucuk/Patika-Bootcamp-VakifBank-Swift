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
    var itemsToShow: [ItemModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        itemsToShow.append(ItemModel(name: "Milk", count: 3))
        itemsToShow.append(ItemModel(name: "Water", count: 5))
        itemsToShow.append(ItemModel(name: "Cake", count: 10))
        
        items = itemsToShow
        
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.searchBar.placeholder = "Type something to search"
        navigationItem.searchController = search
    }

}

extension BasicTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        itemsToShow = items.filter({ $0.name == text })
        if text == "" {
            itemsToShow = items
        }
        tableView.reloadData()
    }
}

extension BasicTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell pressed")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itemsToShow.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell", for: indexPath)
        cell.textLabel?.text = itemsToShow[indexPath.row].name
        return cell
    }
}
