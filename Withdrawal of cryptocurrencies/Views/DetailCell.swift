//
//  DetailCell.swift
//  Withdrawal of cryptocurrencies
//
//  Created by Silence on 23.09.2021.
//

import UIKit

class DetailCell: UITableViewCell {
    
    let slugLabel: UILabel = {
        let slugLabel = UILabel()
        slugLabel.translatesAutoresizingMaskIntoConstraints = false
        slugLabel.backgroundColor = .white
        slugLabel.layer.borderColor = UIColor.black.cgColor
        slugLabel.layer.borderWidth = 2
        return slugLabel
    }()
    
    let priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.backgroundColor = .white
        priceLabel.layer.borderColor = UIColor.black.cgColor
        priceLabel.layer.borderWidth = 2
        return priceLabel
    }()
}
