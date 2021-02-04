//
//  UserService.swift
//  tw
//
//  Created by Stephen Parker on 31/1/2021.
//

import Foundation

protocol UserServiceProtocol {
    ///Provide functionality to retrieve a users account
    func getUser(username: String, completion: @escaping ((Result<User, APIError>) -> Void))
    func getRepositories(username: String, completion: @escaping ((Result<[Repository], APIError>) -> Void))
}

class UserService: UserServiceProtocol {
    
    func getUser(username: String, completion: @escaping ((Result<User, APIError>) -> Void)) {
        //TODO: Change to Textfield grabbed username
        API.request(api: .user(username: "sp-seekers"), returnType: User.self, completion: completion)
        
    }
    
    func getRepositories(username: String, completion: @escaping ((Result<[Repository], APIError>) -> Void)) {
        //TODO: Change to Textfield grabbed username
        API.request(api: .repos(username: "sp-seekers"), returnType: [Repository].self, completion: completion)
    }
}
