//
//  CryptoViewController.swift
//  Withdrawal of cryptocurrencies
//
//  Created by Silence on 19.09.2021.
//

import UIKit
import Kingfisher
import Combine

struct СurrencyInfo: Equatable {
    var cryptocurrencies: [CellState]
}

protocol CurrencyView: AnyObject {
    var currencyInfo: СurrencyInfo? { get set }
}

class CryptoViewController: UIViewController {

    @Published var currencyInfo: СurrencyInfo?
    var token: AnyCancellable?
    
    var presenter: CryptoPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cryptoTableView.delegate = self
        cryptoTableView.dataSource = self
        presenter.viewLoaded()
        configurate()
        
        token = $currencyInfo.receive(on: DispatchQueue.main).sink(receiveValue: {_ in
            self.cryptoTableView.reloadData()
        })
        
        
    }
    
    private lazy var cryptoTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CryptoCell.self, forCellReuseIdentifier: CryptoCell.id)
        tableView.backgroundColor = .white
        tableView.layer.borderColor = UIColor.black.cgColor
        return tableView
    }()
    
    
    private func configurate() {
        
        view.addSubview(cryptoTableView)
        
                NSLayoutConstraint.activate([
                    
                    cryptoTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                    cryptoTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                    cryptoTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
                    cryptoTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
                    
                    
                    
                ])
    }
}

extension CryptoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyInfo?.cryptocurrencies.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == (currencyInfo?.cryptocurrencies.count ?? 0) - 1 {
            presenter.scrollEnd()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: CryptoCell.id, for: indexPath) as! CryptoCell
        
        guard let model = currencyInfo?.cryptocurrencies[indexPath.row] else {return cell}
        
        cell.state = model
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.cellTapped(indexPath: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}

extension CryptoViewController: CurrencyView {
}



