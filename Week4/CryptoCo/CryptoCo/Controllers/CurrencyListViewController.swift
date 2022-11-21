//
//  CurrencyListViewController.swift
//  CryptoCo
//
//  Created by Alihan KUZUCUK on 21.11.2022.
//

import UIKit

final class CurrencyListViewController: BaseViewController {

    // MARK: - Outlets
    @IBOutlet private weak var tableViewAssets: UITableView!
    
    // MARK: - Properties
    private var assets: [AssetModel]? {
        didSet {
            tableViewAssets.reloadData()
        }
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        indicator.startAnimating()
        Client.getAssets { [weak self] assets, error in
            /**
             [weak self] is a capture list here
             We added this capture list so that self reference does not prevent the clearing memory at any time
             */
            guard let self = self else { return }
            self.indicator.stopAnimating()
            self.assets = assets
        }
    }
    
    // MARK: - Methods
    private func configureTableView() {
        tableViewAssets.dataSource = self
        tableViewAssets.register(UINib(nibName: "CurrencyTableViewCell", bundle: nil), forCellReuseIdentifier: "CurrencyCell")
    }

}

extension CurrencyListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        assets?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell", for: indexPath) as? CurrencyTableViewCell,
              let model = assets?[indexPath.row]
        else {
            return UITableViewCell()
        }
        cell.configureCell(model: model)
        return cell
    }
    
}
