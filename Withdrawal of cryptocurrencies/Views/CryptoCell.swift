//
//  CryptoCell.swift
//  Withdrawal of cryptocurrencies
//
//  Created by Silence on 19.09.2021.
//

import UIKit

class CryptoCell: UITableViewCell {
    
   static let id = "cell_id"

    let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.backgroundColor = .white
        nameLabel.layer.borderColor = UIColor.black.cgColor
        nameLabel.layer.borderWidth = 2
        
        return nameLabel
    }()
    
    
    let symbolLabel: UILabel = {
        let symbolLabel = UILabel()
        symbolLabel.translatesAutoresizingMaskIntoConstraints = false
        symbolLabel.backgroundColor = .white
        symbolLabel.layer.borderColor = UIColor.black.cgColor
        symbolLabel.layer.borderWidth = 2
        return symbolLabel
    }()
    
    
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           backgroundColor = .white
            configurateElements()
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
    private func configurateElements() {
        
        
    }
}
