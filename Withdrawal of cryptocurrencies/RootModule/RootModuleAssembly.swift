//
//  RootModuleAssembly.swift
//  Withdrawal of cryptocurrencies
//
//  Created by Silence on 19.09.2021.
//

import EasyDi


class RootModuleAssembly: Assembly {
    private lazy var network: NetworkAssembly = context.assembly()
    private lazy var service: СryptoCurrencyAssembly = context.assembly()
    private lazy var router: RouterAssembly = context.assembly()
    
    func viewController() -> UIViewController  {
        define(init: CryptoViewController()) {
            $0.presenter = self.presenter(view: $0, viewController: $0)
            return $0
        }
    }
    
    func presenter(view: CurrencyView, viewController: UIViewController) -> CryptoPresenter {
        define(init: CryptoPresenterImpl()) {
            $0.view = view
            $0.service = self.service.service
            $0.router = self.router.router(view: viewController)
            return $0
        }
       
    }
}

