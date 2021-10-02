

import EasyDi

class DetailCryptoAssembly: Assembly {
    private lazy var router: RouterAssembly = context.assembly()
    
    func presenter(currency: Cryptocurrency, view: DetailView, viewController: UIViewController) -> DetailCryptoPresenter{
        define(init: DetailCryptoPresenterImpl()) {
            $0.currency = currency
            $0.view = view
            return $0
            
        }
    }
    
    func viewController(currency: Cryptocurrency) -> UIViewController {
        define(init: DetailCryptoViewController()) {
            $0.presenter = self.presenter(currency: currency
                                          , view: $0
                                          , viewController: $0)
            return $0
        }
    }
}
