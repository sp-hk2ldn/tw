//
//  MockReportService.swift
//  twTests
//
//  Created by Stephen Parker on 31/1/2021.
//

@testable import tw
import Foundation

class MockUserService: UserServiceProtocol {
    func getUser(completion: @escaping ((Result<User, APIError>) -> Void)) {
        completion(.success(MockUserResponse().getUserResponse()))
    }   
    
}
