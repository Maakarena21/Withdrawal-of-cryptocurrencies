

import UIKit


protocol DetailView: AnyObject {
    func display(cryptoName: String, price: String)
}
class DetailCryptoViewController: UIViewController {
    
    var presenter: DetailCryptoPresenter!
    
    
    
    let cryptoLabel: UILabel = {
        let cryptoName = UILabel()
        cryptoName.translatesAutoresizingMaskIntoConstraints = false
        cryptoName.layer.borderColor = UIColor.black.cgColor
        cryptoName.layer.borderWidth = 2
        cryptoName.textColor = .orange
        cryptoName.font = UIFont.systemFont(ofSize: 30)
        return cryptoName
    }()
    
    let cryptoPrice: UILabel = {
        let price = UILabel()
        price.translatesAutoresizingMaskIntoConstraints = false
        price.layer.borderColor = UIColor.black.cgColor
        price.layer.borderWidth = 2
        price.textColor = .black
        price.font = UIFont.systemFont(ofSize: 30)
        return price
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        

        presenter.viewLoaded()
        configurateConstraints()
        
        
    
    }
    
   private func configurateConstraints() {
        view.addSubview(cryptoLabel)
        view.addSubview(cryptoPrice)
        
        NSLayoutConstraint.activate([
            cryptoLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            cryptoLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            
            cryptoPrice.topAnchor.constraint(equalTo: cryptoLabel.bottomAnchor, constant: 10),
            cryptoPrice.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30)
            

    ])
    }
}

extension DetailCryptoViewController: DetailView {
    func display(cryptoName: String, price: String) {
        cryptoLabel.text = cryptoName
        cryptoPrice.text = price
       
    }
}
