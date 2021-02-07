//
//  UserService.swift
//  tw
//
//  Created by Stephen Parker on 31/1/2021.
//

import Foundation
import Combine

protocol UserServiceProtocol {
    ///Get a user locally
    func getUserLocal() -> AnyPublisher<User, APIError>
    ///Get a user from the network
    func getUserNetwork() -> AnyPublisher<User, APIError>
    ///Get a list of a users repositories locally
    func getRepositoriesLocal() -> AnyPublisher<[Repository], APIError>
    ///Get a list of a users repositories from the network
    func getRepositoriesNetwork() -> AnyPublisher<[Repository], APIError>
    
    var realmClient: RealmProtocol { get }
}

final class UserService: UserServiceProtocol {

    var realmClient: RealmProtocol
    @Published var user: User?
    @Published var repositories: [Repository]?
    
    var updatedUser: AnyCancellable?
    var updatedRepositories: AnyCancellable?
    
    var cancellables = Set<AnyCancellable>()
    
    init(realmClient: RealmProtocol) {
        self.realmClient = realmClient
        if let user = UserDefaults.standard.string(forKey: Constants.shared.usernameKey) {
            self.username = user
        } else {
            self.username = ""
        }
    }
    
    private var username: String
    
    func setUsername(username: String) {
        UserDefaults.standard.set(username, forKey: "currentUser")
    }
    
    func getUserLocal() -> AnyPublisher<User, APIError> {
        if let fetchedUser: User = realmClient.fetchWithPrimaryKey(User.self, primaryKey: username) as? User {
            self.user = fetchedUser
        }
        let user = $user.mapError { APIError(error: $0) }.compactMap { $0 }.eraseToAnyPublisher()
        return user
    }
    
    func getUserNetwork() -> AnyPublisher<User, APIError> {
        return APIClient.request(api: .user(username: username), returnType: User.self)
    }

    func getRepositoriesLocal() -> AnyPublisher<[Repository], APIError> {
        guard let login = UserDefaults.standard.string(forKey: Constants.shared.usernameKey) else { fatalError() }
        if let repositories = realmClient.fetchObjects(Repository.self) as? [Repository] {
            self.repositories = repositories.filter { $0.owner?.login == login }
        }
        let repositories = $repositories.mapError { APIError(error: $0) }.compactMap { $0 }.eraseToAnyPublisher()
        return repositories
    }
    
    func getRepositoriesNetwork() -> AnyPublisher<[Repository], APIError> {
        return APIClient.request(api: .repos(username: username), returnType: [Repository].self)
    }
    
}
