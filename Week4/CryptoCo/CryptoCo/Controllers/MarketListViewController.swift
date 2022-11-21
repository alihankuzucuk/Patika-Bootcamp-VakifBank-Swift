//
//  MarketListViewController.swift
//  CryptoCo
//
//  Created by Alihan KUZUCUK on 21.11.2022.
//

import UIKit

final class MarketListViewController: UIViewController {

    @IBOutlet weak var tableViewMarkets: UITableView! {
        didSet {
            tableViewMarkets.dataSource = self
            tableViewMarkets.delegate = self
            tableViewMarkets.register(UINib(nibName: "MarketTableViewCell", bundle: nil), forCellReuseIdentifier: "MarketCell")
        }
    }
    
    private var markets: [MarketModel]? {
        didSet {
            tableViewMarkets.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Client.getMarkets { [weak self] markets, error in
            guard let self = self else { return }
            self.markets = markets
        }
    }

}

extension MarketListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        markets?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MarketCell", for: indexPath) as? MarketTableViewCell,
              let model = markets?[indexPath.row]
        else {
            return UITableViewCell()
        }
        cell.configureCell(model: model)
        return cell
    }
    
}
