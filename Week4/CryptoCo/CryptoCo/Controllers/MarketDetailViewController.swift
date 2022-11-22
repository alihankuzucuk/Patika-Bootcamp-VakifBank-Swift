//
//  MarketDetailViewController.swift
//  CryptoCo
//
//  Created by Alihan KUZUCUK on 21.11.2022.
//

import UIKit

final class MarketDetailViewController: BaseViewController {
    
    @IBOutlet private weak var lblMarketTitle: UILabel!
    @IBOutlet private weak var tableViewHistory: UITableView! {
        didSet {
            tableViewHistory.dataSource = self
            tableViewHistory.delegate = self
            tableViewHistory.register(UINib(nibName: "HistoryTableViewCell", bundle: nil), forCellReuseIdentifier: "HistoryCell")
            tableViewHistory.estimatedRowHeight = UITableView.automaticDimension // It is needed for automatic dimension
        }
    }
    
    var selectedMarket: MarketModel?
    private var historyOrders: [HistoryModel]? {
        didSet {
            tableViewHistory.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let market = selectedMarket else { return }
        lblMarketTitle.text = market.marketName
        indicator.startAnimating()
        
        Client.getMarketHistory(market: market.marketName) { [weak self] history, error in
            guard let self = self else { return }
            self.indicator.stopAnimating()
            
            if let error = error {
                self.showAlertView(message: error.localizedDescription) {
                    self.navigationController?.popViewController(animated: true)
                }
                return
            }
            if history?.isEmpty ?? true {
                self.showAlertView(message: "No History") {
                    self.navigationController?.popViewController(animated: true)
                }
                return
            }
            
            self.historyOrders = history
        }
    }

}

extension MarketDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        historyOrders?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath) as? HistoryTableViewCell,
              let model = historyOrders?[indexPath.row]
        else {
            return UITableViewCell()
        }
        cell.configureCell(model: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
}
