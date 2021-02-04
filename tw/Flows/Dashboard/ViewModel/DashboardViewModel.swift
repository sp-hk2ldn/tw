//
//  DashboardViewModel.swift
//  tw
//
//  Created by Stephen Parker on 30/1/2021.
//

import Foundation

class DashboardViewModel {
    
    private var userService: UserServiceProtocol
    private var coordinator: DashboardCoordinator
    private var user: User? {
        didSet {
            guard let user = user else { return }
            username = user.name
            location = user.location ?? ""
            followers = "\(user.followers)"
            following = "\(user.following)"
        }
    }
    private var repositories: [Repository] = [] {
        didSet {
            repositoryCount = "\(repositories.count)"
        }
    }
    var username: String = ""
    var location: String = ""
    var followers: String = ""
    var following: String = ""
    var repositoryCount: String = ""
    
    
    init(userService: UserServiceProtocol, coordinator: DashboardCoordinator) {
        self.userService = userService
        self.coordinator = coordinator
    }
    
    func retrieveUIData(completion: @escaping (() -> Void)) {
        self.getUser(completion: completion)
        self.getRepositories(completion: completion)
    }
    
    private func getRepositories(completion: @escaping (() -> Void)) {
        userService.getRepositories(username: username) { [weak self] result in
            switch result {
            case .failure(let error):
                self?.coordinator.navigationController.showGenericAlert(with: "Error", message: error.localizedDescription)
            case .success(let repositories):
                self?.repositories = repositories
                completion()
            }
        }
    }
    
    private func getUser(completion: @escaping (() -> Void)) {
        userService.getUser(username: username) { [weak self] result in
            switch result {
            case .failure(let error):
                self?.coordinator.navigationController.showGenericAlert(with: "Error", message: error.localizedDescription)
            case .success(let user):
                self?.user = user
                completion()
            }
        }
    }
}
