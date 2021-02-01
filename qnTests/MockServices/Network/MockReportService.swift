//
//  MockReportService.swift
//  qnTests
//
//  Created by Stephen Parker on 31/1/2021.
//

@testable import qn
import Foundation

class MockAccountService: AccountServiceProtocol {
    func getAccount(completion: @escaping ((Result<Account, APIError>) -> Void)) {
        completion(.success(MockAccountResponse().getAccountResponse()))
    }   
    
}
