//
//  CryptoCell.swift
//  Withdrawal of cryptocurrencies
//
//  Created by Silence on 19.09.2021.
//

import UIKit

class CryptoCell: UITableViewCell {
    
   static let id = "cell_id"
    
    
    let view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 2
        view.layer.cornerRadius = 10
        
        
        
        return view
    }()
    
    let selectedView: UIView = {
            let view = UIView()
            view.backgroundColor = .systemGray
            view.layer.cornerRadius = 10
            return view
        }()

    let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.backgroundColor = .white
//        nameLabel.layer.borderColor = UIColor.black.cgColor
//        nameLabel.layer.borderWidth = 2
        
        return nameLabel
    }()
    
    
    let symbolLabel: UILabel = {
        let symbolLabel = UILabel()
        symbolLabel.translatesAutoresizingMaskIntoConstraints = false
        symbolLabel.backgroundColor = .white
//        symbolLabel.layer.borderColor = UIColor.black.cgColor
//        symbolLabel.layer.borderWidth = 2
        return symbolLabel
    }()
    
        let images: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
   
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
           backgroundColor = .white
           selectedBackgroundView = selectedView
            configurateElements()
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
    private func configurateElements() {
        
        contentView.addSubview(view)
        view.addSubview(nameLabel)
        view.addSubview(symbolLabel)
        view.addSubview(images)
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: contentView.topAnchor),
            view.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            view.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5),
            nameLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            
            symbolLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            symbolLabel.leftAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 5),
            symbolLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            
            images.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            images.leftAnchor.constraint(equalTo: symbolLabel.rightAnchor, constant: 5),
            images.widthAnchor.constraint(equalToConstant: 35),
            images.heightAnchor.constraint(equalToConstant: 35)
        ])
        
    }
}
