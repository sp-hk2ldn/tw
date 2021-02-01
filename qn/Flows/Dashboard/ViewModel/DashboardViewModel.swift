//
//  DashboardViewModel.swift
//  qn
//
//  Created by Stephen Parker on 30/1/2021.
//

import Foundation

class DashboardViewModel {
    
    private var accountService: AccountServiceProtocol!
    
    var creditScore: Int?
    var maxCreditScore: Int?
    
    private var account: Account? {
        didSet {
            self.creditScore = account?.creditReportInfo.score
            self.maxCreditScore = account?.creditReportInfo.maxScoreValue
        }
    }
    
    init(accountService: AccountServiceProtocol) {
        self.accountService = accountService
    }
    
    func getAccount(completion: @escaping ((APIError?) -> Void)) {
        accountService.getAccount { [weak self] (result) in
            switch result {
            case .failure(let error):
                completion(error)
            case .success(let account):
                self?.account = account
                completion(nil)
            }
        }
    }
}
