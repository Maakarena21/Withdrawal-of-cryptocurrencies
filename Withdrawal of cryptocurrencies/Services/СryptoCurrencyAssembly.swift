//
//  Š”ryptoCurrencyAssembly.swift
//  Withdrawal of cryptocurrencies
//
//  Created by Silence on 21.09.2021.
//

import EasyDi


class Š”ryptoCurrencyAssembly: Assembly {
    private lazy var network: NetworkAssembly = context.assembly()
    var service: CryptoCurrencyService {
        define(init: CryptoCurrencyServiceImpl()) {
            $0.network = self.network.network
            return $0
        }
    }
    
}
