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
}

class CryptoPresenterImpl: CryptoPresenter {
    var cryptoCurrencyService: CryptoCurrencyService!
    var cancellable: AnyCancellable?
    weak var view: CurrencyView?
    
    
    func scrollEnd() {
        cryptoCurrencyService.get(loadedCount: view?.currencyInfo?.cryptocurrencies.count ?? 0)
    }
    
    
    
    func viewLoaded() {
        
    }
}
