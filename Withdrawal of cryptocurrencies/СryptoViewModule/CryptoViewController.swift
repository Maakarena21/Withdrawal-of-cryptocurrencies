//
//  CryptoViewController.swift
//  Withdrawal of cryptocurrencies
//
//  Created by Silence on 19.09.2021.
//

import UIKit


struct СurrencyInfo {
    let cryptocurrencies: [Cryptocurrency]
}

protocol CurrencyView: AnyObject {
    var currencyInfo: СurrencyInfo? { get set }
}

class CryptoViewController: UIViewController {

    var currencyInfo: СurrencyInfo? {
        didSet {
//            workerView.workersTableView.reloadData()
        }
    }

    var presenter: CryptoPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
//        workerView.workersTableView.delegate = self
//        workerView.workersTableView.dataSource = self
        presenter.viewLoaded()
    }
}

extension CryptoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyInfo?.cryptocurrencies.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == currencyInfo?.cryptocurrencies.count ?? 0 - 1 {
            presenter.scrollEnd()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: CryptoCell.id, for: indexPath) as! CryptoCell

//        cell.nameLabel.text = tableInfo?.workers[indexPath.row].name
//        cell.numberPhoneLabel.text = tableInfo?.workers[indexPath.row].phoneNumber
//        cell.talantLabel.text = tableInfo?.workers[indexPath.row].skills.joined(separator: ", ")

        return cell
    }
}

extension CryptoViewController: CurrencyView {
}

