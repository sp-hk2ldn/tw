//
//  MockUserResponse.swift
//  twTests
//
//  Created by Stephen Parker on 1/2/2021.
//

@testable import tw
import Foundation
import Combine


class MockUserResponse {
    @Published var user: User
    
    init() {
        user = User(login: "octocat", name: "Mr Octocat", location: "The Sea", followers: 3500, following: 0)
    }
    
    func getUserResponse() -> AnyPublisher<User, APIError> {
        return $user.mapError { APIError(error: $0) }.eraseToAnyPublisher()
    }
}
