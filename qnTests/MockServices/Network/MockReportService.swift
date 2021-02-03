//
//  MockReportService.swift
//  qnTests
//
//  Created by Stephen Parker on 31/1/2021.
//

@testable import qn
import Foundation

class MockUserService: UserServiceProtocol {
    func getUser(completion: @escaping ((Result<User, APIError>) -> Void)) {
        completion(.success(MockUserResponse().getUserResponse()))
    }   
    
}
