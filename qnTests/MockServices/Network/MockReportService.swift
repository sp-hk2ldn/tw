//
//  MockReportService.swift
//  qnTests
//
//  Created by Stephen Parker on 31/1/2021.
//

@testable import qn
import Foundation

class MockReportService: ReportServiceProtocol {
    func getCreditReport(completion: @escaping ((Result<AccountCredit, APIError>) -> Void)) {
        completion(.success(MockAccountCreditResponse().getAccountCreditResponse()))
    }
    
    
}
