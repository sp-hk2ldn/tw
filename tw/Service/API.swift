//
//  APIClient.swift
//  tw
//
//  Created by Stephen Parker on 3/2/2021.
//

import Foundation
import Combine

class APIClient {
    
    static func request<T: Decodable>(api: GithubAPIService, returnType: T.Type?) -> AnyPublisher<T, APIError> {
        guard let url = URL(string: "\(api.baseURL)\(api.path)") else { fatalError() }
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, _) in
                return data
            }.decode(type: returnType!, decoder: JSONDecoder())
            .mapError { APIError(error: $0) }
            .eraseToAnyPublisher()
    }
}
