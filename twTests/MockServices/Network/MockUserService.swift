//
//  MockUserService.swift
//  twTests
//
//  Created by Stephen Parker on 31/1/2021.
//

@testable import tw
import Foundation
import Combine


class MockUserService: UserServiceProtocol {
    
    
    func getRepositories() -> AnyPublisher<[Repository], APIError> {
        return MockRepositoryResponse().getMockRespositoryResponse()
    }
    
    
    func getUser() -> AnyPublisher<User, APIError> {
        return MockUserResponse().getUserResponse()
    }
}
