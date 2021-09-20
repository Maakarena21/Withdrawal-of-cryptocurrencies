//
//  CryptoCurrencyFile.swift
//  Withdrawal of cryptocurrencies
//
//  Created by Silence on 19.09.2021.
//

import Foundation
import Combine

protocol CryptoCurrencyService {
    func get(loadedCount: Int) -> AnyPublisher<CryptoResponse, NetworkServiceError>
    func search(substring: String, loadedCount: Int) -> AnyPublisher<CryptoResponse, NetworkServiceError>
    
}

class CryptoCurrencyServiceImpl: CryptoCurrencyService {
    var network: NetworkService!
    
    
    func search(substring: String, loadedCount: Int) -> AnyPublisher<CryptoResponse, NetworkServiceError> {
        buildUrl(substring: substring, loadedCount: loadedCount)
            .flatMap { self.network.getRequest(url: $0)  }.eraseToAnyPublisher()
        
    }
    
    func get(loadedCount: Int) -> AnyPublisher<CryptoResponse, NetworkServiceError> {
        buildUrl(substring: nil, loadedCount: loadedCount)
            .flatMap { self.network.getRequest(url: $0)  }.eraseToAnyPublisher()
    }
    
}
extension CryptoCurrencyServiceImpl {
    func buildUrl(substring: String?, loadedCount: Int) -> AnyPublisher <URL, NetworkServiceError> {
        let page = (loadedCount / 100) + 1
            
        
        var urlString = "https://3commas.io/ru/coin_market_cap/cryptocurrencies?convert=usd&cryptocurrency_type=all&page=\(page)&type=LOAD_CRYPTO_CURRENCIES"
        if let search = substring {
            urlString += "&search=\(search)"
        }
        if let url = URL(string: urlString)  {
            return Future { $0(.success(url)) }.eraseToAnyPublisher()
        } else {
            return Future { $0(.failure(NetworkServiceError.internalError)) }.eraseToAnyPublisher()
        }
    }
}
