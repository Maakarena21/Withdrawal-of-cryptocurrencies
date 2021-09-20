//
//  Network.swift
//  Withdrawal of cryptocurrencies
//
//  Created by Silence on 19.09.2021.
//

import UIKit
import Combine



enum NetworkServiceError: Error {
    case internalError
    case networkError(Error)
}

protocol NetworkService {
    func getRequest<T: Decodable>(url: URL) -> AnyPublisher<T, NetworkServiceError>
}

class NetworkServiceImpl: NetworkService {
    func getRequest<T>(url: URL) -> AnyPublisher<T, NetworkServiceError> where T : Decodable {
        return URLSession
            .shared
            .dataTaskPublisher(for: url)
            .tryMap { (data: Data, response: URLResponse) -> T in
                try JSONDecoder().decode(T.self, from: data)
            }.mapError {
                .networkError($0)
            }
            .eraseToAnyPublisher()
    }
    

}
