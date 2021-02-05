//
//  DashboardViewModel.swift
//  tw
//
//  Created by Stephen Parker on 30/1/2021.
//

import Foundation
import Combine

class DashboardViewModel {
    
    private var userService: UserServiceProtocol
    private var coordinator: DashboardCoordinator
    @Published var repositories: [Repository]?
    @Published var user: User?
    
    var userCancellable: AnyCancellable?
    var repositoriesCancellable: AnyCancellable?
    
    init(userService: UserServiceProtocol, coordinator: DashboardCoordinator) {
        self.userService = userService
        self.coordinator = coordinator
        getRepositories()
        getUser()
    }
    
    private func getRepositories() {
        self.repositoriesCancellable = userService.getRepositories()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.coordinator.navigationController.showAlert(with: error)
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] repositories in
                self?.repositories = repositories
            })
    }
    
    private func getUser() {
        self.userCancellable = userService.getUser()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case.failure(let error):
                    self?.coordinator.navigationController.showAlert(with: error)
                case .finished:
                    break
                }
        }, receiveValue: { [weak self] user in
            self?.user = user
        })
    }
}
