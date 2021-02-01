//
//  AccountService.swift
//  qn
//
//  Created by Stephen Parker on 31/1/2021.
//

import Foundation

class AppConfig {
    // swiftlint:disable force_cast
    // swiftlint:disable identifier_name
    ///Uses the environment variables specified in the targets config file
    func baseURL() -> String {
        let rest_protocol = Bundle.main.infoDictionary!["rest_protocol"] as! String
        let host = Bundle.main.infoDictionary!["host"] as! String
        let env = Bundle.main.infoDictionary!["environment"] as! String
        return "\(rest_protocol)\(host)\(env)"
    }
}


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
