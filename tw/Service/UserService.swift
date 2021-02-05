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

class UserService: UserServiceProtocol {
    
    func getUser() -> AnyPublisher<User, APIError> {
    //TODO: Change to Textfield grabbed username
        return APIClient.request(api: .user(username: "sp-seekers"), returnType: User.self)
    }
    
    func getRepositories() -> AnyPublisher<[Repository], APIError> {
    //TODO: Change to Textfield grabbed username
        return APIClient.request(api: .repos(username: "sp-seekers"), returnType: [Repository].self)
    }
}
