//
//  CryptoViewController.swift
//  Withdrawal of cryptocurrencies
//
//  Created by Silence on 19.09.2021.
//

import UIKit
import Kingfisher


struct СurrencyInfo {
    var cryptocurrencies: [Cryptocurrency]
}

protocol CurrencyView: AnyObject {
    var currencyInfo: СurrencyInfo? { get set }
}

class CryptoViewController: UIViewController {

    var currencyInfo: СurrencyInfo? {
        didSet {
            CryptoTableView.reloadData()
        }
    }

    var presenter: CryptoPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CryptoTableView.delegate = self
        CryptoTableView.dataSource = self
        presenter.viewLoaded()
        configurate()
    }
    
    private lazy var CryptoTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CryptoCell.self, forCellReuseIdentifier: CryptoCell.id)
        tableView.backgroundColor = .white
        tableView.layer.borderColor = UIColor.black.cgColor
        return tableView
    }()
    
    
    private func configurate() {
        
        view.addSubview(CryptoTableView)
        
                NSLayoutConstraint.activate([
                    
                    CryptoTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                    CryptoTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                    CryptoTableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
                    CryptoTableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
                    
                    
                    
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
        
        
        let url = URL(string: "https://3commas.io/ru\(currencyInfo?.cryptocurrencies[indexPath.row].logoURL ?? "")")
        cell.images.kf.setImage(with: url)
        

        cell.nameLabel.text = currencyInfo?.cryptocurrencies[indexPath.row].name
        cell.symbolLabel.text = currencyInfo?.cryptocurrencies[indexPath.row].symbol
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.cellTapped(indexPath: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
//    private func animateTableView() {
//
//        let cells = CryptoTableView.visibleCells
//        let tableViewHeight = CryptoTableView.bounds.height
//        var delay: Double = 0
//
//        for cell in cells {
//            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
//
//            UIView.animate(withDuration:
//                            1.5,
//                           delay: delay * 0.05,
//                           usingSpringWithDamping: 0.0,
//                           initialSpringVelocity: 0,
//                           options: .curveEaseInOut,
//                           animations: {
//                            cell.transform = CGAffineTransform.identity
//                           })
//        }
//    }
}

extension CryptoViewController: CurrencyView {
}



