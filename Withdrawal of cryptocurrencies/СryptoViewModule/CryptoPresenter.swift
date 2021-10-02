//
//  CryptoPresenter.swift
//  Withdrawal of cryptocurrencies
//
//  Created by Silence on 19.09.2021.
//

import Foundation
import Combine

protocol CryptoPresenter {
    func viewLoaded()
    func scrollEnd()
    func cellTapped(indexPath: IndexPath)
}

class CryptoPresenterImpl: CryptoPresenter {
   
    
    var service: CryptoCurrencyService!
    var cancellable: AnyCancellable?
    var router: Router!
    weak var view: CurrencyView?
    
    

        func scrollEnd() {
           cancellable = service.get(loadedCount: view?.currencyInfo?.cryptocurrencies.count ?? 0)
               .receive(on: DispatchQueue.main)
               .sink(receiveCompletion: {_ in}) { [weak self] in
                   self?.view?.currencyInfo?.cryptocurrencies.append(contentsOf: $0.cryptocurrencies)
           }
       }
    
    func viewLoaded() {
        cancellable = service.get(loadedCount: 99)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {_ in}) { [weak self] in
                self?.view?.currencyInfo = СurrencyInfo(cryptocurrencies: $0.cryptocurrencies)

            }
    }
    
    func cellTapped(indexPath: IndexPath) {
        guard let cryptoCurrency = view?.currencyInfo?.cryptocurrencies[indexPath.row] else {return}
        print(cryptoCurrency)
        router.cryptoDetails(currency: cryptoCurrency)
    }
}

