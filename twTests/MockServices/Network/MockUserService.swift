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
    func getUserLocal() -> AnyPublisher<User, APIError> {
        return MockUserResponse().getUserResponse()
    }
    
    func getUserNetwork() -> AnyPublisher<User, APIError> {
        return MockUserResponse().getUserResponse()
    }
    
    func getRepositoriesLocal() -> AnyPublisher<[Repository], APIError> {
        return MockRepositoryResponse().getMockRespositoryResponse()
    }
    
    func getRepositoriesNetwork() -> AnyPublisher<[Repository], APIError> {
        return MockRepositoryResponse().getMockRespositoryResponse()
    }
    
    var realmClient: RealmProtocol
    
    init(realmClient: RealmProtocol) {
        self.realmClient = realmClient
    }

}
