
import UIKit

protocol DetailCryptoPresenter {
    func viewLoaded()
}

class DetailCryptoPresenterImpl: DetailCryptoPresenter {
    weak var view: DetailView?
    var currency: Cryptocurrency!
    
    func viewLoaded() {
        view?.display(cryptoName: currency.name)
    }
    
}
