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
    var currenciesState = [Cryptocurrency]()
    weak var view: CurrencyView?
    
    

        func scrollEnd() {
           cancellable = service.get(loadedCount: view?.currencyInfo?.cryptocurrencies.count ?? 0)
               .receive(on: DispatchQueue.main)
               .sink(receiveCompletion: {_ in}) {
                self.view?.currencyInfo?.cryptocurrencies.append(contentsOf: self.map($0.cryptocurrencies))
                self.currenciesState.append(contentsOf: $0.cryptocurrencies)
           }
       }
    
    func viewLoaded() {
        cancellable = service.get(loadedCount: 99)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {_ in}) {
                self.view?.currencyInfo = СurrencyInfo(cryptocurrencies: self.map($0.cryptocurrencies))
                self.currenciesState = $0.cryptocurrencies
            }
    }
    
    func cellTapped(indexPath: IndexPath) {
        router.cryptoDetails(currency: currenciesState[indexPath.row])
    }
    
    func map(_ cryptocurrencies: [Cryptocurrency]) -> [CellState] {
        cryptocurrencies.map{CellState(image: URL(string: "https://3commas.io/ru\($0.logoURL)"), name: $0.name, symbol: $0.symbol)}
    }
}

