//
//  UserService.swift
//  qn
//
//  Created by Stephen Parker on 31/1/2021.
//

import Foundation

protocol UserServiceProtocol {
    ///Provide functionality to retrieve a users account
    func getUser(completion: @escaping ((Result<User, APIError>) -> Void))
}

class UserService: UserServiceProtocol {
    
    func getUser(completion: @escaping ((Result<User, APIError>) -> Void)) {
        guard let url = URL(string: AppConfig().baseURL()) else { fatalError() }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            DispatchQueue.main.async {
                guard let data = data else {
                    if let error = error.map({ (APIError(error: $0)) }) {
                        completion(.failure(error))
                        return
                    }
                    completion(.failure(.generic)) //Unknown Error.
                    return
                }
                let decoder = JSONDecoder()
                let result = Result(catching: {
                    try decoder.decode(User.self, from: data)
                }).mapError { APIError(error: $0) }
                completion((result))
            }
        }.resume()
    }
}
