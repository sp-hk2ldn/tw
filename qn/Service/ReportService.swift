//
//  ReportService.swift
//  qn
//
//  Created by Stephen Parker on 31/1/2021.
//

import Foundation
import Combine

class AppConfig {
    
    func baseURL() -> String {
        let rest_protocol = Bundle.main.infoDictionary!["rest_protocol"] as! String
        let host = Bundle.main.infoDictionary!["host"] as! String
        let env = Bundle.main.infoDictionary!["environment"] as! String
        return "\(rest_protocol)\(host)\(env)"
    }
}


protocol ReportServiceProtocol {
    func getCreditReport(completion: @escaping ((Result<AccountCredit, APIError>) -> Void))
}

class ReportService: ReportServiceProtocol {
    
    func getCreditReport(completion: @escaping ((Result<AccountCredit, APIError>) -> Void)) {
        guard let url = URL(string: AppConfig().baseURL() + "/mockcredit/values") else { fatalError() }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
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
                try decoder.decode(AccountCredit.self, from: data)
            }).mapError { APIError(error: $0) }
            completion((result))
        }.resume()
    }
}
