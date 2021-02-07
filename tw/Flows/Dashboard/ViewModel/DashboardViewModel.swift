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
    @Published var errorMessage: String?
    
    var anyErrorMessageCancellable: AnyCancellable?
    var userCancellable: AnyCancellable?
    var repositoriesCancellable: AnyCancellable?
    var cancellables = Set<AnyCancellable>()
    
    init(userService: UserServiceProtocol, coordinator: DashboardCoordinator) {
        self.userService = userService
        self.coordinator = coordinator
        getRepositories()
        getUser()
    }
    
    private func getRepositories() {
        self.repositoriesCancellable = userService.getRepositoriesNetwork().merge(with: userService.getRepositoriesLocal())
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { [weak self] completion in
                if case let .failure(error) = completion {
                    self?.coordinator.navigationController.showAlert(with: error)
                }
            }, receiveValue: { [weak self] (repositories) in
                self?.repositories = repositories
            })
    }
    
    private func getUser() {
        self.userCancellable = userService.getUserNetwork().merge(with: userService.getUserLocal())
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { [weak self] (completion) in
                if case let .failure(error) = completion {
                    self?.coordinator.navigationController.showAlert(with: error)
                }
            }, receiveValue: { [weak self] (user) in
                self?.user = user
            })
    }
}
