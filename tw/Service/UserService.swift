//
//  UserService.swift
//  tw
//
//  Created by Stephen Parker on 31/1/2021.
//

import Foundation
import Combine

protocol UserServiceProtocol {
    ///Get a user
    func getUser() -> AnyPublisher<User, APIError>
    ///Get a list of a users repositories
    func getRepositories() -> AnyPublisher<[Repository], APIError>
}

final class UserService: UserServiceProtocol {
    
    private var username: String?
    
    func setUsername(username: String) {
        self.username = username
    }
    
    func getUser() -> AnyPublisher<User, APIError> {
        guard let username = username else { fatalError() }
        return APIClient.request(api: .user(username: username), returnType: User.self)
    }
    
    func getRepositories() -> AnyPublisher<[Repository], APIError> {
        guard let username = username else { fatalError() }
        return APIClient.request(api: .repos(username: username), returnType: [Repository].self)
    }
}
