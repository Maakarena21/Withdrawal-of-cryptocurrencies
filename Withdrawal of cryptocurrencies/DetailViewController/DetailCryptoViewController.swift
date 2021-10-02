

import UIKit


protocol DetailView: AnyObject {
    func display(cryptoName: String)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        

        presenter.viewLoaded()
        configurateConstraints()
        
        
    
    }
    
   private func configurateConstraints() {
        view.addSubview(cryptoLabel)
        
        NSLayoutConstraint.activate([
            cryptoLabel.topAnchor.constraint(equalTo: view.bottomAnchor, constant: 20),
            cryptoLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)

    ])
    }
}

extension DetailCryptoViewController: DetailView {
    func display(cryptoName: String) {
        cryptoLabel.text = cryptoName
    }
}
