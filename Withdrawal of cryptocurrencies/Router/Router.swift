

import UIKit


protocol Router {
    func cryptoDetails(currency: Cryptocurrency)
}

class RouterImpl: Router {
    weak var viewController: UIViewController?
    
    
    func cryptoDetails(currency: Cryptocurrency) {
        let vc = DetailCryptoAssembly.instance().viewController(currency: currency)
        viewController?.present(vc, animated: true, completion: nil)
    }
}
