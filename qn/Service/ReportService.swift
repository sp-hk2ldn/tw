//
//  AccountService.swift
//  qn
//
//  Created by Stephen Parker on 31/1/2021.
//

import Foundation

protocol AccountServiceProtocol {
    ///Provide functionality to retrieve a users account
    func getAccount(completion: @escaping ((Result<Account, APIError>) -> Void))
}

class AccountService: AccountServiceProtocol {
    
    func getAccount(completion: @escaping ((Result<Account, APIError>) -> Void)) {
        guard let url = URL(string: AppConfig().baseURL() + "/mockcredit/values") else { fatalError() }
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
                    try decoder.decode(Account.self, from: data)
                }).mapError { APIError(error: $0) }
                completion((result))
            }
        }.resume()
    }
}
