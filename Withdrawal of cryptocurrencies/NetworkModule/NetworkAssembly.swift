//
//  NetworkAssembly.swift
//  Withdrawal of cryptocurrencies
//
//  Created by Silence on 19.09.2021.
//

import EasyDi

class NetworkAssembly: Assembly {
    var network: NetworkService {
       define(init: NetworkServiceImpl())
    }
}
